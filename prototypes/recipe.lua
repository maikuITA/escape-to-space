-- recipe.lua

--------------------------------------------------------------------------
--- START DEFAULT RECIPES

local default_rcp = {
    "iron-plate",
    "iron-gear-wheel",
    "iron-stick",
    "steel-plate",
    "copper-plate",
    "copper-cable",
    "electronic-circuit",
    "transport-belt",
    "inserter",
    "solar-panel",
    "engine-unit",
    "pipe",
    "pipe-to-ground",
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
    subgroup="space-crushing",
    icon = "__escape-to-space__/graphics/icons/irony-asteroid-crushing.png",
    icon_size = 64,
    ingredients = {
        {type = "item", name = "irony-asteroid-chunk", amount = 1}
    },
    results = {
        {type = "item", name = "iron-ore", amount = 12},
        {type = "item", name = "gravel", amount = 1, probability = 0.10}
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
    subgroup = "space-crushing",
    icon = "__escape-to-space__/graphics/icons/coppery-asteroid-crushing.png",
    icon_size = 64,
    ingredients = {
        {type = "item", name = "coppery-asteroid-chunk", amount = 1}
    },
    results = {
        {type = "item", name = "copper-ore", amount = 10},
        {type = "item", name = "gravel", amount = 1, probability = 0.10}
    },
    energy_required = 2,
    enabled = true
}

if coppery_asteroid_crushing_recipe then
    data:extend({coppery_asteroid_crushing_recipe})
end

-- Rocky asteroid crushing
local rocky_asteroid_crushing_recipe = {
    type = "recipe",
    name = "stone",
    category = "crushing",
    subgroup = "space-crushing",
    icon = "__escape-to-space__/graphics/icons/rocky-asteroid-crushing.png",
    icon_size = 64,
    ingredients = {
        {type = "item", name = "rocky-asteroid-chunk", amount = 1}
    },
    results = {
        {type = "item", name = "stone", amount = 5},
        {type = "item", name = "coal", amount = 1, probability = 0.20},
        {type = "item", name = "gravel", amount = 1, probability = 0.10}
    },
    energy_required = 2,
    enabled = true
}

if rocky_asteroid_crushing_recipe then
    data:extend({rocky_asteroid_crushing_recipe})
end

-- Rocky asteroid crushing 2
local rocky_asteroid_crushing_recipe2 = {
    type = "recipe",
    name = "coal",
    category = "crushing",
    subgroup = "space-crushing",
    icon = "__escape-to-space__/graphics/icons/rocky-asteroid-crushing.png",
    icon_size = 64,
    ingredients = {
        {type = "item", name = "rocky-asteroid-chunk", amount = 1}
    },
    results = {
        {type = "item", name = "coal", amount = 2},
        {type = "item", name = "gravel", amount = 1, probability = 0.10}
    },
    energy_required = 2,
    enabled = false
}

if rocky_asteroid_crushing_recipe2 then
    data:extend({rocky_asteroid_crushing_recipe2})
end

-- Stone crushing
local stone_crushing_recipe = {
    type = "recipe",
    name = "sand",
    category = "crushing",
    subgroup="space-crushing",
    icon = "__escape-to-space__/graphics/icons/stone-crushing.png",
    icon_size = 64,
    ingredients = {
        {type = "item", name = "stone", amount = 1}
    },
    results = {
        {type = "item", name = "sand", amount = 5},
        {type = "item", name = "gravel", amount = 1, probability = 0.10}
    },
    energy_required = 2,
    enabled = true
}

if stone_crushing_recipe then
    data:extend({stone_crushing_recipe})
end

-- Carbonic asteroid crushing
local carbonic_asteroid_crushing_recipe = {
    type = "recipe",
    name = "carbon",
    category = "crushing",
    subgroup = "space-crushing",
    icon = "__space-age__/graphics/icons/carbonic-asteroid-crushing.png",
    icon_size = 64,
    ingredients = {
        {type = "item", name = "carbonic-asteroid-chunk", amount = 1}
    },
    results = {
        {type = "item", name = "carbon", amount = 8},
        {type = "item", name = "gravel", amount = 1, probability = 0.10}
    },
    energy_required = 2,
    hidden = false,
    enabled = false
}

if carbonic_asteroid_crushing_recipe then
    data:extend({carbonic_asteroid_crushing_recipe})
end

-- Oxide asteroid crushing
local oxide_asteroid_crushing_recipe = {
    type = "recipe",
    name = "ice",
    category = "crushing",
    subgroup = "space-crushing",
    icon = "__space-age__/graphics/icons/oxide-asteroid-crushing.png",
    icon_size = 64,
    ingredients = {
        {type = "item", name = "oxide-asteroid-chunk", amount = 1}
    },
    results = {
        {type = "item", name = "ice", amount = 4},
        {type = "item", name = "gravel", amount = 1, probability = 0.10}
    },
    energy_required = 2,
    hidden = false,
    enabled = false
}

if oxide_asteroid_crushing_recipe then
    data:extend({oxide_asteroid_crushing_recipe})
end

--- END ASTEROID RECIPES
--------------------------------------------------------------------------

--------------------------------------------------------------------------
--- START TOOL RECIPES

-- Blank data disk
local blank_data_disk_recipe = {
    type = "recipe",
    name = "blank-data-disk",
    category = "crafting",
    icon = "__escape-to-space__/graphics/icons/blank-data-disk.png",
    icon_size = 64,
    ingredients = {
        {type = "item", name = "electronic-circuit", amount = 1},
        {type = "item", name = "iron-plate", amount = 1}
    },
    results = {{type = "item", name = "blank-data-disk", amount = 1}},
    energy_required = 0.5,
    enabled = false
}

if blank_data_disk_recipe then
    data:extend({blank_data_disk_recipe})
end

-- Basic data disk
local basic_data_disk_recipe = {
    type = "recipe",
    name = "basic-data-disk",
    category = "cybernetics",
    icon = "__escape-to-space__/graphics/icons/basic-data-disk.png",
    icon_size = 64,
    ingredients = {
        {type = "item", name = "blank-data-disk", amount = 1},
        {type = "item", name = "iron-gear-wheel", amount = 1},
        {type = "item", name = "copper-plate", amount = 1}
    },
    results = {{type = "item", name = "basic-data-disk", amount = 1}},
    energy_required = 5,
    enabled = false
}

if basic_data_disk_recipe then
    data:extend({basic_data_disk_recipe})
end

-- Data disk mk1
local data_disk_mk1 = {
    type = "recipe",
    name = "data-disk-mk1",
    category = "cybernetics",
    icon = "__escape-to-space__/graphics/icons/data-disk-mk1.png",
    icon_size = 64,
    ingredients = {
        {type = "item", name = "blank-data-disk", amount = 1},
        {type = "item", name = "ice", amount = 2},
        {type = "item", name = "carbon-gear-wheel", amount = 1}
    },
    results = {{type = "item", name = "data-disk-mk1", amount = 1}},
    energy_required = 6,
    enabled = false
}

if data_disk_mk1 then
    data:extend({data_disk_mk1})
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
    icon = "__escape-to-space__/graphics/icons/scrubber-icon.png",
    icon_size = 64,
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
    icon = "__escape-to-space__/graphics/icons/oxide-lab-icon.png",
    icon_size = 64,
    ingredients = {
        {type = "item", name = "iron-gear-wheel", amount = 10},
        {type = "item", name = "electronic-circuit", amount = 10},
        {type = "item", name = "transport-belt", amount = 4}
    },
    results = {{type = "item", name = "oxide-lab", amount = 1}},
    energy_required = 5,
    enabled = false
}

