-- data.lua

--- HIDE ALL RECIPES
for _, recipe in pairs(data.raw["recipe"]) do
    recipe.hidden = true
end

-- Nasconde e disattiva tutte le tecnologie non custom.
-- Convenzione: tutte le tech custom iniziano con "ets-".

local function is_custom_tech(name)
  return string.find(name, "^ets%-") ~= nil
end

for name, tech in pairs(data.raw.technology) do
  if not is_custom_tech(name) then
    tech.hidden = true
    tech.enabled = false
  end
end

-- Hide/disable Space Age science packs
local to_hide = {
  -- Base game
  "automation-science-pack",
  "logistic-science-pack",
  "military-science-pack",
  "chemical-science-pack",
  "production-science-pack",
  "utility-science-pack",
  "space-science-pack",

  -- Space Age
  "metallurgic-science-pack",
  "electromagnetic-science-pack",
  "agricultural-science-pack",
  "cryogenic-science-pack",
  "promethium-science-pack",
}

local science_set = {}
for _, name in ipairs(to_hide) do
  science_set[name] = true

  local recipe = data.raw.recipe[name]
  if recipe then
    recipe.enabled = false
    recipe.hidden = true
  end

  local tool = data.raw.tool[name]
  if tool then
    tool.hidden = true
    tool.hidden_in_factoriopedia = true
  end

  local item = data.raw.item[name]
  if item then
    item.hidden = true
    item.hidden_in_factoriopedia = true
  end
end

-- Clean forbidden science packs from all technologies (no remap).
-- If a non-custom technology ends with no packs, remove it entirely.
local removed_tech = {}

for tech_name, tech in pairs(data.raw.technology) do
  if tech.unit and tech.unit.ingredients then
    local kept = {}

    for _, ing in ipairs(tech.unit.ingredients) do
      local pack = ing.name or ing[1]
      if not science_set[pack] then
        table.insert(kept, ing)
      end
    end

    if #kept > 0 then
        tech.unit.ingredients = kept
    else
        -- Non eliminare il prototype: altri oggetti lo referenziano.
        -- Manteniamo la tech valida con un requisito minimo.
        tech.unit.ingredients = {{"basic-memory-card", 1}}
        tech.hidden = true
        tech.enabled = false
    end
  end
end

-- Remove prerequisites that point to deleted technologies.
for _, tech in pairs(data.raw.technology) do
  if tech.prerequisites then
    local new_prereq = {}
    for _, p in ipairs(tech.prerequisites) do
      if not removed_tech[p] and data.raw.technology[p] then
        table.insert(new_prereq, p)
      end
    end
    tech.prerequisites = new_prereq
  end
end

-- Remove them from all labs input lists
for _, lab in pairs(data.raw.lab) do
  if lab.inputs then
    local filtered = {}
    for _, pack in ipairs(lab.inputs) do
      if not science_set[pack] then
        table.insert(filtered, pack)
      end
    end
    lab.inputs = filtered
  end
end

require("prototypes.entity.asteroids")
require("prototypes.categories.recipe-category")
require("prototypes.item")
require("prototypes.fluid")
require("prototypes.planet")
require("prototypes.entity.entity")
require("prototypes.entity.remnants")
require("prototypes.recipe")
require("prototypes.technology")
require("prototypes.custom-belts.custom-belts")

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