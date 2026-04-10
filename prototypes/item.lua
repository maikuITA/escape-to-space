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
  }
})
