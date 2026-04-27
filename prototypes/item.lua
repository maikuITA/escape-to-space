-- item.lua

local item_sounds = require("__base__.prototypes.item_sounds")
local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")

--------------------------------------------------------------------------
--- START ASTEROIDS

-- Irony asteroid chunk
local irony_asteroid_chunk = {
  type = "item",
  name = "irony-asteroid-chunk",
  icon = "__escape-to-space__/graphics/icons/irony-asteroid-chunk.png",
  icon_size = 64,
  subgroup = "raw-material",
  order = "a[raw]-a[irony-asteroid-chunk]",
  stack_size = 1
}

data:extend({irony_asteroid_chunk})

-- Coppery asteroid chunk
local coppery_asteroid_chunk = {
  type = "item",
  name = "coppery-asteroid-chunk",
  icon = "__escape-to-space__/graphics/icons/coppery-asteroid-chunk.png",
  icon_size = 64,
  subgroup = "raw-material",
  order = "a[raw]-b[coppery-asteroid-chunk]",
  stack_size = 1
}

data:extend({coppery_asteroid_chunk})

-- Rocky asteroid chunk
local rocky_asteroid_chunk = {
  type = "item",
  name = "rocky-asteroid-chunk",
  icon = "__escape-to-space__/graphics/icons/rocky-asteroid-chunk.png",
  icon_size = 64,
  subgroup = "raw-material",
  order = "a[raw]-c[rocky-asteroid-chunk]",
  stack_size = 1
}

data:extend({rocky_asteroid_chunk})

-- Tungsten asteroid chunk
local tungsten_asteroid_chunk = {
  type = "item",
  name = "tungsten-asteroid-chunk",
  icon = "__escape-to-space__/graphics/icons/tungsten-asteroid-chunk.png",
  icon_size = 64,
  subgroup = "raw-material",
  order = "a[raw]-d[tungsten-asteroid-chunk]",
  stack_size = 1
}

data:extend({tungsten_asteroid_chunk})

-- Scrap asteroid chunk
local scrap_asteroid_chunk = {
  type = "item",
  name = "scrap-asteroid-chunk",
  icon = "__escape-to-space__/graphics/icons/scrap-asteroid-chunk.png",
  icon_size = 64,
  subgroup = "raw-material",
  order = "a[raw]-e[scrap-asteroid-chunk]",
  stack_size = 1
}

data:extend({scrap_asteroid_chunk})

-- Alien asteroid chunk
local alien_asteroid_chunk = {
  type = "item",
  name = "alien-asteroid-chunk",
  icon = "__escape-to-space__/graphics/icons/alien-asteroid-chunk.png",
  icon_size = 64,
  subgroup = "raw-material",
  order = "a[raw]-f[alien-asteroid-chunk]",
  stack_size = 1
}

data:extend({alien_asteroid_chunk})

-- Fluorite asteroid chunk
local fluorite_asteroid_chunk = {
  type = "item",
  name = "fluorite-asteroid-chunk",
  icon = "__escape-to-space__/graphics/icons/fluorite-asteroid-chunk.png",
  icon_size = 64,
  subgroup = "raw-material",
  order = "a[raw]-f[fluorite-asteroid-chunk]",
  stack_size = 1
}

data:extend({fluorite_asteroid_chunk})

--- END ASTEROIDS
--------------------------------------------------------------------------

--------------------------------------------------------------------------
--- START MACHINES

-- Basic electric furnace
local basic_electric_furnace = {
  type = "item",
  name = "basic-electric-furnace",
  icon = "__escape-to-space__/graphics/icons/basic-electric-furnace.png",
  icon_size = 64,
  subgroup = "production-machine",
  order = "a[production-machine]-a[basic-electric-furnace]",
  place_result = "basic-electric-furnace",
  stack_size = 50
}

data:extend({basic_electric_furnace})

-- Cybernetics facility
local cybernetics_facility = {
  type = "item",
  name = "cybernetics-facility",
  icon = "__escape-to-space__/graphics/icons/cybernetics-facility-icon.png",
  icon_size = 64,
  subgroup = "production-machine",
  order = "a[production-machine]-b[cybernetics-facility]",
  place_result = "cybernetics-facility",
  stack_size = 50
}

data:extend({cybernetics_facility})

-- Mixing station
local mixing_station = {
  type = "item",
  name = "mixing-station",
  icon = "__escape-to-space__/graphics/icons/mixing-station-icon.png",
  icon_size = 64,
  subgroup = "production-machine",
  order = "a[production-machine]-c[mixing-station]",
  place_result = "mixing-station",
  stack_size = 50
}

