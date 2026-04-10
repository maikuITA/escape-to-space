-- control.lua

-- Periodically resolves platforms stuck waiting for a starter pack.
-- Why: in this scenario, platforms may share the same orbit; an already active
-- platform can donate one starter pack item to unblock another waiting platform.
-- Edge cases: no donor in same orbit, donor hub missing the exact pack variant,
-- or multiple waiting platforms in the same tick.
local function on_tick(event)
    -- Re-assert early quality progression even across lifecycle edge cases.
    game.forces.player.unlock_quality("uncommon")
    for _, force in pairs(game.forces) do
        for _, p in pairs(force.platforms) do
            if p.state == defines.space_platform_state.waiting_for_starter_pack then
                local n = p.space_location.name
                local pack = p.starter_pack
                for _, other_platform in pairs(force.platforms) do
                    if p.index ~= other_platform.index and other_platform.space_location ~= nil and other_platform.space_location.name == n and other_platform.state ~= defines.space_platform_state.waiting_for_starter_pack then
                        local hub = other_platform.hub
                        if hub.get_item_count(pack) > 0 then
                            local r = hub.remove_item({name=pack["name"], quality=pack["quality"], count=1})
                            if r == 1 then
                                p.apply_starter_pack()
                                -- Stop donor scanning after first successful transfer.
                                goto applied_pack
                            end
                        end
                    end
                end
            end
            ::applied_pack::
        end
    end
end

-- Centralizes event registration so init/load/config-change stay consistent.
local function init_events()
    script.on_nth_tick(30, on_tick)
end

local HOME_PLATFORM_NAME = "Noah's Ark"
local setup_platform_for_player

local function get_force_platform_by_index(force, platform_index)
    if not force or not platform_index then
        return nil
    end

    for _, platform in pairs(force.platforms) do
        if platform and platform.valid and platform.index == platform_index then
            return platform
        end
    end
    return nil
end

local function find_named_home_platform(force)
    if not force then
        return nil
    end

    for _, platform in pairs(force.platforms) do
        if platform and platform.valid and platform.name == HOME_PLATFORM_NAME then
            return platform
        end
    end

    return nil
end

local function get_or_create_home_platform(player)
    local force = player.force
    local force_index = force.index

    storage.home_platform_by_force = storage.home_platform_by_force or {}

    local saved_index = storage.home_platform_by_force[force_index]
    local platform = get_force_platform_by_index(force, saved_index)
    if platform then
        return platform
    end

    platform = find_named_home_platform(force)
    if platform then
        storage.home_platform_by_force[force_index] = platform.index
        return platform
    end

    platform = setup_platform_for_player(player)
    storage.home_platform_by_force[force_index] = platform.index
    return platform
end

script.on_init(function()
    -- Pending teleports are deferred until the character entity exists.
    storage.pending_teleport = {}
    storage.home_platform_by_force = {}

    -- Grant baseline technologies to avoid planet-first progression deadlocks.
    --for _, tech_name in ipairs(default_techs) do
        --local tech = game.forces.player.technologies[tech_name]
        --if tech then
            --tech.researched = true
        --end
    --end

    -- Auto researching trigger tech(s)
    --for name, tech in pairs(game.forces.player.technologies) do
        --if tech.prototype.research_trigger and next(tech.prototype.research_trigger) ~= nil then
            --tech.researched = true
        --end
    --end

    -- Enforce the core rule: players can orbit planets but cannot land on them.
    game.permissions
        .get_group("Default")
        .set_allows_action(defines.input_action.land_at_planet, false)
    game.permissions
        .get_group("Default")
        .set_allows_action(defines.input_action.send_stack_to_trash, false)
    game.permissions
        .get_group("Default")
        .set_allows_action(defines.input_action.send_stacks_to_trash, false)

    local freeplay = remote.interfaces["freeplay"]
    -- Disable Freeplay intro/crashsite flow because this scenario starts in space.
    if freeplay then
        if freeplay["set_skip_intro"] then remote.call("freeplay", "set_skip_intro", true) end
        if freeplay["set_disable_crashsite"] then remote.call("freeplay", "set_disable_crashsite", true) end
    end

    init_events()

end)

script.on_load(function()
    -- Reinitialize transient tables and rebind handlers after save load.
    storage.pending_teleport = storage.pending_teleport or {}
    storage.home_platform_by_force = storage.home_platform_by_force or {}
    init_events()
end)

script.on_configuration_changed(function()
    -- Reapply permissions after migrations because external changes can reset groups.
    game.permissions
        .get_group("Default")
        .set_allows_action(defines.input_action.land_at_planet, false)
    init_events()
end)

-- Creates and provisions a personal starter platform for one player.
-- Why: this scenario's core loop begins in orbit and must be deterministic.
-- Edge cases: force may not have platforms unlocked yet; hub might be unavailable
-- briefly, so inventory setup is guarded by a hub check.
setup_platform_for_player = function(player)
    local force = player.force

    if not force.is_space_platforms_unlocked() then
        force.unlock_space_platforms()
    end

    local platform = force.create_space_platform{
        planet = "nauvis",
        name = "Noah's Ark",
        starter_pack = { name = "space-platform-starter-pack", count = 1}
    }
    platform:apply_starter_pack()
    local hub = platform.hub
    if hub then
        local inv = hub.get_inventory(defines.inventory.chest)
        inv.clear()
        inv.insert({ name = "crusher", count = 4 })
        inv.insert({ name = "asteroid-collector", count = 1 })
        inv.insert({ name = "inserter", count = 20 })
        inv.insert({ name = "assembling-machine-1", count = 5 })
        inv.insert({ name = "basic-electric-furnace", count = 3 })
        inv.insert({ name = "solar-panel", count = 10 })
        inv.insert({ name = "space-platform-foundation", count = 500})
    end
    return platform
end

-- First spawn: create platform and queue deferred teleport.
-- Why: immediate teleport in the same event can fail before character creation finishes.
script.on_event(defines.events.on_player_created, function(event)
    local player = game.get_player(event.player_index)
    local platform = get_or_create_home_platform(player)
    storage.pending_teleport[player.index] = platform.index
end)

-- Deferred transfer worker.
-- Edge cases: waits for a valid character, keeps pending entry until success,
-- and only then clears it to avoid losing state during spawn timing races.
script.on_event(defines.events.on_tick, function(event)
    for player_index, platform_index in pairs(storage.pending_teleport) do
        local player = game.get_player(player_index)

        if player and player.valid and player.character and player.character.valid then
            local platform = get_force_platform_by_index(player.force, platform_index)

            if not platform then
                platform = get_or_create_home_platform(player)
                storage.pending_teleport[player_index] = platform.index
            end

            player.get_main_inventory().clear()
            player.enter_space_platform(platform)

            local hub = platform.hub
            if hub then
                player.teleport(hub.position, platform.surface)
            end

            player.set_controller{ type = defines.controllers.remote }
            storage.pending_teleport[player_index] = nil
        end
    end
end)

-- Respawn path mirrors first spawn to keep scenario constraints consistent.
script.on_event(defines.events.on_player_respawned, function(event)
    local player = game.get_player(event.player_index)
    local platform = get_or_create_home_platform(player)
    storage.pending_teleport[player.index] = platform.index
end)