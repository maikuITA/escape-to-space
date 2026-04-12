local asteroid_util = require("__escape-to-space__.prototypes.asteroid-spawn-definitions")

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
    asteroid_spawn_influence = 1,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_axos, 0.9)
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
    asteroid_spawn_influence = 1,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_keria, 0.9)
  },
-------------------------------------------------------------------------- MODDED PLANET CONNECTIONS
  {
    type = "space-connection",
    name = "nauvis-axos",
    subgroup = "planet-connections",
    from = "axos",
    to = "nauvis",
    order = "0-a",
    length = 25000,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_axos)
  },
  {
    type = "space-connection",
    name = "nauvis-keria",
    subgroup = "planet-connections",
    from = "keria",
    to = "nauvis",
    order = "0-b",
    length = 10000,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_keria)
  },
  {
    type = "space-connection",
    name = "axos-keria",
    subgroup = "planet-connections",
    from = "axos",
    to = "keria",
    order = "0-b",
    length = 15000,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.axos_keria)
  },
  -------------------------------------------------------------------------- VANILLA PLANET CONNECTIONS
  {
    type = "space-connection",
    name = "nauvis-vulcanus",
    subgroup = "planet-connections",
    from = "nauvis",
    to = "vulcanus",
    order = "a",
    length = 15000,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus)
  },
  {
    type = "space-connection",
    name = "nauvis-gleba",
    subgroup = "planet-connections",
    from = "nauvis",
    to = "gleba",
    order = "b",
    length = 15000,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_gleba)
  },
  {
    type = "space-connection",
    name = "nauvis-fulgora",
    subgroup = "planet-connections",
    from = "nauvis",
    to = "fulgora",
    order = "c",
    length = 15000,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_fulgora)
  },
  {
    type = "space-connection",
    name = "vulcanus-gleba",
    subgroup = "planet-connections",
    from = "vulcanus",
    to = "gleba",
    order = "d",
    length = 15000,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.vulcanus_gleba)
  },
  {
    type = "space-connection",
    name = "gleba-fulgora",
    subgroup = "planet-connections",
    from = "gleba",
    to = "fulgora",
    order = "e",
    length = 15000,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.gleba_fulgora)
  },
  {
    type = "space-connection",
    name = "gleba-aquilo",
    subgroup = "planet-connections",
    from = "gleba",
    to = "aquilo",
    order = "f",
    length = 30000,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.gleba_aquilo)
  },
  {
    type = "space-connection",
    name = "fulgora-aquilo",
    subgroup = "planet-connections",
    from = "fulgora",
    to = "aquilo",
    order = "g",
    length = 30000,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.fulgora_aquilo)
  },
  {
    type = "space-connection",
    name = "aquilo-solar-system-edge",
    subgroup = "planet-connections",
    from = "aquilo",
    to = "solar-system-edge",
    order = "h",
    length = 100000,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.aquilo_solar_system_edge)
  },
  {
    type = "space-connection",
    name = "solar-system-edge-shattered-planet",
    subgroup = "planet-connections",
    from = "solar-system-edge",
    to = "shattered-planet",
    order = "i",
    length = 4000000,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.shattered_planet_trip)
  }
})