data:extend({mixing_station})

-- Chemical stager
local chemical_stager = {
  type = "item",
  name = "chemical-stager",
  icon = "__escape-to-space__/graphics/icons/chemical-stager-icon.png",
  icon_size = 64,
  subgroup = "production-machine",
  order = "a[production-machine]-d[chemical-stager]",
  place_result = "chemical-stager",
  stack_size = 50
}

data:extend({chemical_stager})

-- Quantum stabilizer
local quantum_stabilizer = {
  type = "item",
  name = "quantum-stabilizer",
  icon = "__escape-to-space__/graphics/icons/quantum-stabilizer-icon.png",
  icon_size = 64,
  subgroup = "production-machine",
  order = "a[production-machine]-e[quantum-stabilizer]",
  place_result = "quantum-stabilizer",
  stack_size = 50
}

data:extend({quantum_stabilizer})

-- Gravity assembler
local gravity_assembler = {
  type = "item",
  name = "gravity-assembler",
  icon = "__escape-to-space__/graphics/icons/gravity-assembler-icon.png",
  icon_size = 64,
  subgroup = "production-machine",
  order = "a[production-machine]-f[gravity-assembler]",
  place_result = "gravity-assembler",
  stack_size = 50
}

data:extend({gravity_assembler})

-- Greenhouse
local greenhouse = {
  type = "item",
  name = "greenhouse",
  icon = "__escape-to-space__/graphics/icons/greenhouse-icon.png",
  icon_size = 64,
  subgroup = "production-machine",
  order = "a[production-machine]-g[greenhouse]",
  place_result = "greenhouse",
  stack_size = 50
}

data:extend({greenhouse})

-- Arc furnace
local arc_furnace = {
  type = "item",
  name = "arc-furnace",
  icon = "__escape-to-space__/graphics/icons/arc-furnace-icon.png",
  icon_size = 64,
  subgroup = "production-machine",
  order = "a[production-machine]-h[arc-furnace]",
  place_result = "arc-furnace",
  stack_size = 50
}

data:extend({arc_furnace})

-- Oxide lab
local oxide_lab = {
  type = "item",
  name = "oxide-lab",
  icon = "__escape-to-space__/graphics/icons/oxide-lab-icon.png",
  icon_size = 64,
  subgroup = "production-machine",
  order = "a[production-machine]-i[oxide-lab]",
  place_result = "oxide-lab",
  stack_size = 50
}

data:extend({oxide_lab})

-- Cybernetic lab
local cybernetic_lab = {
  type = "item",
  name = "cybernetic-lab",
  icon = "__escape-to-space__/graphics/icons/cybernetic-lab-icon.png",
  icon_size = 64,
  subgroup = "production-machine",
  order = "a[production-machine]-j[cybernetic-lab]",
  place_result = "cybernetic-lab",
  stack_size = 50
}

data:extend({cybernetic_lab})

-- Scrubber
local scrubber = {
  type = "item",
  name = "scrubber",
  icon = "__escape-to-space__/graphics/icons/scrubber-icon.png",
  icon_size = 64,
  subgroup = "production-machine",
  order = "a[production-machine]-k[scrubber]",
  place_result = "scrubber",
  stack_size = 50
}

data:extend({scrubber})

-- Scrubber mk2
local scrubber_mk2 = {
    type = "item",
    name = "scrubber-mk2",
    icon = "__escape-to-space__/graphics/icons/scrubber-icon.png",
    icon_size = 64,
    subgroup = "production-machine",
    order = "a[production-machine]-l[scrubber-mk2]",
    place_result = "scrubber-mk2",
    stack_size = 50
}

data:extend({scrubber_mk2})

-- Scrubber mk3
local scrubber_mk3 = {
    type = "item",
    name = "scrubber-mk3",
    icon = "__escape-to-space__/graphics/icons/scrubber-icon.png",
    icon_size = 64,
    subgroup = "production-machine",
    order = "a[production-machine]-m[scrubber-mk3]",
    place_result = "scrubber-mk3",
    stack_size = 50
}

data:extend({scrubber_mk3})

--- END MACHINES
--------------------------------------------------------------------------

--------------------------------------------------------------------------
--- START TOOLS

-- Blank data disk
local blank_data_disk = {
    type = "item",
    name = "blank-data-disk",
    icon = "__escape-to-space__/graphics/icons/blank-data-disk.png",
    icon_size = 64,
    subgroup = "tool",
    order = "a[raw]-i[blank-data-disk]",
    stack_size = 200,
    weight = 1*kg,
}

