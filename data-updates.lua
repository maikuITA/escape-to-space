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

-- Adding custom science packs as a lab input to allow researching trigger techs that require it.

local lab = data.raw.lab["lab"]
if lab then
    lab.inputs = lab.inputs or {}
    table.insert(lab.inputs, "earth-science-pack")
    table.insert(lab.inputs, "axkeria-science-pack")
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

-- Changing piercing-rounds-magazine icon
local piercing_rounds_magazine = data.raw.ammo["piercing-rounds-magazine"]
if piercing_rounds_magazine then
  piercing_rounds_magazine.icons = nil
  piercing_rounds_magazine.icon = "__escape-to-space__/graphics/icons/piercing-rounds-magazine.png"
  piercing_rounds_magazine.icon_size = 64
  piercing_rounds_magazine.icon_mipmaps = nil
end

-- Changing piercing-rounds-magazine recipe icon
local r = data.raw.recipe["piercing-rounds-magazine"]
if r then
  r.icons = nil
  r.icon = "__escape-to-space__/graphics/icons/piercing-rounds-magazine.png"
  r.icon_size = 64
  r.icon_mipmaps = nil
end

-- Modifying specific recipies

local space_platf = data.raw.recipe["space-platform-foundation"]
if space_platf then
    space_platf.ingredients = {
        {type = "item", name = "sand", amount = 50},
        {type = "item", name = "carbon-wire", amount = 50}
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

local pi_ro_ma = data.raw.recipe["piercing-rounds-magazine"]
if pi_ro_ma then
    pi_ro_ma.ingredients = {
        {type = "item", name = "steel-plate", amount = 1},
        {type = "item", name = "carbon-plate", amount = 4},
        {type = "item", name = "firearm-magazine", amount = 2}
    }

end

local asm2 = data.raw.recipe["assembling-machine-2"]
if asm2 then
    asm2.ingredients = {
        {type = "item", name = "carbon-wheel", amount = 10}, 
        {type = "item", name = "steel-plate", amount = 4},
        {type = "item", name = "electronic-circuit", amount = 6},
        {type = "item", name = "assembling-machine-1", amount = 1}
    }
end

local elec_furnace = data.raw.recipe["electric-furnace"]
if elec_furnace then
    elec_furnace.ingredients = {
        {type = "item", name = "carbon-engine-unit", amount = 10},
        {type = "item", name = "electronic-circuit", amount = 10},
        {type = "item", name = "stone-brick", amount = 10}
    }
end

local fast_transport_belt = data.raw.recipe["fast-transport-belt"]
if fast_transport_belt then
    fast_transport_belt.ingredients = {
        {type = "item", name = "carbon-wheel", amount = 5},
        {type = "item", name = "transport-belt", amount = 1}
    }
end

local fast_underground_belt = data.raw.recipe["fast-underground-belt"]
if fast_underground_belt then
    fast_underground_belt.ingredients = { 
        {type = "item", name = "carbon-wheel", amount = 40},
        {type = "item", name = "underground-belt", amount = 2}
    }   
end

local fast_splitter = data.raw.recipe["fast-splitter"]
if fast_splitter then
    fast_splitter.ingredients = {
        {type = "item", name = "carbon-wheel", amount = 10},
        {type = "item", name = "electronic-circuit", amount = 10},
        {type = "item", name = "splitter", amount = 1}
    }
end

local express_belt = data.raw.recipe["express-transport-belt"]
if express_belt then
    express_belt.ingredients = {
        {type = "item", name = "oxidic-gear-wheel", amount = 10},
        {type = "item", name = "fast-transport-belt", amount = 1},
        {type = "fluid", name = "lubricant", amount = 20}
    }
end

local express_underground_belt = data.raw.recipe["express-underground-belt"]
if express_underground_belt then
    express_underground_belt.ingredients = {
        {type = "item", name = "oxidic-gear-wheel", amount = 80},
        {type = "item", name = "fast-underground-belt", amount = 2},
        {type = "fluid", name = "lubricant", amount = 40}
    }
end

local express_splitter = data.raw.recipe["express-splitter"]
if express_splitter then
    express_splitter.ingredients = {
        {type = "item", name = "oxidic-gear-wheel", amount = 20},
        {type = "item", name = "advanced-circuit", amount = 10},
        {type = "item", name = "fast-splitter", amount = 1},
        {type = "fluid", name = "lubricant", amount = 80}
    }
end

local firearm_magazine = data.raw.recipe["firearm-magazine"]
if firearm_magazine then
    firearm_magazine.enabled = false
end

-- Customizing EM Plant recipes with a new category and recipe

local em_plant = data.raw["assembling-machine"]["electromagnetic-plant"]
em_plant.crafting_categories = {"custom-em-plant"}

local em_plant_recipe = data.raw.recipe["electromagnetic-plant"]
if em_plant_recipe then
    em_plant_recipe.ingredients = {
        {type = "item", name = "steel-plate", amount = 50},
        {type = "item", name = "electronic-circuit", amount = 50},
        {type = "item", name = "carbon-steel-plate", amount = 50},
        {type = "item", name = "refined-concrete", amount = 50}
    }
end

local electronic_circuit = table.deepcopy(data.raw.recipe["electronic-circuit"])
if electronic_circuit then
    electronic_circuit.category = "custom-em-plant"
end

data.extend({electronic_circuit})

local advanced_circuit = data.raw.recipe["advanced-circuit"]
if advanced_circuit then
    advanced_circuit.category = "custom-em-plant"
    advanced_circuit.ingredients = {
        {type = "item", name = "copper-cable", amount = 2},
        {type = "item", name = "electronic-circuit", amount = 2},
        {type = "item", name = "silicon-bar", amount = 2}
    }
end

local beacon = data.raw.recipe["beacon"]
if beacon then
    beacon.category = "custom-em-plant"
    beacon.ingredients = {
        {type = "item", name = "carbon-steel-plate", amount = 10},
        {type = "item", name = "copper-plate", amount = 10},
        {type = "item", name = "advanced-circuit", amount = 20},
        {type = "item", name = "refined-concrete", amount = 9}
    }
end

local laser_turret = data.raw.recipe["laser-turret"]
if laser_turret then
    laser_turret.category = "advanced-crafting"
    laser_turret.ingredients = {
        {type = "item", name = "battery", amount = 12},
        {type = "item", name = "electronic-circuit", amount = 20},
        {type = "item", name = "carbon-steel-plate", amount = 20},
        {type = "item", name = "refined-concrete", amount = 4}
    }
end