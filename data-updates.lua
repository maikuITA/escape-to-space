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
--- START RECIPES

--- HIDE ALL RECIPES
for _, recipe in pairs(data.raw["recipe"]) do
    recipe.hidden = true
end



--- END RECIPES
--------------------------------------------------------------------------