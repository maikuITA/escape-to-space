local item_sounds = require("__base__.prototypes.item_sounds")
local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")

data:extend({
  -- Asteroids
  {
    type = "item",
    name = "irony-asteroid-chunk",
    icon = "__escape-to-space__/graphics/icons/irony-asteroid-chunk.png",
    subgroup = "space-material",
    order = "d[rocky]-e[chunk]",
    inventory_move_sound = space_age_item_sounds.rock_inventory_move,
    pick_sound = space_age_item_sounds.rock_inventory_pickup,
    drop_sound = space_age_item_sounds.rock_inventory_move,
    stack_size = 1,
    weight = 100 * kg,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "item",
    name = "coppery-asteroid-chunk",
    icon = "__escape-to-space__/graphics/icons/coppery-asteroid-chunk.png",
    subgroup = "space-material",
    order = "e[scrap]-e[chunk]",
    inventory_move_sound = space_age_item_sounds.rock_inventory_move,
    pick_sound = space_age_item_sounds.rock_inventory_pickup,
    drop_sound = space_age_item_sounds.rock_inventory_move,
    stack_size = 1,
    weight = 100 * kg,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "item",
    name = "rocky-asteroid-chunk",
    icon = "__escape-to-space__/graphics/icons/rocky-asteroid-chunk.png",
    subgroup = "space-material",
    order = "d[rocky]-e[chunk]",
    inventory_move_sound = space_age_item_sounds.rock_inventory_move,
    pick_sound = space_age_item_sounds.rock_inventory_pickup,
    drop_sound = space_age_item_sounds.rock_inventory_move,
    stack_size = 1,
    weight = 100 * kg,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "item",
    name = "tungsten-asteroid-chunk",
    icon = "__escape-to-space__/graphics/icons/tungsten-asteroid-chunk.png",
    subgroup = "space-material",
    order = "d[tungsten]-e[chunk]",
    inventory_move_sound = space_age_item_sounds.rock_inventory_move,
    pick_sound = space_age_item_sounds.rock_inventory_pickup,
    drop_sound = space_age_item_sounds.rock_inventory_move,
    stack_size = 1,
    weight = 100 * kg,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "item",
    name = "scrap-asteroid-chunk",
    icon = "__escape-to-space__/graphics/icons/scrap-asteroid-chunk.png",
    subgroup = "space-material",
    order = "e[scrap]-e[chunk]",
    inventory_move_sound = space_age_item_sounds.rock_inventory_move,
    pick_sound = space_age_item_sounds.rock_inventory_pickup,
    drop_sound = space_age_item_sounds.rock_inventory_move,
    stack_size = 1,
    weight = 100 * kg,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "item",
    name = "alien-asteroid-chunk",
    icon = "__escape-to-space__/graphics/icons/alien-asteroid-chunk.png",
    subgroup = "space-material",
    order = "f[alien]-e[chunk]",
    inventory_move_sound = space_age_item_sounds.rock_inventory_move,
    pick_sound = space_age_item_sounds.rock_inventory_pickup,
    drop_sound = space_age_item_sounds.rock_inventory_move,
    stack_size = 1,
    weight = 100 * kg,
    random_tint_color = item_tints.organic_green
  },
  {
    type = "item",
    name = "fluorite-asteroid-chunk",
    icon = "__escape-to-space__/graphics/icons/fluorite-asteroid-chunk.png",
    subgroup = "space-material",
    order = "g[fluorite]-e[chunk]",
    inventory_move_sound = item_sounds.sulfur_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.sulfur_inventory_move,
    stack_size = 1,
    weight = 100 * kg,
    random_tint_color = item_tints.ice_blue
  },

  -- Items
  {
    type = "item",
    name = "sand",
    icon = "__escape-to-space__/graphics/icons/sand.png",
    subgroup = "intermediate-product",
    order = "z[sand]",
    inventory_move_sound = space_age_item_sounds.rock_inventory_move,
    pick_sound = space_age_item_sounds.rock_inventory_pickup,
    drop_sound = space_age_item_sounds.rock_inventory_move,
    stack_size = 50,
    weight = data.raw.item["stone"].weight/2,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "item",
    name = "glass-bottle",
    icon = "__escape-to-space__/graphics/icons/glass-bottle.png",
    subgroup = "intermediate-product",
    order = "z[glass-bottle]",
    inventory_move_sound = space_age_item_sounds.space_age_item_sounds,
    stack_size = 200,
    weight = 1*kg,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "item",
    name = "carbon-wheel",
    icon = "__escape-to-space__/graphics/icons/carbon-wheel.png",
    subgroup = "intermediate-product",
    order = "z[carbon-wheel]",
    inventory_move_sound = space_age_item_sounds.space_age_item_sounds,
    stack_size = 100,
    weight = 1*kg,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "item",
    name = "carbon-stick",
    icon = "__escape-to-space__/graphics/icons/carbon-stick.png",
    subgroup = "intermediate-product",
    order = "z[carbon-stick]",
    inventory_move_sound = space_age_item_sounds.space_age_item_sounds,
    stack_size = 100,
    weight = 1*kg,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "item",
    name = "carbon-wire",
    icon = "__escape-to-space__/graphics/icons/carbon-wire.png",
    subgroup = "intermediate-product",
    order = "z[carbon-wire]",
    inventory_move_sound = space_age_item_sounds.space_age_item_sounds,
    stack_size = 200,
    weight = 0.5*kg,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "item",
    name = "carbon-plate",
    icon = "__escape-to-space__/graphics/icons/carbon-plate.png",
    subgroup = "intermediate-product",
    order = "z[carbon-plate]",
    inventory_move_sound = space_age_item_sounds.space_age_item_sounds,
    stack_size = 200,
    weight = 0.5*kg,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "item",
    name = "carbon-electronic-circuit",
    icon = "__escape-to-space__/graphics/icons/carbon-electronic-circuit.png",
    subgroup = "intermediate-product",
    order = "z[carbon-electronic-circuit]",
    inventory_move_sound = space_age_item_sounds.space_age_item_sounds,
    stack_size = 200,
    weight = 0.5*kg,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "item",
    name = "carbon-engine-unit",
    icon = "__escape-to-space__/graphics/icons/carbon-engine-unit.png",
    subgroup = "intermediate-product",
    order = "z[carbon-engine-unit]",
    inventory_move_sound = space_age_item_sounds.space_age_item_sounds,
    stack_size = data.raw.item["engine-unit"].stack_size,
    weight = data.raw.item["engine-unit"].weight,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "item",
    name = "carbon-pipe",
    icon = "__escape-to-space__/graphics/icons/carbon-pipe.png",
    subgroup = "intermediate-product",
    order = "z[carbon-pipe]",
    inventory_move_sound = space_age_item_sounds.space_age_item_sounds,
    stack_size = data.raw.item["pipe"].stack_size,
    weight = data.raw.item["pipe"].weight,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "item",
    name = "oxidic-ore",
    icon = "__escape-to-space__/graphics/icons/oxidic-ore.png",
    subgroup = "intermediate-product",
    order = "z[oxidic-ore]",
    inventory_move_sound = space_age_item_sounds.space_age_item_sounds,
    stack_size = data.raw.item["pipe"].stack_size,
    weight = data.raw.item["pipe"].weight,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "item",
    name = "oxidic-plate",
    icon = "__escape-to-space__/graphics/icons/oxidic-plate.png",
    subgroup = "intermediate-product",
    order = "z[oxidic-plate]",
    inventory_move_sound = space_age_item_sounds.space_age_item_sounds,
    stack_size = data.raw.item["pipe"].stack_size,
    weight = data.raw.item["pipe"].weight,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "item",
    name = "oxidic-gear-wheel",
    icon = "__escape-to-space__/graphics/icons/oxidic-gear-wheel.png",
    subgroup = "intermediate-product",
    order = "z[oxidic-gear-wheel]",
    inventory_move_sound = space_age_item_sounds.space_age_item_sounds,
    stack_size = data.raw.item["pipe"].stack_size,
    weight = data.raw.item["pipe"].weight,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "item",
    name = "oxidic-stick",
    icon = "__escape-to-space__/graphics/icons/oxidic-stick.png",
    subgroup = "intermediate-product",
    order = "z[oxidic-stick]",
    inventory_move_sound = space_age_item_sounds.space_age_item_sounds,
    stack_size = data.raw.item["pipe"].stack_size,
    weight = data.raw.item["pipe"].weight,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "item",
    name = "oxidic-cable",
    icon = "__escape-to-space__/graphics/icons/oxidic-cable.png",
    subgroup = "intermediate-product",
    order = "z[oxidic-cable]",
    inventory_move_sound = space_age_item_sounds.space_age_item_sounds,
    stack_size = data.raw.item["pipe"].stack_size,
    weight = data.raw.item["pipe"].weight,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "item",
    name = "carbon-steel-ore",
    icon = "__escape-to-space__/graphics/icons/carbon-steel-ore.png",
    subgroup = "intermediate-product",
    order = "z[carbon-steel-ore]",
    inventory_move_sound = space_age_item_sounds.space_age_item_sounds,
    stack_size = data.raw.item["pipe"].stack_size,
    weight = data.raw.item["pipe"].weight,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "item",
    name = "carbon-steel-plate",
    icon = "__escape-to-space__/graphics/icons/carbon-steel-plate.png",
    subgroup = "intermediate-product",
    order = "z[carbon-steel-plate]",
    inventory_move_sound = space_age_item_sounds.space_age_item_sounds,
    stack_size = data.raw.item["pipe"].stack_size,
    weight = data.raw.item["pipe"].weight,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "item",
    name = "silicon-bar",
    icon = "__escape-to-space__/graphics/icons/silicon-bar.png",
    subgroup = "intermediate-product",
    order = "z[silicon-bar]",
    inventory_move_sound = space_age_item_sounds.space_age_item_sounds,
    stack_size = data.raw.item["pipe"].stack_size,
    weight = data.raw.item["pipe"].weight,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "item",
    name = "oxidic-electronic-circuit",
    icon = "__escape-to-space__/graphics/icons/oxidic-electronic-circuit.png",
    subgroup = "intermediate-product",
    order = "z[oxidic-electronic-circuit]",
    inventory_move_sound = space_age_item_sounds.space_age_item_sounds,
    stack_size = data.raw.item["pipe"].stack_size,
    weight = data.raw.item["pipe"].weight,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "item",
    name = "blank-data-disk",
    icon = "__escape-to-space__/graphics/icons/blank-data-disk.png",
    subgroup = "intermediate-product",
    order = "z[blank-data-disk]",
    inventory_move_sound = space_age_item_sounds.space_age_item_sounds,
    stack_size = 200,
    weight = data.raw.item["pipe"].weight,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "item",
    name = "solar-panel-mk2",
    icon = "__escape-to-space__/graphics/icons/solar-panel-mk2.png",
    subgroup = "energy",
    order = "z[solar-panel-mk2]",
    inventory_move_sound = space_age_item_sounds.space_age_item_sounds,
    stack_size = 200,
    weight = data.raw.item["pipe"].weight,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "item",
    name = "solar-panel-mk3",
    icon = "__escape-to-space__/graphics/icons/solar-panel-mk3.png",
    subgroup = "energy",
    order = "z[solar-panel-mk3]",
    inventory_move_sound = space_age_item_sounds.space_age_item_sounds,
    stack_size = 200,
    weight = data.raw.item["pipe"].weight,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "item",
    name = "fluorite",
    icon = "__escape-to-space__/graphics/icons/fluorite.png",
    subgroup = "aquilo-processes",
    order = "d[fluorite]-a[fluorite]",
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    stack_size = 50,
    weight = 4*kg
  },
  {
    type = "item",
    name = "biomass",
    icon = "__escape-to-space__/graphics/icons/biomass.png",
    subgroup = "intermediate-product",
    order = "d[biomass]-a[biomass]",
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    stack_size = 200,
    weight = 1*kg
  },
  {
    type = "item",
    name = "fertilizer",
    icon = "__escape-to-space__/graphics/icons/fertilizer.png",
    subgroup = "intermediate-product",
    order = "d[fertilizer]-a[fertilizer]",
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    stack_size = 100,
    weight = 2*kg
  },

  -- Ammo
  {
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
  },

  -- Machines
  {
    type = "item",
    name = "basic-electric-furnace",
    icon = "__escape-to-space__/graphics/icons/basic-electric-furnace.png",
    subgroup = "smelting-machine",
    order = "c[basic-electric-furnace]",
    inventory_move_sound = item_sounds.electric_large_inventory_move,
    pick_sound = item_sounds.electric_large_inventory_pickup,
    drop_sound = item_sounds.electric_large_inventory_move,
    place_result = "basic-electric-furnace",
    stack_size = 50,
    weight = 20*kg
  },
  {
    type = "item",
    name = "cybernetics-facility",
    icon = "__escape-to-space__/graphics/icons/cybernetics-facility-icon.png",
    subgroup = "smelting-machine",
    order = "c[cybernetics-facility]",
    inventory_move_sound = item_sounds.electric_large_inventory_move,
    pick_sound = item_sounds.electric_large_inventory_pickup,
    drop_sound = item_sounds.electric_large_inventory_move,
    place_result = "cybernetics-facility",
    stack_size = 1,
    weight = 100*kg
  },
  {
    type = "item",
    name = "mixing-station",
    icon = "__escape-to-space__/graphics/icons/mixing-station-icon.png",
    subgroup = "smelting-machine",
    order = "c[mixing-station]",
    inventory_move_sound = item_sounds.electric_large_inventory_move,
    pick_sound = item_sounds.electric_large_inventory_pickup,
    drop_sound = item_sounds.electric_large_inventory_move,
    place_result = "mixing-station",
    stack_size = 1,
    weight = 100*kg
  },
  {
    type = "item",
    name = "chemical-stager",
    icon = "__escape-to-space__/graphics/icons/chemical-stager-icon.png",
    subgroup = "smelting-machine",
    order = "c[chemical-stager]",
    inventory_move_sound = item_sounds.electric_large_inventory_move,
    pick_sound = item_sounds.electric_large_inventory_pickup,
    drop_sound = item_sounds.electric_large_inventory_move,
    place_result = "chemical-stager",
    stack_size = 1,
    weight = 100*kg
  },
  {
    type = "item",
    name = "quantum-stabilizer",
    icon = "__escape-to-space__/graphics/icons/quantum-stabilizer-icon.png",
    subgroup = "smelting-machine",
    order = "c[quantum-stabilizer]",
    inventory_move_sound = item_sounds.electric_large_inventory_move,
    pick_sound = item_sounds.electric_large_inventory_pickup,
    drop_sound = item_sounds.electric_large_inventory_move,
    place_result = "quantum-stabilizer",
    stack_size = 1,
    weight = 100*kg
  },
  {
    type = "item",
    name = "gravity-assembler",
    icon = "__escape-to-space__/graphics/icons/gravity-assembler-icon.png",
    subgroup = "smelting-machine",
    order = "c[gravity-assembler]",
    inventory_move_sound = item_sounds.electric_large_inventory_move,
    pick_sound = item_sounds.electric_large_inventory_pickup,
    drop_sound = item_sounds.electric_large_inventory_move,
    place_result = "gravity-assembler",
    stack_size = 1,
    weight = 100*kg
  },
  {
    type = "item",
    name = "greenhouse",
    icon = "__escape-to-space__/graphics/icons/greenhouse-icon.png",
    subgroup = "smelting-machine",
    order = "c[greenhouse]",
    inventory_move_sound = item_sounds.electric_large_inventory_move,
    pick_sound = item_sounds.electric_large_inventory_pickup,
    drop_sound = item_sounds.electric_large_inventory_move,
    place_result = "greenhouse",
    stack_size = 1,
    weight = 100*kg
  },

  -- Lab
  {
		type = "item",
		name = "cybernetic-lab",
		order = "z[zz-cybernetic-lab]",
		subgroup = "production-machine",
		pick_sound = item_sounds.reactor_inventory_pickup,
		drop_sound = item_sounds.reactor_inventory_move,
		icon = "__escape-to-space__/graphics/entity/cybernetic-lab/cybernetic-lab.png",
		icon_size = 64,
		stack_size = 1,
		weight = 1000*kg,
		place_result = "cybernetic-lab",
	},
  {
    type = "item",
    name = "oxide-lab",
    icon = "__escape-to-space__/graphics/icons/oxide-lab-icon.png",
    icon_size = 64,
    subgroup = "production-machine",
    order = "c[oxide-lab]",
    inventory_move_sound = data.raw["item"]["electromagnetic-plant"].inventory_move_sound,
    pick_sound = data.raw["item"]["electromagnetic-plant"].pick_sound,
    drop_sound = data.raw["item"]["electromagnetic-plant"].drop_sound,
    place_result = "oxide-lab",
    stack_size = data.raw["item"]["electromagnetic-plant"].stack_size,
    weight = data.raw["item"]["electromagnetic-plant"].weight
  },

  -- Science packs
  {
    type = "tool",
    name = "earth-science-pack",
    icon = "__escape-to-space__/graphics/icons/earth-science-pack.png",
    subgroup = "science-pack",
    order = "z[earth-science-pack]",
    inventory_move_sound = item_sounds.science_inventory_move,
    pick_sound = item_sounds.science_inventory_pickup,
    drop_sound = item_sounds.science_inventory_move,
    stack_size = 200,
    weight = 1*kg,
    durability = 1,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "tool",
    name = "axkeria-science-pack",
    icon = "__escape-to-space__/graphics/icons/axkeria-science-pack.png",
    subgroup = "science-pack",
    order = "z[axkeria-science-pack]",
    inventory_move_sound = item_sounds.science_inventory_move,
    pick_sound = item_sounds.science_inventory_pickup,
    drop_sound = item_sounds.science_inventory_move,
    stack_size = 200,
    weight = 1*kg,
    durability = 1,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "tool",
    name = "t-one-science-pack",
    icon = "__escape-to-space__/graphics/icons/t-one-science-pack.png",
    subgroup = "science-pack",
    order = "z[t-one-science-pack]",
    inventory_move_sound = item_sounds.science_inventory_move,
    pick_sound = item_sounds.science_inventory_pickup,
    drop_sound = item_sounds.science_inventory_move,
    stack_size = 200,
    weight = 1*kg,
    durability = 1,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "tool",
    name = "t-two-science-pack",
    icon = "__escape-to-space__/graphics/icons/t-two-science-pack.png",
    subgroup = "science-pack",
    order = "z[t-two-science-pack]",
    inventory_move_sound = item_sounds.science_inventory_move,
    pick_sound = item_sounds.science_inventory_pickup,
    drop_sound = item_sounds.science_inventory_move,
    stack_size = 200,
    weight = 1*kg,
    durability = 1,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "tool",
    name = "t-three-science-pack",
    icon = "__escape-to-space__/graphics/icons/t-three-science-pack.png",
    subgroup = "science-pack",
    order = "z[t-three-science-pack]",
    inventory_move_sound = item_sounds.science_inventory_move,
    pick_sound = item_sounds.science_inventory_pickup,
    drop_sound = item_sounds.science_inventory_move,
    stack_size = 200,
    weight = 1*kg,
    durability = 1,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "tool",
    name = "energy-data-disk",
    icon = "__escape-to-space__/graphics/icons/energy-data-disk.png",
    icon_size = 64,
    subgroup = "science-pack",
    order = "z[energy-data-disk-t1]",
    inventory_move_sound = item_sounds.science_inventory_move,
    pick_sound = item_sounds.science_inventory_pickup,
    drop_sound = item_sounds.science_inventory_move,
    stack_size = 200,
    weight = 1*kg,
    durability = 1,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "tool",
    name = "bio-data-disk",
    icon = "__escape-to-space__/graphics/icons/bio-data-disk.png",
    icon_size = 64,
    subgroup = "science-pack",
    order = "z[bio-data-disk-t1]",
    inventory_move_sound = item_sounds.science_inventory_move,
    pick_sound = item_sounds.science_inventory_pickup,
    drop_sound = item_sounds.science_inventory_move,
    stack_size = 200,
    weight = 1*kg,
    durability = 1,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "tool",
    name = "promethium-data-disk",
    icon = "__escape-to-space__/graphics/icons/promethium-data-disk.png",
    icon_size = 64,
    subgroup = "science-pack",
    order = "z[promethium-data-disk-t1]",
    inventory_move_sound = item_sounds.science_inventory_move,
    pick_sound = item_sounds.science_inventory_pickup,
    drop_sound = item_sounds.science_inventory_move,
    stack_size = 200,
    weight = 1*kg,
    durability = 1,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "tool",
    name = "mechanical-data-disk",
    icon = "__escape-to-space__/graphics/icons/mechanical-data-disk.png",
    icon_size = 64,
    subgroup = "science-pack",
    order = "z[mechanical-data-disk-t1]",
    inventory_move_sound = item_sounds.science_inventory_move,
    pick_sound = item_sounds.science_inventory_pickup,
    drop_sound = item_sounds.science_inventory_move,
    stack_size = 200,
    weight = 1*kg,
    durability = 1,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "tool",
    name = "military-data-disk",
    icon = "__escape-to-space__/graphics/icons/military-data-disk.png",
    icon_size = 64,
    subgroup = "science-pack",
    order = "z[military-data-disk-t1]",
    inventory_move_sound = item_sounds.science_inventory_move,
    pick_sound = item_sounds.science_inventory_pickup,
    drop_sound = item_sounds.science_inventory_move,
    stack_size = 200,
    weight = 1*kg,
    durability = 1,
    random_tint_color = item_tints.iron_rust
  },
})
