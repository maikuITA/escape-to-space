local item_sounds = require("__base__.prototypes.item_sounds")
local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")

data:extend({

-- ------------ New Asteroids

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
  }

-- ------------ End

})
