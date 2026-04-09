
local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")

data:extend(
{

-------------------------------------------------------------------------- LOCATIONS
  {
    type = "space-location",
    name = "axos",
    icon = "__escape-to-space__/graphics/icons/axos.png",
    starmap_icon = "__escape-to-space__/graphics/icons/starmap-axos.png",
    starmap_icon_size = 512,
    order = "a[axos]",
    subgroup = "planets",
    solar_power_in_space = 200,
    gravity_pull = -20,
    distance = 1,
    orientation = 0.9,
    magnitude = 1.0,
    label_orientation = 0.15,
    asteroid_spawn_influence = 0,
  },
  {
    type = "space-location",
    name = "keria",
    icon = "__escape-to-space__/graphics/icons/keria.png",
    starmap_icon = "__escape-to-space__/graphics/icons/starmap-keria.png",
    starmap_icon_size = 512,
    order = "a[keria]",
    subgroup = "planets",
    solar_power_in_space = 200,
    gravity_pull = -20,
    distance = 5,
    orientation = 0.24,
    magnitude = 1.0,
    label_orientation = 0.15,
    asteroid_spawn_influence = 0,
  },
-------------------------------------------------------------------------- PLANET CONNECTIONS
  {
    type = "space-connection",
    name = "nauvis-axos",
    subgroup = "planet-connections",
    from = "axos",
    to = "nauvis",
    order = "0-a",
    length = 15000,
  },
  {
    type = "space-connection",
    name = "nauvis-keria",
    subgroup = "planet-connections",
    from = "keria",
    to = "nauvis",
    order = "0-b",
    length = 15000,
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