data:extend({blank_data_disk})

-- Basic data disk
local basic_data_disk = {
  type = "tool",
  name = "basic-data-disk",
  icon = "__escape-to-space__/graphics/icons/basic-data-disk.png",
  icon_size = 64,
  subgroup = "tool",
  order = "a[tool]-a[data-disk-mk1]",
  stack_size = 200,
  weight = 1*kg,
  durability = 1,
  durability_description_key = "description.science-pack-remaining-amount-key",
  factoriopedia_durability_description_key = "description.factoriopedia-science-pack-remaining-amount-key",
  durability_description_value = "description.science-pack-remaining-amount-value",
}

data:extend({basic_data_disk})

-- Data disk mk1
local data_disk_mk1 = {
  type = "tool",
  name = "data-disk-mk1",
  icon = "__escape-to-space__/graphics/icons/data-disk-mk1.png",
  icon_size = 64,
  subgroup = "tool",
  order = "a[tool]-b[data-disk-mk1]",
  stack_size = 200,
  weight = 1*kg,
  durability = 1,
  durability_description_key = "description.science-pack-remaining-amount-key",
  factoriopedia_durability_description_key = "description.factoriopedia-science-pack-remaining-amount-key",
  durability_description_value = "description.science-pack-remaining-amount-value",
}

data:extend({data_disk_mk1})

--- END TOOLS
--------------------------------------------------------------------------

--------------------------------------------------------------------------
--- START ITEMS

-- Sand
local sand = {
    type = "item",
    name = "sand",
    icon = "__escape-to-space__/graphics/icons/sand.png",
    icon_size = 64,
    subgroup = "raw-material",
    order = "a[raw]-g[sand]",
    stack_size = 100
}

data:extend({sand})

-- Gravel
local gravel = {
    type = "item",
    name = "gravel",
    icon = "__escape-to-space__/graphics/icons/gravel.png",
    icon_size = 64,
    subgroup = "raw-material",
    order = "a[raw]-h[gravel]",
    stack_size = 100
}

data:extend({gravel})

-- Carbon gear wheel
local carbon_gear_wheel = {
    type = "item",
    name = "carbon-gear-wheel",
    icon = "__escape-to-space__/graphics/icons/carbon-gear-wheel.png",
    icon_size = 64,
    subgroup = "intermediate-product",
    order = "a[intermediate]-a[carbon-gear-wheel]",
    stack_size = 100
}

data:extend({carbon_gear_wheel})

-- Carbon plate
local carbon_plate = {
    type = "item",
    name = "carbon-plate",
    icon = "__escape-to-space__/graphics/icons/carbon-plate.png",
    icon_size = 64,
    subgroup = "intermediate-product",
    order = "a[intermediate]-b[carbon-plate]",
    stack_size = 100
}

data:extend({carbon_plate})

-- Carbon wire 
local carbon_wire = {
    type = "item",
    name = "carbon-wire",
    icon = "__escape-to-space__/graphics/icons/carbon-wire.png",
    icon_size = 64,
    subgroup = "intermediate-product",
    order = "a[intermediate]-c[carbon-wire]",
    stack_size = 200
}

data:extend({carbon_wire})

-- Carbon stick
local carbon_stick = {
    type = "item",
    name = "carbon-stick",
    icon = "__escape-to-space__/graphics/icons/carbon-stick.png",
    icon_size = 64,
    subgroup = "intermediate-product",
    order = "a[intermediate]-d[carbon-stick]",
    stack_size = 200
}

data:extend({carbon_stick})

-- Carbon pipe
local carbon_pipe = {
    type = "item",
    name = "carbon-pipe",
    icon = "__escape-to-space__/graphics/icons/carbon-pipe.png",
    icon_size = 64,
    subgroup = "intermediate-product",
    order = "a[intermediate]-e[carbon-pipe]",
    stack_size = 200
}

data:extend({carbon_pipe})

-- Carbon engine unit
local carbon_engine_unit = {
  type = "item",
  name = "carbon-engine-unit",
  icon = "__escape-to-space__/graphics/icons/carbon-engine-unit.png",
  icon_size = 64,
  subgroup = "intermediate-product",
  order = "a[intermediate]-f[carbon-engine-unit]",
  stack_size = 50
}

data:extend({carbon_engine_unit})

-- Void chest
local void_chest = data.raw.item["void-chest"]
if void_chest then
  -- Retheme the item to match the platform trash depot identity in this scenario.
  void_chest.icon = "__escape-to-space__/graphics/icons/platform-trash-depot.png"
  void_chest.icon_size = 64
end

