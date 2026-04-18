-- recipe.lua

--------------------------------------------------------------------------
--- START DEFAULT RECIPES

local default_rcp = {
    "iron-plate",
    "iron-gear-wheel",
    "iron-stick",
    "copper-plate",
    "electronic-circuit",
    "transport-belt",
    "inserter",
}

for _, name in pairs(default_rcp) do
    local recipe = data.raw.recipe[name]
    if recipe then
        recipe.hidden = false
        recipe.enabled = true
    end
end

--- END DEFAULT RECIPES
--------------------------------------------------------------------------

--------------------------------------------------------------------------
--- START ASTEROID RECIPES

-- Irony asteroid crushing
local irony_asteroid_crushing_recipe = {
    type = "recipe",
    name = "iron-ore",
    category = "crushing",
    ingredients = {
        {type = "item", name = "irony-asteroid-chunk", amount = 1}
    },
    results = {
        {type = "item", name = "iron-ore", amount = 8},
    },
    energy_required = 2,
    enabled = true
}

if irony_asteroid_crushing_recipe then
    data:extend({irony_asteroid_crushing_recipe})
end

-- Coppery asteroid crushing
local coppery_asteroid_crushing_recipe = {
    type = "recipe",
    name = "copper-ore",
    category = "crushing",
    ingredients = {
        {type = "item", name = "coppery-asteroid-chunk", amount = 1}
    },
    results = {
        {type = "item", name = "copper-ore", amount = 5},
    },
    energy_required = 2,
    enabled = true
}

if coppery_asteroid_crushing_recipe then
    data:extend({coppery_asteroid_crushing_recipe})
end

--- END ASTEROID RECIPES
--------------------------------------------------------------------------

--------------------------------------------------------------------------
--- START TOOL RECIPES

-- Basic memory card
local basic_memory_card_recipe = {
    type = "recipe",
    name = "basic-memory-card",
    category = "crafting",
    ingredients = {
        {type = "item", name = "iron-gear-wheel", amount = 1},
        {type = "item", name = "copper-plate", amount = 2}
    },
    results = {{type = "item", name = "basic-memory-card", amount = 1}},
    energy_required = 1,
    enabled = true
}

if basic_memory_card_recipe then
    data:extend({basic_memory_card_recipe})
end

--- END TOOL RECIPES
--------------------------------------------------------------------------

--------------------------------------------------------------------------
--- START MACHINES

-- Basic electric furnace

local basic_electric_furnace_recipe = {
    type = "recipe",
    name = "basic-electric-furnace",
    category = "crafting",
    ingredients = {
        {type = "item", name = "iron-plate", amount = 10},
        {type = "item", name = "iron-gear-wheel", amount = 10},
        {type = "item", name = "electronic-circuit", amount = 5}
    },
    results = {{type = "item", name = "basic-electric-furnace", amount = 1}},
    energy_required = 1,
    enabled = true
}

if basic_electric_furnace_recipe then
    data:extend({basic_electric_furnace_recipe})
end

-- Scrubber
local scrubber = {
    type = "recipe",
    name = "scrubber",
    category = "crafting",
    ingredients = {
        {type = "item", name = "iron-plate", amount = 10},
        {type = "item", name = "iron-gear-wheel", amount = 10},
        {type = "item", name = "electronic-circuit", amount = 5}
    },
    results = {{type = "item", name = "scrubber", amount = 1}},
    energy_required = 1,
    enabled = true
}

if scrubber then
    data:extend({scrubber})
end

-- Oxide lab
local oxide_lab = {
    type = "recipe",
    name = "oxide-lab",
    category = "crafting",
    ingredients = {
        {type = "item", name = "iron-gear-wheel", amount = 10},
        {type = "item", name = "electronic-circuit", amount = 10},
        {type = "item", name = "transport-belt", amount = 4}
    },
    results = {{type = "item", name = "oxide-lab", amount = 1}},
    energy_required = 5,
    enabled = true
}

if oxide_lab then
    data:extend({oxide_lab})
end

--- END MACHINES
--------------------------------------------------------------------------