if oxide_lab then
    data:extend({oxide_lab})
end

-- Cybernetics facility
local cybernetics_facility = {
    type = "recipe",
    name = "cybernetics-facility",
    category = "crafting",
    icon = "__escape-to-space__/graphics/icons/cybernetics-facility-icon.png",
    icon_size = 64,
    ingredients = {
        {type = "item", name = "iron-gear-wheel", amount = 10},
        {type = "item", name = "electronic-circuit", amount = 10},
        {type = "item", name = "engine-unit", amount = 5}
    },
    results = {{type = "item", name = "cybernetics-facility", amount = 1}},
    energy_required = 5,
    enabled = false
}

if cybernetics_facility then
    data:extend({cybernetics_facility})
end

--- END MACHINES
--------------------------------------------------------------------------

--------------------------------------------------------------------------
--- START SPACE MACHINES

-- Cargo bay
local cargo_bay = data.raw.recipe["cargo-bay"]
if cargo_bay then
    cargo_bay.ingredients = {
        {type = "item", name = "iron-plate", amount = 20},
        {type = "item", name = "iron-gear-wheel", amount = 20},
        {type = "item", name = "electronic-circuit", amount = 10}
    }
    cargo_bay.results = {{type = "item", name = "cargo-bay", amount = 1}}
    cargo_bay.hidden = false
    cargo_bay.enabled = false