-- Oxidic ore
local oxidic_ore = {
  type = "item",
  name = "oxidic-ore",
  icon = "__escape-to-space__/graphics/icons/oxidic-ore.png",
  subgroup = "intermediate-product",
  order = "z[oxidic-ore]",
  inventory_move_sound = space_age_item_sounds.space_age_item_sounds,
  stack_size = data.raw.item["pipe"].stack_size,
  weight = data.raw.item["pipe"].weight,
  random_tint_color = item_tints.iron_rust
}

data:extend({oxidic_ore})

-- Oxidic plate
local oxidic_plate = {
  type = "item",
  name = "oxidic-plate",
  icon = "__escape-to-space__/graphics/icons/oxidic-plate.png",
  subgroup = "intermediate-product",
  order = "z[oxidic-plate]",
  inventory_move_sound = space_age_item_sounds.space_age_item_sounds,
  stack_size = data.raw.item["pipe"].stack_size,
  weight = data.raw.item["pipe"].weight,
  random_tint_color = item_tints.iron_rust
}
data:extend({oxidic_plate})

-- Oxidic gear wheel
local oxidic_gear_wheel = {
  type = "item",
  name = "oxidic-gear-wheel",
  icon = "__escape-to-space__/graphics/icons/oxidic-gear-wheel.png",
  subgroup = "intermediate-product",
  order = "z[oxidic-gear-wheel]",
  inventory_move_sound = space_age_item_sounds.space_age_item_sounds,
  stack_size = data.raw.item["pipe"].stack_size,
  weight = data.raw.item["pipe"].weight,
  random_tint_color = item_tints.iron_rust
}
data:extend({oxidic_gear_wheel})

-- Oxidic stick
local oxidic_stick = {
  type = "item",
  name = "oxidic-stick",
  icon = "__escape-to-space__/graphics/icons/oxidic-stick.png",
  subgroup = "intermediate-product",
  order = "z[oxidic-stick]",
  inventory_move_sound = space_age_item_sounds.space_age_item_sounds,
  stack_size = data.raw.item["pipe"].stack_size,
  weight = data.raw.item["pipe"].weight,
  random_tint_color = item_tints.iron_rust
}
data:extend({oxidic_stick})

-- Oxidic cable
local oxidic_cable = {
  type = "item",
  name = "oxidic-cable",
  icon = "__escape-to-space__/graphics/icons/oxidic-cable.png",
  subgroup = "intermediate-product",
  order = "z[oxidic-cable]",
  inventory_move_sound = space_age_item_sounds.space_age_item_sounds,
  stack_size = data.raw.item["pipe"].stack_size,
  weight = data.raw.item["pipe"].weight,
  random_tint_color = item_tints.iron_rust
}
data:extend({oxidic_cable})

-- Oxidic electronic circuit
local oxidic_electronic_circuit = {
  type = "item",
  name = "oxidic-electronic-circuit",
  icon = "__escape-to-space__/graphics/icons/oxidic-electronic-circuit.png",
  subgroup = "intermediate-product",
  order = "z[oxidic-electronic-circuit]",
  inventory_move_sound = space_age_item_sounds.space_age_item_sounds,
  stack_size = data.raw.item["pipe"].stack_size,
  weight = data.raw.item["pipe"].weight,
  random_tint_color = item_tints.iron_rust
}
data:extend({oxidic_electronic_circuit})

-- Oxidic roudns magazine
local oxidic_rounds_magazine = {
  type = "ammo",
  name = "oxidic-rounds-magazine",
  icon = "__escape-to-space__/graphics/icons/oxidic-rounds-magazine.png",
  ammo_category = "bullet",
  ammo_type =
  {
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        source_effects =
        {
          type = "create-explosion",
          entity_name = "explosion-gunshot",
          only_when_visible = true
        },
        target_effects =
        {
          {
            type = "create-entity",
            entity_name = "explosion-hit",
            offsets = {{0, 1}},
            offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}},
            only_when_visible = true
          },
          {
            type = "damage",
            damage = {amount = 16, type = "physical"}
          },
          {
            type = "activate-impact",
            deliver_category = "bullet"
          }
        }
      }
    }
  },
  magazine_size = 10,
  subgroup = "ammo",
  order = "a[basic-clips]-b[oxidic-rounds-magazine]",
  inventory_move_sound = item_sounds.ammo_small_inventory_move,
  pick_sound = item_sounds.ammo_small_inventory_pickup,
  drop_sound = item_sounds.ammo_small_inventory_move,
  stack_size = 100,
  weight = 20*kg
}

data:extend({oxidic_rounds_magazine})