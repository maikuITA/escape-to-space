-- control.lua

local function on_tick(event)
    game.forces.player.unlock_quality("uncommon")
    for _, force in pairs(game.forces) do
        for _, p in pairs(force.platforms) do
            if p.state == defines.space_platform_state.waiting_for_starter_pack then
                local n = p.space_location.name
                local pack = p.starter_pack
                -- log("platform:" .. p.name .. " needs starter pack")
                for _, other_platform in pairs(force.platforms) do
                    if p.index ~= other_platform.index and other_platform.space_location ~= nil and other_platform.space_location.name == n and other_platform.state ~= defines.space_platform_state.waiting_for_starter_pack then
                        local hub = other_platform.hub
                        if hub.get_item_count(pack) > 0 then
                            local r = hub.remove_item({name=pack["name"], quality=pack["quality"], count=1})
                            if r == 1 then
                                p.apply_starter_pack()
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

local function init_events()

        -- script.on_event(defines.events.on_tick, on_tick)
        script.on_nth_tick(30, on_tick)

end

local techs_enabled = {
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
        "logistic-robotics"

}

script.on_init(function()
    storage.pending_teleport = {}

    for _, tech_name in ipairs(techs_enabled) do
        local tech = game.forces.player.technologies[tech_name]
        if tech then
            tech.researched = true
        end
    end

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
    if freeplay then -- Disable freeplay popup-message
        if freeplay["set_skip_intro"] then remote.call("freeplay", "set_skip_intro", true) end
        if freeplay["set_disable_crashsite"] then remote.call("freeplay", "set_disable_crashsite", true) end
    end

    init_events()

end)

script.on_load(function()
    storage.pending_teleport = storage.pending_teleport or {}
    init_events()
end)

script.on_configuration_changed(function()
    game.permissions
        .get_group("Default")
        .set_allows_action(defines.input_action.land_at_planet, false)
    init_events()
end)

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
    local setting_name = "yunrus-space-block-quick-start"
    if settings.global[setting_name] and settings.global[setting_name].value then
        if hub then
            local inv = hub.get_inventory(defines.inventory.chest)
            inv.clear()
            inv.insert({ name = "crusher", count = 10 })
            inv.insert({ name = "asteroid-collector", count = 10 })
            inv.insert({ name = "inserter", count = 150 })
            inv.insert({ name = "assembling-machine-1", count = 50 })
            inv.insert({ name = "electric-furnace", count = 50 })
            inv.insert({ name = "solar-panel", count = 50 })
            inv.insert({ name = "transport-belt", count = 400})
            inv.insert({ name = "space-platform-foundation", count = 2000})
        end
    else
        if hub then
            local inv = hub.get_inventory(defines.inventory.chest)
            inv.clear()
            inv.insert({ name = "crusher", count = 1 })
            inv.insert({ name = "asteroid-collector", count = 1 })
            inv.insert({ name = "inserter", count = 20 })
            inv.insert({ name = "assembling-machine-1", count = 5 })
            inv.insert({ name = "electric-furnace", count = 3 })
            inv.insert({ name = "solar-panel", count = 5 })
            inv.insert({ name = "space-platform-foundation", count = 200})
        end
    end




    return platform
    -- player.enter_space_platform(platform)
    -- player.teleport(hub.position, platform.surface)
end

-- FIRST SPAWN / JOIN create platform and mark player for teleport
script.on_event(defines.events.on_player_created, function(event)
    local player = game.get_player(event.player_index)
    local platform = setup_platform_for_player(player)
    storage.pending_teleport[player.index] = platform
end)

-- Wait until character exists, then enter + teleport
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
            player.set_controller{ type = defines.controllers.remote }
            storage.pending_teleport[player_index] = nil
        end
    end
end)

-- RESPAWN AFTER DEATH
script.on_event(defines.events.on_player_respawned, function(event)
    local player = game.get_player(event.player_index)
    local platform = setup_platform_for_player(player)
    storage.pending_teleport[player.index] = platform
end)