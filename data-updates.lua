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

local function find_spawn_def(defs, asteroid_name)
    for _, def in pairs(defs or {}) do
        if def.type == "asteroid-chunk" and def.asteroid == asteroid_name then
            return def
        end
    end
    return nil
end

local function insert_chunk_like(plan, source_chunk, new_chunk)
    plan.asteroid_spawn_definitions = plan.asteroid_spawn_definitions or {}
    local src = find_spawn_def(plan.asteroid_spawn_definitions, source_chunk)
    if not src then
        return false
    end

    local copy = table.deepcopy(src)
    copy.asteroid = new_chunk
    table.insert(plan.asteroid_spawn_definitions, copy)
    return true
end

local planet = data.raw["planet"]["nauvis"]
if planet then
    insert_chunk_like(planet, "metallic-asteroid-chunk", "irony-asteroid-chunk")
    insert_chunk_like(planet, "metallic-asteroid-chunk", "coppery-asteroid-chunk")
end