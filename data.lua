-- data.lua

require("prototypes.entity.asteroids")
require("prototypes.item")
require("prototypes.planet")

-- Remove recipe surface restrictions globally.
-- Why: this scenario shifts progression to space; planet-locked recipes can cause
-- hard progression stops when normal planet access is disabled.
-- Edge case: many recipes do not define surface_conditions, so clear conditionally.
-- Remove all surface conditions from recipes
for name, recipe in pairs(data.raw.recipe) do
    if recipe.surface_conditions then
        recipe.surface_conditions = nil
    end
end

-- Some machines also carry prototype-level surface limits independent from recipes.
-- Clearing both avoids mixed states where recipes are available but machines are not.
data.raw["assembling-machine"]["biochamber"].surface_conditions = nil
data.raw["assembling-machine"]["captive-biter-spawner"].surface_conditions = nil

-- Rebalance key early space progression to reduce grind in a space-first start.
-- Edge case: guard against missing technologies in partial mod setups.
local adv_asteroid = data.raw["technology"]["advanced-asteroid-processing"]
if adv_asteroid and adv_asteroid.unit then
    adv_asteroid.unit.count = 100                        -- new number of research units
    adv_asteroid.unit.ingredients = {
        {"automation-science-pack", 1},           -- require 3 red science per unit
        {"logistic-science-pack", 1}              -- require 2 green science per unit
    }
    adv_asteroid.unit.time = 30                           -- 45 seconds per unit
end

local thrust = data.raw["technology"]["space-platform-thruster"]
if thrust and thrust.unit and thrust.effects then
    thrust.unit.count = 50
    thrust.unit.ingredients = {
        {"automation-science-pack", 1},
        {"space-science-pack", 1}
    }
    table.insert(thrust.effects, { type = "unlock-space-location", space_location = "axos" })
    table.insert(thrust.effects, { type = "unlock-space-location", space_location = "keria" })
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

-- Allow foundation tiles to be covered for easier platform refactoring iterations.
data.raw["tile"]["space-platform-foundation"].allows_being_covered = true