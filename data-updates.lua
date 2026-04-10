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
    "carbonic-asteroid-reprocessing",
    "oxide-asteroid-reprocessing",
    "metallic-asteroid-reprocessing",
    "metallic-asteroid-crushing",
    "small-electric-pole",
    "medium-electric-pole",
    "big-electric-pole",
    "substation",
    "roboport",
    "logistic-robot",
    "construction-robot",
    "defender-capsule",
    "distractor-capsule",
    "destroyer-capsule",
    "discharge-defense-equipment",
    "energy-shield-equipment",
    "personal-laser-defense-equipment",
    "personal-roboport-equipment",
    "personal-roboport-mk2-equipment",
    "exoskeleton-equipment",
    "battery-equipment",
    "solar-panel-equipment",
    "fusion-reactor-equipment",
    "car",
    "tank",
    "spidertron",
    "artillery-wagon",
    "logistic-train-stop",
    "rail-signal",
    "rail-chain-signal",
    "train-stop",
    "locomotive",
    "cargo-wagon",
    "fluid-wagon",
    "artillery-turret",
    "active-provider-chest",
    "passive-provider-chest",
    "storage-chest",
    "buffer-chest",
    "requester-chest",
    "burner-mining-drill",
    "electric-mining-drill",
    "big-mining-drill",
    "burner-mining-drill-recycling",
    "electric-mining-drill-recycling",
    "big-mining-drill-recycling",
    "offshore-pump",
    "pumpjack",
    "light-armor",
    "heavy-armor",
    "modular-armor",
    "power-armor",
    "power-armor-mk2",
    "mech-armor",
    "rocket-silo",
    "space-platform-starter-pack",
    "cargo-landing-pad",
    "wooden-chest",
    --"iron-chest",
    "steel-chest",
    "automation-science-pack",
    "logistic-science-pack",
    "chemical-science-pack",
    "space-science-pack",
    "production-science-pack",
    "high-tech-science-pack",
    "military-science-pack",
    "utility-science-pack",
    "stone-furnace",
    "steel-furnace",
    "burner-inserter",  
}

for _, name in pairs(to_hide) do
    local recipe = data.raw.recipe[name]
    if recipe then
        recipe.enabled = false
        recipe.hidden = true
    end
end

-- Modifying specific recipies

local space_platf = data.raw.recipe["space-platform-foundation"]
if space_platf then
    space_platf.ingredients = {
        {type = "item", name = "sand", amount = 50},
        {type = "item", name = "iron-stick", amount = 50}
    }
end

local ast_collector = data.raw.recipe["asteroid-collector"]
if ast_collector then
    ast_collector.ingredients = {
        {type = "item", name = "carbon-wheel", amount = 10},
        {type = "item", name = "electronic-circuit", amount = 10},
        {type = "item", name = "engine-unit", amount = 10}
    }
end

local crusher = data.raw.recipe["crusher"]
if crusher then
    crusher.ingredients = {
        {type = "item", name = "carbon-wheel", amount = 10},
        {type = "item", name = "electronic-circuit", amount = 10},
        {type = "item", name = "engine-unit", amount = 10}
    }
    
end

local cargo_bay = data.raw.recipe["cargo-bay"]
if cargo_bay then
    cargo_bay.ingredients = {
        {type = "item", name = "carbon-wheel", amount = 10},
        {type = "item", name = "iron-chest", amount = 10},
    }
end

local thruster = data.raw.recipe["thruster"]
if thruster then
    thruster.ingredients = {
        {type = "item", name = "iron-gear-wheel", amount = 10},
        {type = "item", name = "electronic-circuit", amount = 10},
        {type = "item", name = "engine-unit", amount = 10}
    }
end

local gun_turret = data.raw.recipe["gun-turret"]
if gun_turret then
    gun_turret.ingredients = {
        {type = "item", name = "iron-plate", amount = 20},
        {type = "item", name = "copper-plate", amount = 10},
        {type = "item", name = "carbon-wheel", amount = 10}
    }
end

local melting = data.raw.recipe["ice-melting"]
if melting then
    table.insert(melting.results, {type = "item", name = "sand", amount = 1, probability = 0.01})
    melting.main_product = "water"
end

local thrust_fuel = data.raw.recipe["thruster-fuel"]
if thrust_fuel then
    thrust_fuel.ingredients = {
        {type = "item", name = "sand", amount = 4},
        {type = "item", name = "copper-ore", amount = 2}
    }
    thrust_fuel.results = {
        {type = "fluid", name = "thruster-fuel", amount = 240},
    }
    thrust_fuel.main_product = "thruster-fuel"
end

local thrust_oxy = data.raw.recipe["thruster-oxidizer"]
if thrust_oxy then
    thrust_oxy.ingredients = {
        {type = "item", name = "sand", amount = 4},
        {type = "item", name = "iron-ore", amount = 2}
    }
    thrust_oxy.results = {
        {type = "fluid", name = "thruster-oxidizer", amount = 240},
    }
    thrust_oxy.main_product = "thruster-oxidizer"
end

local fast_inserter = data.raw.recipe["fast-inserter"]
if fast_inserter then
    fast_inserter.ingredients = {
        {type = "item", name = "carbon-stick", amount = 2},
        {type = "item", name = "electronic-circuit", amount = 2},
        {type = "item", name = "inserter", amount = 1}
    }
end

-- Adding custom science packs as a lab input to allow researching trigger techs that require it.

local lab = data.raw.lab["lab"]
if lab then
    lab.inputs = lab.inputs or {}
    table.insert(lab.inputs, "earth-science-pack")
    table.insert(lab.inputs, "axkeria-science-pack")
end