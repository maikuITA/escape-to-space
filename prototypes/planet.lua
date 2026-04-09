data:extend({

-------------------------------------------------------------------------- LOCATIONS
  {
    type = "space-location",
    name = "axos",
    icon = "__escape-to-space__/graphics/icons/axos.png",
    starmap_icon = "__escape-to-space__/graphics/icons/axos.png",
    starmap_icon_size = 64,
    order = "a[axos]",
    subgroup = "planets",
    solar_power_in_space = 400,
    gravity_pull = -20,
    distance = 2,
    orientation = 0.24,
    magnitude = 1.0,
    label_orientation = 0.15,
    asteroid_spawn_influence = 1
  },
  {
    type = "space-location",
    name = "keria",
    icon = "__escape-to-space__/graphics/icons/keria.png",
    starmap_icon = "__escape-to-space__/graphics/icons/keria.png",
    starmap_icon_size = 64,
    order = "a[keria]",
    subgroup = "planets",
    solar_power_in_space = 100,
    gravity_pull = -20,
    distance = 10,
    orientation = 0.34,
    magnitude = 1.0,
    label_orientation = 0.15,
    asteroid_spawn_influence = 1
  },
-------------------------------------------------------------------------- PLANET CONNECTIONS
  {
    type = "space-connection",
    name = "nauvis-axos",
    subgroup = "planet-connections",
    from = "axos",
    to = "nauvis",
    order = "0-a",
    length = 25000,
  },
  {
    type = "space-connection",
    name = "nauvis-keria",
    subgroup = "planet-connections",
    from = "keria",
    to = "nauvis",
    order = "0-b",
    length = 10000,
  },
  {
    type = "space-connection",
    name = "axos-keria",
    subgroup = "planet-connections",
    from = "axos",
    to = "keria",
    order = "0-b",
    length = 15000,
  }
})
