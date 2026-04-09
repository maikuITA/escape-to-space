-- data-updates.lua

local planet = data.raw["planet"]["nauvis"]
if planet then
    planet.asteroid_spawn_definitions = planet.asteroid_spawn_definitions or {}
    table.insert(planet.asteroid_spawn_definitions, {
        type = "asteroid-chunk",    -- keep as-is
        asteroid = "irony-asteroid-chunk",
        probability = 0.01,        -- tweak spawn frequency relative to others
        speed = 0.01,                -- optional: orbital drift
        angle_when_stopped = 1.0,   -- optional
    })
    table.insert(planet.asteroid_spawn_definitions, {
        type = "asteroid-chunk",
        asteroid = "coppery-asteroid-chunk",
        probability = 0.01,
        speed = 0.01,
        angle_when_stopped = 1.0,
    })
end