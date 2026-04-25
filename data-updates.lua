-- data-updates.lua

local asteroid_util = require("__escape-to-space__.prototypes.asteroid-spawn-definitions")

--------------------------------------------------------------------------
--- START PLANETS

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

--- END PLANETS
--------------------------------------------------------------------------

--------------------------------------------------------------------------
--- START TIERS

-- Scrubber mk2
local scrubber_mk2 = table.deepcopy(data.raw["assembling-machine"]["scrubber"])
if scrubber_mk2 then
    scrubber_mk2.name = "scrubber-mk2"
    scrubber_mk2.minable.result = "scrubber-mk2"
    scrubber_mk2.crafting_speed = 1
    data:extend({scrubber_mk2})
end

-- Scrubber mk3
local scrubber_mk3 = table.deepcopy(data.raw["assembling-machine"]["scrubber"])
if scrubber_mk3 then
    scrubber_mk3.name = "scrubber-mk3"
    scrubber_mk3.minable.result = "scrubber-mk3"
    scrubber_mk3.crafting_speed = 2
    data:extend({scrubber_mk3})
end

--- END TIERS
--------------------------------------------------------------------------

-- Void chest

local void_chest_entity = data.raw["infinity-container"]["void-chest"]
if void_chest_entity then
  -- Override visuals for consistency: avoid exposing default art that suggests base behavior.
  void_chest_entity.picture = {
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

-- As
local ast_coll = data.raw["asteroid-collector"]["asteroid-collector"]
if ast_coll then
  ast_coll.collection_radius = 10
end