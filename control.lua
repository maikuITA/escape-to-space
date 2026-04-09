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

-- Default techs that need to be granted to avoid progression deadlocks in a space-first start.
local default_techs = {
    "rocket-silo",
    "automation",
    "solar-energy",
    "asteroid-reprocessing",
    "steel-processing",
    "engine",
    "electric-mining-drill",
    "electric-energy-distribution-1",
    "electric-energy-distribution-2",
    "heavy-armor",
    "modular-armor",
    "power-armor",
    "power-armor-mk2",
    "mech-armor",
    "automobilism",
    "construction-robotics",
    "logistic-robotics",
    "circuit-network"
}

script.on_init(function()
    -- Pending teleports are deferred until the character entity exists.
    storage.pending_teleport = {}

    -- Grant baseline technologies to avoid planet-first progression deadlocks.
    for _, tech_name in ipairs(default_techs) do
        local tech = game.forces.player.technologies[tech_name]
        if tech then
            tech.researched = true
        end
    end

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
local function setup_platform_for_player(player)
    local force = player.force

    if not force.is_space_platforms_unlocked() then
        force.unlock_space_platforms()
    end

    local platform = force.create_space_platform{
        planet = "nauvis",
        name = player.name .. "'s Elia",
        starter_pack = { name = "space-platform-starter-pack", count = 1}
    }
    platform:apply_starter_pack()
    local hub = platform.hub
    if hub then
        local inv = hub.get_inventory(defines.inventory.chest)
        inv.clear()
        inv.insert({ name = "crusher", count = 1 })
        inv.insert({ name = "asteroid-collector", count = 1 })
        inv.insert({ name = "inserter", count = 20 })
        inv.insert({ name = "assembling-machine-1", count = 5 })
        inv.insert({ name = "electric-furnace", count = 2 })
        inv.insert({ name = "solar-panel", count = 5 })
        inv.insert({ name = "space-platform-foundation", count = 200})
    end
    return platform
end

-- First spawn: create platform and queue deferred teleport.
-- Why: immediate teleport in the same event can fail before character creation finishes.
script.on_event(defines.events.on_player_created, function(event)
    local player = game.get_player(event.player_index)
    local platform = setup_platform_for_player(player)
    storage.pending_teleport[player.index] = platform
end)

-- Deferred transfer worker.
-- Edge cases: waits for a valid character, keeps pending entry until success,
-- and only then clears it to avoid losing state during spawn timing races.
script.on_event(defines.events.on_tick, function(event)
    for player_index, platform in pairs(storage.pending_teleport) do
        local player = game.get_player(player_index)
        if player.character and player.character.valid then
            player.get_main_inventory().clear()
            player.enter_space_platform(platform)
            local hub = platform.hub
            if hub then
                player.teleport(hub.position, platform.surface)
            end
            -- Keep the player in remote controller mode for platform-centric gameplay.
            player.set_controller{ type = defines.controllers.remote }
            storage.pending_teleport[player_index] = nil
        end
    end
end)

-- Respawn path mirrors first spawn to keep scenario constraints consistent.
script.on_event(defines.events.on_player_respawned, function(event)
    local player = game.get_player(event.player_index)
    local platform = setup_platform_for_player(player)
    storage.pending_teleport[player.index] = platform
end)