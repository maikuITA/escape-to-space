-- data-updates.lua

local asteroid_util = require("__escape-to-space__/prototypes/asteroid-spawn-definitions")

local function is_default_nauvis_chunk(name)
    return name == "metallic-asteroid-chunk"
        or name == "carbonic-asteroid-chunk"
        or name == "oxide-asteroid-chunk"
end

local function remove_default_nauvis_chunks(plan)
    local defs = plan.asteroid_spawn_definitions or {}
    for i = #defs, 1, -1 do
        local def = defs[i]
        if def
            and def.type == "asteroid-chunk"
            and is_default_nauvis_chunk(def.asteroid) then
            table.remove(defs, i)
        end
    end
end

local function find_spawn_def(defs, asteroid_name)
    for _, def in pairs(defs or {}) do
        if def.type == "asteroid-chunk" and def.asteroid == asteroid_name then
            return def
        end
    end
    return nil
end

local function insert_chunk_like(plan, source_chunk, new_chunk, probability)
    plan.asteroid_spawn_definitions = plan.asteroid_spawn_definitions or {}
    local src = find_spawn_def(plan.asteroid_spawn_definitions, source_chunk)
    if not src then
        return false
    end

    local copy = table.deepcopy(src)
    copy.asteroid = new_chunk
    copy.probability = probability
    table.insert(plan.asteroid_spawn_definitions, copy)
    return true
end

local earth = data.raw["planet"]["nauvis"]
if earth then
    -- 1) Copy metallic spawn profile to custom chunks (no hardcoded probability).
    insert_chunk_like(earth, "metallic-asteroid-chunk", "irony-asteroid-chunk", asteroid_util.nauvis_prob)
    insert_chunk_like(earth, "metallic-asteroid-chunk", "coppery-asteroid-chunk", asteroid_util.nauvis_prob)
    insert_chunk_like(earth, "metallic-asteroid-chunk", "rocky-asteroid-chunk", asteroid_util.nauvis_prob)

    -- 2) Remove vanilla Nauvis chunk spawns.
    remove_default_nauvis_chunks(earth)
end

local axos = data.raw["space-location"]["axos"]
if axos then
  axos.asteroid_spawn_definitions = {
    { type = "asteroid-chunk", asteroid = "carbonic-asteroid-chunk", probability = asteroid_util.axos_prob, speed = 0.01, angle_when_stopped = 1.0 },
    { type = "asteroid-chunk", asteroid = "rocky-asteroid-chunk", probability = asteroid_util.axos_prob, speed = 0.01, angle_when_stopped = 1.0 }
  }
end

local keria = data.raw["space-location"]["keria"]
if keria then
  keria.asteroid_spawn_definitions = {
    { type = "asteroid-chunk", asteroid = "oxide-asteroid-chunk", probability = asteroid_util.keria_prob, speed = 0.01, angle_when_stopped = 1.0 },
    { type = "asteroid-chunk", asteroid = "rocky-asteroid-chunk", probability = asteroid_util.keria_prob, speed = 0.01, angle_when_stopped = 1.0 }
  }
end

-- CREDITS: yunrus-space-block
-- Hide and disable the void chest recipe to prevent bypassing intended progression,
-- while keeping the prototype available for internal/indirect usage.
local recipe = data.raw.recipe["void-chest"]
if recipe then
    recipe.enabled = false   -- disables crafting
    recipe.hidden = true     -- hides from crafting menu and techs
    recipe.allow_as_intermediate = false -- optional: stops auto-use in factories
    recipe.ingredients = recipe.ingredients or {} -- keep ingredients, don't touch
end

local item = data.raw.item["void-chest"]
if item then
  -- Retheme the item to match the platform trash depot identity in this scenario.
  item.icon = "__escape-to-space__/graphics/icons/platform-trash-depot.png"
  item.icon_size = 64
end

local chest = data.raw["infinity-container"]["void-chest"]
if chest then
  -- Override visuals for consistency: avoid exposing default art that suggests base behavior.
  chest.picture = {
    layers = {
      {
        filename = "__escape-to-space__/graphics/entity/platform-trash-depot/platform-trash-depot.png",
        width = 66,
        height = 76,
        shift = util.by_pixel(0, -2),
        scale = 0.5,
        hr_version = {
          filename = "__escape-to-space__/graphics/entity/platform-trash-depot/platform-trash-depot.png",
          width = 66,
          height = 76,
          shift = util.by_pixel(0, -2),
          scale = 0.5
        }
      }
    }
  }
end

-- Hiding specific recipes from the player

local to_hide = {
    "crush-metallic-asteroid-chunk"
}

for _, name in pairs(to_hide) do
    local recipe = data.raw.recipe[name]
    if recipe then
        recipe.enabled = false
        recipe.hidden = true
    end
end

-- Remove gravity limitation from chests to allow use in space platforms.
local chest_types = {"steel-chest", "iron-chest", "wooden-chest", "void-chest"}
for _, chest_name in pairs(chest_types) do
    local chest = data.raw["container"][chest_name]
    if chest then
        chest.gravity_pull = 0
    end
end