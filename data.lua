-- data.lua

require("prototypes.entity.asteroids")
require("prototypes.categories.recipe-category")
require("prototypes.item")
require("prototypes.fluid")
require("prototypes.planet")
require("prototypes.entity.entity")
require("prototypes.entity.modified-entity")
require("prototypes.entity.remnants")
require("prototypes.recipe")
require("prototypes.technology")

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

-- Allow foundation tiles to be covered for easier platform refactoring iterations.
data.raw["tile"]["space-platform-foundation"].allows_being_covered = true