end

if cargo_bay then
    data:extend({cargo_bay})
end

-- Asteroid collector
local asteroid_collector = data.raw.recipe["asteroid-collector"]
if asteroid_collector then
    asteroid_collector.ingredients = {
        {type = "item", name = "iron-gear-wheel", amount = 20},
        {type = "item", name = "electronic-circuit", amount = 20},
        {type = "item", name = "engine-unit", amount = 10}
    }
    asteroid_collector.results = {{type = "item", name = "asteroid-collector", amount = 1}}
    asteroid_collector.hidden = false
    asteroid_collector.enabled = false
end

if asteroid_collector then
    data:extend({asteroid_collector})
end

-- Crusher
local crusher = data.raw.recipe["crusher"]
if crusher then
    crusher.ingredients = {
        {type = "item", name = "iron-gear-wheel", amount = 20},
        {type = "item", name = "electronic-circuit", amount = 20},
        {type = "item", name = "engine-unit", amount = 10}
    }
    crusher.results = {{type = "item", name = "crusher", amount = 1}}
    crusher.hidden = false
    crusher.enabled = false
end

if crusher then
    data:extend({crusher})
end

-- Thruster
local thruster = data.raw.recipe["thruster"]
if thruster then
    thruster.ingredients = {
        {type = "item", name = "iron-gear-wheel", amount = 20},
        {type = "item", name = "electronic-circuit", amount = 20},
        {type = "item", name = "engine-unit", amount = 10}
    }
    thruster.results = {{type = "item", name = "thruster", amount = 1}}
    thruster.hidden = false
    thruster.enabled = false
end

if thruster then
    data:extend({thruster})
end

-- Thruster fuel
local thruster_fuel = data.raw.recipe["thruster-fuel"]
if thruster_fuel then
    thruster_fuel.ingredients = {
        {type = "item", name = "copper-ore", amount = 2},
        {type = "item", name = "sand", amount = 2},
    }
    thruster_fuel.results = {{type = "fluid", name = "thruster-fuel", amount = 100}}
    thruster_fuel.hidden = false
    thruster_fuel.enabled = false
end

-- Thruster oxidizer
local thruster_oxidizer = data.raw.recipe["thruster-oxidizer"]
if thruster_oxidizer then
    thruster_oxidizer.ingredients = {
        {type = "item", name = "iron-ore", amount = 2},
        {type = "item", name = "sand", amount = 2},
    }
    thruster_oxidizer.results = {{type = "fluid", name = "thruster-oxidizer", amount = 100}}
    thruster_oxidizer.hidden = false
    thruster_oxidizer.enabled = false
end

-- Ice melting
local ice_melting = data.raw.recipe["ice-melting"]
if ice_melting then
    ice_melting.ingredients = {
        {type = "item", name = "ice", amount = 1}
    }
    ice_melting.results = {{type = "fluid", name = "water", amount = 50}}
    ice_melting.hidden = false
    ice_melting.enabled = false
