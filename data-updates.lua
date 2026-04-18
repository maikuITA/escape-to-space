-- data-updates.lua

local asteroid_util = require("__escape-to-space__.prototypes.asteroid-spawn-definitions")

-- Updating asteroid spawn definitions for vanilla planets and space locations with local file

-- Nauvis
local planet_nauvis = data.raw["planet"]["nauvis"]
if planet_nauvis then
    planet_nauvis.asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus, 0.1)
end

-- Vulcanus
local planet_vulcanus = data.raw["planet"]["vulcanus"]
if planet_vulcanus then
    planet_vulcanus.asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus, 0.9)
end

-- Fulgora
local planet_fulgora = data.raw["planet"]["fulgora"]
if planet_fulgora then
    planet_fulgora.asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_fulgora, 0.9)
end

-- Gleba
local planet_gleba = data.raw["planet"]["gleba"]
if planet_gleba then
    planet_gleba.asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_gleba, 0.9)
end

-- Aquilo
local planet_aquilo = data.raw["planet"]["aquilo"]
if planet_aquilo then
    planet_aquilo.asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.fulgora_aquilo, 0.9)
end

-- Solar system edge
local solar_system_edge = data.raw["space-location"]["solar-system-edge"]
if solar_system_edge then
    solar_system_edge.asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.aquilo_solar_system_edge, 0.9)
end

-- Shattered planet
local shattered_planet = data.raw["space-location"]["shattered-planet"]
if shattered_planet then
    shattered_planet.asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.shattered_planet_trip, 0.9)
end

---------------------------------------------------------------

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
    "radio-terminal",
}

for _, name in pairs(to_hide) do
    local recipe = data.raw.recipe[name]
    if recipe then
        recipe.enabled = false
        recipe.hidden = true
    end
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
        {type = "item", name = "sand", amount = 25},
        {type = "item", name = "carbon-wire", amount = 25}
    }
    space_platf.energy_required = 8
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
        {type = "item", name = "sand", amount = 2},
        {type = "item", name = "copper-ore", amount = 1}
    }
    thrust_fuel.results = {
        {type = "fluid", name = "thruster-fuel", amount = 90},
    }
    thrust_fuel.main_product = "thruster-fuel"
end

local thrust_oxy = data.raw.recipe["thruster-oxidizer"]
if thrust_oxy then
    thrust_oxy.ingredients = {
        {type = "item", name = "sand", amount = 2},
        {type = "item", name = "iron-ore", amount = 1}
    }
    thrust_oxy.results = {
        {type = "fluid", name = "thruster-oxidizer", amount = 90},
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
        {type = "item", name = "carbon-electronic-circuit", amount = 50},
        {type = "item", name = "electronic-circuit", amount = 50},
        {type = "item", name = "carbon-steel-plate", amount = 50},
        {type = "item", name = "refined-concrete", amount = 50}
    }
end

local electronic_circuit_custom = table.deepcopy(data.raw.recipe["electronic-circuit"])
if electronic_circuit_custom then
    electronic_circuit_custom.name = "electronic-circuit-custom-em-plant"
    electronic_circuit_custom.category = "custom-em-plant"
    electronic_circuit_custom.localised_name = {"recipe-name.electronic-circuit"}
    electronic_circuit_custom.allow_decomposition = false
    data:extend({electronic_circuit_custom})
end

local advanced_circuit = data.raw.recipe["advanced-circuit"]
if advanced_circuit then
    advanced_circuit.category = "custom-em-plant"
    advanced_circuit.ingredients = {
        {type = "item", name = "copper-cable", amount = 2},
        {type = "item", name = "electronic-circuit", amount = 2},
        {type = "item", name = "silicon-bar", amount = 2}
    }
end

local processing_unit = data.raw.recipe["processing-unit"]
if processing_unit then
    processing_unit.category = "custom-em-plant"
end

local lds = data.raw.recipe["low-density-structure"]
if lds then
    lds.category = "custom-em-plant"
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

local foundry = data.raw.recipe["foundry"]
if foundry then
    foundry.ingredients = {
        {type = "item", name = "carbon-steel-plate", amount = 50},
        {type = "item", name = "oxidic-electronic-circuit", amount = 30},
        {type = "item", name = "tungsten-carbide", amount = 50},
        {type = "item", name = "refined-concrete", amount = 20},
        {type = "fluid", name = "lubricant", amount = 20}
    }
end

-- Customizing Foundry recipes with a new category and recipe

local foundry = data.raw["assembling-machine"]["foundry"]
if foundry then
    foundry.crafting_categories = {"custom-metallurgy"}
    foundry.effect_receiver = { base_effect = { productivity = 0.25 }}
end

-- Solar panel mk2
local solar_panel_mk2 = table.deepcopy(data.raw["solar-panel"]["solar-panel"])
if solar_panel_mk2 then
    solar_panel_mk2.name = "solar-panel-mk2"
    solar_panel_mk2.localised_name = {"entity-name.solar-panel-mk2"}
    solar_panel_mk2.icon = "__escape-to-space__/graphics/icons/solar-panel-mk2.png"
    solar_panel_mk2.icon_size = 64
    solar_panel_mk2.minable.result = "solar-panel-mk2"
    solar_panel_mk2.production = "120kW"
    solar_panel_mk2.picture =
    {
      layers =
      {
        {
          filename = "__escape-to-space__/graphics/entity/solar-panel-mk2/solar-panel-mk2.png",
          priority = "high",
          width = 230,
          height = 224,
          shift = util.by_pixel(-3, 3.5),
          scale = 0.5
        },
        {
          filename = "__escape-to-space__/graphics/entity/solar-panel-mk2/solar-panel-mk2-shadow.png",
          priority = "high",
          width = 220,
          height = 180,
          shift = util.by_pixel(9.5, 6),
          draw_as_shadow = true,
          scale = 0.5
        }
      }
    }
    data:extend({solar_panel_mk2})
end

-- Solar panel mk3
local solar_panel_mk3 = table.deepcopy(data.raw["solar-panel"]["solar-panel"])
if solar_panel_mk3 then
    solar_panel_mk3.name = "solar-panel-mk3"
    solar_panel_mk3.localised_name = {"entity-name.solar-panel-mk3"}
    solar_panel_mk3.icon = "__escape-to-space__/graphics/icons/solar-panel-mk3.png"
    solar_panel_mk3.icon_size = 64
    solar_panel_mk3.minable.result = "solar-panel-mk3"
    solar_panel_mk3.production = "240kW"
    solar_panel_mk3.picture =
    {
      layers =
      {
        {
          filename = "__escape-to-space__/graphics/entity/solar-panel-mk3/solar-panel-mk3.png",
          priority = "high",
          width = 230,
          height = 224,
          shift = util.by_pixel(-3, 3.5),
          scale = 0.5
        },
        {
          filename = "__escape-to-space__/graphics/entity/solar-panel-mk3/solar-panel-mk3-shadow.png",
          priority = "high",
          width = 220,
          height = 180,
          shift = util.by_pixel(9.5, 6),
          draw_as_shadow = true,
          scale = 0.5
        }
      }
    }
    data:extend({solar_panel_mk3})
end