end

--- END SPACE MACHINES
--------------------------------------------------------------------------

--------------------------------------------------------------------------
--- START ITEMS

-- Void chest
local void_chest_recipe = data.raw.recipe["void-chest"]
if void_chest_recipe then
    void_chest_recipe.enabled = true   -- disables crafting
    void_chest_recipe.hidden = false     -- hides from crafting menu and techs
    void_chest_recipe.allow_as_intermediate = false -- optional: stops auto-use in factories
    void_chest_recipe.ingredients = {
        {type = "item", name = "iron-plate", amount = 1}
    }
end

-- Carbon gear wheel
local carbon_gear_wheel = {
    type = "recipe",
    name = "carbon-gear-wheel",
    category = "crafting",
    icon = "__escape-to-space__/graphics/icons/carbon-gear-wheel.png",
    icon_size = 64,
    ingredients = {
        {type = "item", name = "carbon-plate", amount = 2}
    },
    results = {{type = "item", name = "carbon-gear-wheel", amount = 1}},
    energy_required = 0.5,
    enabled = false
}

if carbon_gear_wheel then
    data:extend({carbon_gear_wheel})
end

-- Carbon plate
local carbon_plate = {
    type = "recipe",
    name = "carbon-plate",
    category = "smelting",
    icon = "__escape-to-space__/graphics/icons/carbon-plate.png",
    icon_size = 64,
    ingredients = {
        {type = "item", name = "carbon", amount = 2}
    },
    results = {{type = "item", name = "carbon-plate", amount = 1}},
    energy_required = 2,
    enabled = false
}

if carbon_plate then
    data:extend({carbon_plate})
end

-- Carbon wire
local carbon_wire = {
    type = "recipe",
    name = "carbon-wire",
    category = "crafting",
    icon = "__escape-to-space__/graphics/icons/carbon-wire.png",
    icon_size = 64,
    ingredients = {
        {type = "item", name = "carbon-plate", amount = 1}
    },
    results = {{type = "item", name = "carbon-wire", amount = 1}},
    energy_required = 0.5,
    enabled = false
}

if carbon_wire then
    data:extend({carbon_wire})
end

-- Carbon stick
local carbon_stick = {
    type = "recipe",
    name = "carbon-stick",
    category = "crafting",
    icon = "__escape-to-space__/graphics/icons/carbon-stick.png",
    icon_size = 64,
    ingredients = {
        {type = "item", name = "carbon-plate", amount = 1}
    },
    results = {{type = "item", name = "carbon-stick", amount = 1}},
    energy_required = 0.5,
    enabled = false
}

if carbon_stick then
    data:extend({carbon_stick})
end

-- Carbon pipe
local carbon_pipe = {
    type = "recipe",
    name = "carbon-pipe",
    category = "crafting",
    icon = "__escape-to-space__/graphics/icons/carbon-pipe.png",
    icon_size = 64,
    ingredients = {
        {type = "item", name = "carbon-plate", amount = 2}
    },
    results = {{type = "item", name = "carbon-pipe", amount = 1}},
    energy_required = 0.5,
    enabled = false
}

if carbon_pipe then
    data:extend({carbon_pipe})
end

-- Carbon engine unit
local carbon_engine_unit = {
    type = "recipe",
    name = "carbon-engine-unit",
    category = "advanced-crafting",
    icon = "__escape-to-space__/graphics/icons/carbon-engine-unit.png",
    icon_size = 64,
    ingredients = {
        {type = "item", name = "carbon-gear-wheel", amount = 5},
        {type = "item", name = "carbon-pipe", amount = 5},
        {type = "item", name = "carbon-stick", amount = 5}
    },
    results = {{type = "item", name = "carbon-engine-unit", amount = 1}},
    energy_required = 2,
    enabled = false
}

if carbon_engine_unit then
    data:extend({carbon_engine_unit})
end

--------------------------------------------------------------------------