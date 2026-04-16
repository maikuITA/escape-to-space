data:extend({
    -- Crafting
    {
		type = "recipe",
		name = "platform-trash-depot",
        category = "crafting",
		ingredients = {
          {type = "item", name = "iron-plate", amount = 1}
        },
        results = {{type = "item", name = "void-chest", amount = 1}},
        energy_required = 0.5,
        enabled = false
    },
    {
		type = "recipe",
		name = "carbon-wheel",
        category = "crafting",
		ingredients = {
          {type = "item", name = "carbon", amount = 2}
        },
        results = {{type = "item", name = "carbon-wheel", amount = 1}},
        energy_required = 0.5,
        enabled = false
    },
    {
		type = "recipe",
		name = "carbon-stick",
        category = "crafting",
		ingredients = {
          {type = "item", name = "carbon", amount = 1}
        },
        results = {{type = "item", name = "carbon-stick", amount = 1}},
        energy_required = 0.5,
        enabled = false
    },
    {
		type = "recipe",
		name = "carbon-plate",
        category = "smelting",
		ingredients = {
          {type = "item", name = "carbon", amount = 2}
        },
        results = {{type = "item", name = "carbon-plate", amount = 1}},
        energy_required = 3.2,
        enabled = false
    },
    {
		type = "recipe",
		name = "carbon-wire",
        category = "crafting",
		ingredients = {
          {type = "item", name = "carbon", amount = 2}
        },
        results = {{type = "item", name = "carbon-wire", amount = 1}},
        energy_required = 0.5,
        enabled = false
    },
    {
		type = "recipe",
		name = "carbon-electronic-circuit",
        category = "crafting",
		ingredients = {
          {type = "item", name = "carbon-plate", amount = 1},
          {type = "item", name = "copper-cable", amount = 3}
        },
        results = {{type = "item", name = "carbon-electronic-circuit", amount = 1}},
        energy_required = 1.5,
        enabled = false
    },
    {
		type = "recipe",
		name = "carbon-engine-unit",
        category = "advanced-crafting",
		ingredients = {
          {type = "item", name = "carbon-wheel", amount = 1},
          {type = "item", name = "carbon-pipe", amount = 2},
          {type = "item", name = "steel-plate", amount = 1}
        },
        results = {{type = "item", name = "carbon-engine-unit", amount = 1}},
        energy_required = 10,
        enabled = false
    },
    {
		type = "recipe",
		name = "carbon-pipe",
        category = "crafting",
		ingredients = {
          {type = "item", name = "carbon-plate", amount = 1},
        },
        results = {{type = "item", name = "carbon-pipe", amount = 1}},
        energy_required = 0.5,
        enabled = false
    },
    {
		type = "recipe",
		name = "oxidic-stick",
        category = "crafting",
		ingredients = {
          {type = "item", name = "oxidic-plate", amount = 1},
        },
        results = {{type = "item", name = "oxidic-stick", amount = 1}},
        energy_required = 0.5,
        enabled = false
    },
    {
		type = "recipe",
		name = "oxidic-gear-wheel",
        category = "crafting",
		ingredients = {
          {type = "item", name = "oxidic-plate", amount = 2},
        },
        results = {{type = "item", name = "oxidic-gear-wheel", amount = 1}},
        energy_required = 0.5,
        enabled = false
    },
    {
		type = "recipe",
		name = "oxidic-cable",
        category = "crafting",
		ingredients = {
          {type = "item", name = "oxidic-plate", amount = 2},
        },
        results = {{type = "item", name = "oxidic-cable", amount = 1}},
        energy_required = 0.5,
        enabled = false
    },
    {
		type = "recipe",
		name = "oxidic-rounds-magazine",
        category = "crafting",
		ingredients = {
          {type = "item", name = "oxidic-plate", amount = 2},
          {type = "item", name = "piercing-rounds-magazine", amount = 2}
        },
        results = {{type = "item", name = "oxidic-rounds-magazine", amount = 2}},
        energy_required = 0.5,
        enabled = false
    },

    --Machines
    {
		type = "recipe",
		name = "basic-electric-furnace",
        category = "crafting",
		ingredients = {
          {type = "item", name = "iron-plate", amount = 9},
          {type = "item", name = "iron-gear-wheel", amount = 9},
          {type = "item", name = "electronic-circuit", amount = 10}
        },
        results = {{type = "item", name = "basic-electric-furnace", amount = 1}},
        energy_required = 0.5,
        enabled = false
    },
    {
		type = "recipe",
		name = "cybernetics-facility",
        category = "crafting",
		ingredients = {
          {type = "item", name = "iron-plate", amount = 10},
          {type = "item", name = "carbon-plate", amount = 10},
          {type = "item", name = "electronic-circuit", amount = 10},
          {type = "item", name = "carbon-electronic-circuit", amount = 10}
        },
        results = {{type = "item", name = "cybernetics-facility", amount = 1}},
        energy_required = 5,
        enabled = false
    },
    {
		type = "recipe",
		name = "cybernetic-lab",
        category = "crafting",
		ingredients = {
          {type = "item", name = "carbon-wheel", amount = 1},
        },
        results = {{type = "item", name = "cybernetic-lab", amount = 1}},
        energy_required = 10,
        enabled = false
    },
    {
		type = "recipe",
		name = "quantum-stabilizer",
        category = "crafting",
		ingredients = {
          {type = "item", name = "carbon-wheel", amount = 1},
        },
        results = {{type = "item", name = "quantum-stabilizer", amount = 1}},
        energy_required = 10,
        enabled = false
    },
    {
		type = "recipe",
		name = "oxide-lab",
        category = "crafting",
		ingredients = {
          {type = "item", name = "oxidic-plate", amount = 10},
          {type = "item", name = "oxidic-gear-wheel", amount = 5},
          {type = "item", name = "oxidic-stick", amount = 10},
          {type = "item", name = "carbon-wire", amount = 10},
          {type = "item", name = "carbon-electronic-circuit", amount = 10}
        },
        results = {{type = "item", name = "oxide-lab", amount = 1}},
        energy_required = 0.5,
        enabled = false
    },
    {
		type = "recipe",
		name = "mixing-station",
        category = "crafting",
		ingredients = {
          {type = "item", name = "oxidic-plate", amount = 10},
          {type = "item", name = "oxidic-gear-wheel", amount = 5},
          {type = "item", name = "oxidic-stick", amount = 10},
          {type = "item", name = "carbon-wire", amount = 10},
          {type = "item", name = "carbon-electronic-circuit", amount = 10}
        },
        results = {{type = "item", name = "mixing-station", amount = 1}},
        energy_required = 0.5,
        enabled = false
    },
    {
		type = "recipe",
		name = "chemical-stager",
        category = "crafting",
		ingredients = {
          {type = "item", name = "oxidic-plate", amount = 10},
          {type = "item", name = "oxidic-gear-wheel", amount = 5},
          {type = "item", name = "oxidic-stick", amount = 10},
          {type = "item", name = "carbon-wire", amount = 10},
          {type = "item", name = "carbon-electronic-circuit", amount = 10}
        },
        results = {{type = "item", name = "chemical-stager", amount = 1}},
        energy_required = 0.5,
        enabled = false
    },
    {
		type = "recipe",
		name = "gravity-assembler",
        category = "crafting",
		ingredients = {
          {type = "item", name = "oxidic-plate", amount = 10},
        },
        results = {{type = "item", name = "gravity-assembler", amount = 1}},
        energy_required = 0.5,
        enabled = false
    },
    {
		type = "recipe",
		name = "greenhouse",
        category = "crafting",
		ingredients = {
          {type = "item", name = "oxidic-plate", amount = 10}
        },
        results = {{type = "item", name = "greenhouse", amount = 1}},
        energy_required = 0.5,
        enabled = false
    },

    -- Energy factories
    {
		type = "recipe",
		name = "solar-panel-mk2",
        category = "crafting",
		ingredients = {
          {type = "item", name = "carbon-plate", amount = 10},
          {type = "item", name = "carbon-wheel", amount = 5},
          {type = "item", name = "carbon-stick", amount = 10},
          {type = "item", name = "carbon-wire", amount = 10},
          {type = "item", name = "carbon-electronic-circuit", amount = 10}
        },
        results = {{type = "item", name = "solar-panel-mk2", amount = 1}},
        energy_required = 0.5,
        enabled = false
    },
    {
		type = "recipe",
		name = "solar-panel-mk3",
        category = "crafting",
		ingredients = {
          {type = "item", name = "oxidic-plate", amount = 10},
          {type = "item", name = "oxidic-gear-wheel", amount = 5},
          {type = "item", name = "oxidic-stick", amount = 10},
          {type = "item", name = "oxidic-cable", amount = 10},
          {type = "item", name = "oxidic-electronic-circuit", amount = 10}
        },
        results = {{type = "item", name = "solar-panel-mk3", amount = 1}},
        energy_required = 0.5,
        enabled = false
    },

    -- Smelting
    {
		type = "recipe",
		name = "glass-bottle",
        category = "smelting",
		ingredients = {
          {type = "item", name = "sand", amount = 10}
        },
        results = {{type = "item", name = "glass-bottle", amount = 1}},
        energy_required = 1,
        enabled = false
    },
    {
		type = "recipe",
		name = "oxidic-plate",
        category = "smelting",
		ingredients = {
          {type = "item", name = "oxidic-ore", amount = 2}
        },
        results = {{type = "item", name = "oxidic-plate", amount = 1}},
        energy_required = 1,
        enabled = false
    },
    {
		type = "recipe",
		name = "carbon-steel-plate",
        category = "smelting",
		ingredients = {
          {type = "item", name = "carbon-steel-ore", amount = 2}
        },
        results = {{type = "item", name = "carbon-steel-plate", amount = 1}},
        energy_required = 1,
        enabled = false
    },

    -- Custom-em-plant
    {
		type = "recipe",
		name = "oxidic-electronic-circuit",
        category = "custom-em-plant",
		ingredients = {
          {type = "item", name = "oxidic-cable", amount = 2},
          {type = "item", name = "electronic-circuit", amount = 2},
          {type = "item", name = "silicon-bar", amount = 2}
        },
        results = {{type = "item", name = "oxidic-electronic-circuit", amount = 1}},
        energy_required = 1,
        enabled = false
    },
    {
		type = "recipe",
		name = "blank-data-disk",
        category = "custom-em-plant",
		ingredients = {
          {type = "item", name = "glass-bottle", amount = 2},
          {type = "item", name = "carbon-steel-plate", amount = 2},
          {type = "item", name = "silicon-bar", amount = 2}
        },
        results = {{type = "item", name = "blank-data-disk", amount = 1}},
        energy_required = 1,
        enabled = false
    },

    -- Stabilizing
    {
		type = "recipe",
		name = "energy-data-disk",
        category = "stabilizing",
		ingredients = {
          {type = "item", name = "blank-data-disk", amount = 1},
          {type = "item", name = "fusion-reactor", amount = 1},
        },
        results = {{type = "item", name = "energy-data-disk", amount = 1}},
        energy_required = 30,
        enabled = false
    },
    {
		type = "recipe",
		name = "bio-data-disk",
        category = "stabilizing",
		ingredients = {
          {type = "item", name = "blank-data-disk", amount = 1},
          {type = "item", name = "greenhouse", amount = 1},
        },
        results = {{type = "item", name = "bio-data-disk", amount = 1}},
        energy_required = 30,
        enabled = false
    },
    {
		type = "recipe",
		name = "promethium-data-disk",
        category = "stabilizing",
		ingredients = {
          {type = "item", name = "blank-data-disk", amount = 1},
          {type = "item", name = "promethium-asteroid-chunk", amount = 1},
        },
        results = {{type = "item", name = "promethium-data-disk", amount = 1}},
        energy_required = 30,
        enabled = false
    },
    {
		type = "recipe",
		name = "mechanical-data-disk",
        category = "stabilizing",
		ingredients = {
          {type = "item", name = "blank-data-disk", amount = 1},
          {type = "item", name = "electromagnetic-plant", amount = 1},
        },
        results = {{type = "item", name = "mechanical-data-disk", amount = 1}},
        energy_required = 30,
        enabled = false
    },
    {
		type = "recipe",
		name = "military-data-disk",
        category = "stabilizing",
		ingredients = {
          {type = "item", name = "blank-data-disk", amount = 1},
          {type = "item", name = "rocket-turret", amount = 1},
          {type = "item", name = "railgun", amount = 1},
        },
        results = {{type = "item", name = "military-data-disk", amount = 1}},
        energy_required = 30,
        enabled = false
    },

    -- Science packs
    {
		type = "recipe",
		name = "earth-science-pack",
        category = "crafting",
		ingredients = {
          {type = "item", name = "iron-gear-wheel", amount = 1},
          {type = "item", name = "copper-plate", amount = 2}
        },
        results = {{type = "item", name = "earth-science-pack", amount = 1}},
        energy_required = 1,
        enabled = false
    },
    {
		type = "recipe",
		name = "axkeria-science-pack",
        category = "crafting",
		ingredients = {
          {type = "item", name = "carbon-wheel", amount = 1},
          {type = "item", name = "ice", amount = 1}
        },
        results = {{type = "item", name = "axkeria-science-pack", amount = 1}},
        energy_required = 1,
        enabled = false
    },

    -- Fluid recipes (for science)
    {
		type = "recipe",
		name = "t-one-fluid",
        category = "mixing",
		ingredients = {
          {type = "item", name = "fast-transport-belt", amount = 4},
          {type = "item", name = "fast-inserter", amount = 2}
        },
        results = {{type = "fluid", name = "t-one-fluid", amount = 1000}},
        energy_required = 10,
        enabled = false
    },
    {
		type = "recipe",
		name = "t-two-fluid",
        category = "mixing",
		ingredients = {
          {type = "item", name = "express-transport-belt", amount = 10},
          {type = "item", name = "beacon", amount = 1},
          {type = "item", name = "oxidic-electronic-circuit", amount = 10}
        },
        results = {{type = "fluid", name = "t-two-fluid", amount = 1000}},
        energy_required = 10,
        enabled = false
    },
    {
		type = "recipe",
		name = "t-three-fluid",
        category = "mixing",
		ingredients = {
          {type = "item", name = "turbo-transport-belt", amount = 10},
          {type = "item", name = "processing-unit", amount = 5},
          {type = "item", name = "low-density-structure", amount = 5},
        },
        results = {{type = "fluid", name = "t-three-fluid", amount = 1000}},
        energy_required = 10,
        enabled = false
    },

    -- Mixing recipies
    {
		type = "recipe",
		name = "carbon-steel-ore",
        category = "blending",
		ingredients = {
          {type = "item", name = "carbon", amount = 2},
          {type = "item", name = "iron-ore", amount = 2},
          {type = "fluid", name = "water", amount = 10}
        },
        results = {{type = "item", name = "carbon-steel-ore", amount = 1}},
        energy_required = 5,
        enabled = false
    },
    {
		type = "recipe",
		name = "sulfur-blending",
        category = "blending",
		ingredients = {
          {type = "item", name = "carbon", amount = 2},
          {type = "item", name = "sand", amount = 2},
          {type = "fluid", name = "petroleum-gas", amount = 20}
        },
        results = {{type = "item", name = "sulfur", amount = 1}},
        energy_required = 2,
        enabled = false
    },
    {
		type = "recipe",
		name = "coal-blending",
        category = "blending",
		ingredients = {
          {type = "item", name = "carbon", amount = 2},
          {type = "item", name = "sand", amount = 2},
          {type = "fluid", name = "heavy-oil", amount = 20}
        },
        results = {{type = "item", name = "coal", amount = 1}},
        energy_required = 2,
        enabled = false
    },
    {
		type = "recipe",
		name = "silicon-blending",
        category = "blending",
		ingredients = {
          {type = "item", name = "carbon", amount = 2},
          {type = "fluid", name = "light-oil", amount = 20}
        },
        results = {{type = "item", name = "silicon-bar", amount = 1}},
        energy_required = 2,
        enabled = false
    },
    {
		type = "recipe",
		name = "plastic-blending",
        category = "blending",
		ingredients = {
          {type = "item", name = "carbon", amount = 2},
          {type = "fluid", name = "petroleum-gas", amount = 20}
        },
        results = {{type = "item", name = "plastic-bar", amount = 1}},
        energy_required = 2,
        enabled = false
    },
    {
		type = "recipe",
		name = "tungsten-carbide-blending",
        category = "blending",
		ingredients = {
          {type = "item", name = "carbon", amount = 1},
          {type = "item", name = "tungsten-ore", amount = 2},
          {type = "fluid", name = "sulfuric-acid", amount = 10}
        },
        results = {{type = "item", name = "tungsten-carbide", amount = 1}},
        energy_required = 2,
        enabled = false
    },
    {
		type = "recipe",
		name = "battery-blending",
        category = "blending",
		ingredients = {
          {type = "item", name = "iron-plate", amount = 1},
          {type = "item", name = "copper-plate", amount = 1},
          {type = "item", name = "carbon-steel-plate", amount = 1},
          {type = "fluid", name = "sulfuric-acid", amount = 20}
        },
        results = {{type = "item", name = "battery", amount = 1}},
        energy_required = 3,
        enabled = false
    },

    -- Dissolution recipes
    {
		type = "recipe",
		name = "oil-dissolution",
        category = "dissolution",
		ingredients = {
          {type = "item", name = "carbonic-asteroid-chunk", amount = 2},
          {type = "item", name = "oxide-asteroid-chunk", amount = 2},
        },
        results = {{type = "fluid", name = "crude-oil", amount = 200}},
        energy_required = 5,
        enabled = false,
        allow_productivity = true,
    },
    {
		type = "recipe",
		name = "crude-oil-dissolution",
        category = "dissolution",
		ingredients = {
          {type = "fluid", name = "crude-oil", amount = 100},
          {type = "fluid", name = "water", amount = 10},
        },
        results = {
            {type = "fluid", name = "heavy-oil", amount = 70},
            {type = "fluid", name = "light-oil", amount = 30}
        },
        energy_required = 2,
        enabled = false,
        icon = "__base__/graphics/icons/fluid/advanced-oil-processing.png",
        subgroup = "fluid-recipes",
        order = "a[oil-processing]-b[advanced-oil-processing]"
    },
    {
		type = "recipe",
		name = "heavy-oil-dissolution",
        category = "dissolution",
		ingredients = {
          {type = "fluid", name = "heavy-oil", amount = 10},
          {type = "fluid", name = "water", amount = 10},
        },
        results = {{type = "fluid", name = "light-oil", amount = 10}},
        energy_required = 2,
        enabled = false,
        icon = "__base__/graphics/icons/fluid/heavy-oil-cracking.png",
        subgroup = "fluid-recipes",
        order = "b[fluid-chemistry]-a[heavy-oil-cracking]",
    },
    {
		type = "recipe",
		name = "light-oil-dissolution",
        category = "dissolution",
		ingredients = {
          {type = "fluid", name = "light-oil", amount = 10},
          {type = "fluid", name = "water", amount = 10},
        },
        results = {{type = "fluid", name = "petroleum-gas", amount = 10}},
        energy_required = 2,
        enabled = false,
        icon = "__base__/graphics/icons/fluid/light-oil-cracking.png",
        subgroup = "fluid-recipes",
        order = "b[fluid-chemistry]-b[light-oil-cracking]",
    },
    {
		type = "recipe",
		name = "sulfuric-dissolution",
        category = "dissolution",
		ingredients = {
          {type = "item", name = "iron-plate", amount = 1},
          {type = "item", name = "carbon-plate", amount = 1},
          {type = "item", name = "sulfur", amount = 5},
          {type = "fluid", name = "water", amount = 100}
        },
        results = {{type = "fluid", name = "sulfuric-acid", amount = 50}},
        energy_required = 2,
        enabled = false
    },

    -- Bottling recipes for science packs
    {
		type = "recipe",
		name = "t-one-science-pack",
        category = "bottling",
		ingredients = {
          {type = "item", name = "glass-bottle", amount = 1},
          {type = "fluid", name = "t-one-fluid", amount = 100}
        },
        results = {{type = "item", name = "t-one-science-pack", amount = 1}},
        energy_required = 10,
        enabled = false
    },
    {
		type = "recipe",
		name = "t-two-science-pack",
        category = "bottling",
		ingredients = {
          {type = "item", name = "glass-bottle", amount = 1},
          {type = "fluid", name = "t-two-fluid", amount = 100}
        },
        results = {{type = "item", name = "t-two-science-pack", amount = 1}},
        energy_required = 10,
        enabled = false
    },
    {
		type = "recipe",
		name = "t-three-science-pack",
        category = "bottling",
		ingredients = {
          {type = "item", name = "glass-bottle", amount = 1},
          {type = "fluid", name = "t-three-fluid", amount = 100}
        },
        results = {{type = "item", name = "t-three-science-pack", amount = 1}},
        energy_required = 10,
        enabled = false
    },

    -- Asteroid crushing recipes
    {
        type = "recipe",
        name = "crush-irony-asteroid-chunk",
        category = "crushing",
        subgroup="space-crushing",
        icon = "__escape-to-space__/graphics/icons/irony-asteroid-crushing.png",
        ingredients = {
            {type = "item", name = "irony-asteroid-chunk", amount = 1}
        },
        results = {
            {type = "item", name = "iron-ore", amount = 10},
            {type = "item", name = "irony-asteroid-chunk", amount = 1, probability = 0.20, ignored_by_productivity = 1},
            {type = "item", name = "sand", amount = 1, probability = 0.05}
        },
        energy_required = 5,
        allow_productivity = true,
        enabled = true
    },
    {
        type = "recipe",
        name = "crush-coppery-asteroid-chunk",
        category = "crushing",
        subgroup="space-crushing",
        icon = "__escape-to-space__/graphics/icons/coppery-asteroid-crushing.png",
        ingredients = {
            {type = "item", name = "coppery-asteroid-chunk", amount = 1}
        },
        results = {
            {type = "item", name = "copper-ore", amount = 8},
            {type = "item", name = "coppery-asteroid-chunk", amount = 1, probability = 0.20, ignored_by_productivity = 1},
            {type = "item", name = "sand", amount = 1, probability = 0.05}
        },
        energy_required = 5,
        allow_productivity = true,
        enabled = true
    },
    {
        type = "recipe",
        name = "crush-rocky-asteroid-chunk",
        category = "crushing",
        subgroup="space-crushing",
        icon = "__escape-to-space__/graphics/icons/rocky-asteroid-crushing.png",
        ingredients = {
            {type = "item", name = "rocky-asteroid-chunk", amount = 1}
        },
        results = {
            {type = "item", name = "stone", amount = 10},
            {type = "item", name = "rocky-asteroid-chunk", amount = 1, probability = 0.20, ignored_by_productivity = 1},
            {type = "item", name = "sand", amount = 1, probability = 0.05}
        },
        energy_required = 5,
        allow_productivity = true,
        enabled = true
    },
    {
        type = "recipe",
        name = "crush-stone",
        category = "crushing",
        subgroup="space-crushing",
        icon = "__escape-to-space__/graphics/icons/crush-stone.png",
        ingredients = {
            {type = "item", name = "stone", amount = 5}
        },
        results = {
            {type = "item", name = "sand", amount = 10},
        },
        energy_required = 5,
        allow_productivity = true,
        enabled = true
    },
    {
        type = "recipe",
        name = "crush-oxide-chunk",
        category = "crushing",
        subgroup="space-crushing",
        icon = data.raw["recipe"]["oxide-asteroid-crushing"].icon,
        ingredients = {
            {type = "item", name = "oxide-asteroid-chunk", amount = 1}
        },
        results = {
            {type = "item", name = "oxidic-ore", amount = 2},
            {type = "item", name = "oxide-asteroid-chunk", amount = 1, probability = 0.20, ignored_by_productivity = 1}
        },
        energy_required = 5,
        allow_productivity = true,
        enabled = false
    },
    {
        type = "recipe",
        name = "crush-tungsten-chunk",
        category = "crushing",
        subgroup="space-crushing",
        icon = "__escape-to-space__/graphics/icons/tungsten-asteroid-crushing.png",
        ingredients = {
            {type = "item", name = "tungsten-asteroid-chunk", amount = 1}
        },
        results = {
            {type = "item", name = "tungsten-ore", amount = 4},
            {type = "item", name = "tungsten-asteroid-chunk", amount = 1, probability = 0.20, ignored_by_productivity = 1}
        },
        energy_required = 5,
        allow_productivity = true,
        enabled = false
    },
    {
        type = "recipe",
        name = "scrap-asteroid-crushing",
        icon = "__escape-to-space__/graphics/icons/scrap-asteroid-crushing.png",
        category = "crushing",
        subgroup="space-crushing",
        energy_required = 2,
        ingredients = {{type="item", name="scrap-asteroid-chunk", amount=1}},
        results = {
            {type="item", name="scrap", amount=20},
            {type = "item", name = "scrap-asteroid-chunk", amount = 1, probability = 0.2}
        },
        allow_productivity = true,
        enabled = false
    },
    {
        type = "recipe",
        name = "alien-asteroid-crushing",
        icon = "__escape-to-space__/graphics/icons/alien-asteroid-crushing.png",
        category = "crushing",
        subgroup="space-crushing",
        energy_required = 2,
        ingredients = {{type="item", name="alien-asteroid-chunk", amount=1}},
        results = {
            {type="item", name="yumako-seed", amount=8},
            {type = "item", name = "alien-asteroid-chunk", amount = 1, probability = 0.2}
        },
        allow_productivity = true,
        enabled = false
    },
    {
        type = "recipe",
        name = "fluorite-asteroid-crushing",
        icon = "__escape-to-space__/graphics/icons/fluorite-asteroid-crushing.png",
        category = "crushing",
        subgroup="space-crushing",
        energy_required = 2,
        ingredients = {{type="item", name="fluorite-asteroid-chunk", amount=1}},
        results = {
            {type="item", name="fluorite", amount=8},
            {type = "item", name = "fluorite-asteroid-chunk", amount = 1, probability = 0.2}
        },
        allow_productivity = true,
        enabled = false
    },

    -- Metallurgy recipes
    {
        type = "recipe",
        name = "tungsten-plate",
        category = "custom-metallurgy",
        ingredients = {
            {type = "item", name = "tungsten-ore", amount = 1},
            {type = "item", name = "iron-ore", amount = 4},
        },
        results = {{type ="item", name = "tungsten-plate", amount = 1}},
        energy_required = 2,
        allow_productivity = true,
        enabled = false
    },
    {
		type = "recipe",
		name = "carbon-steel-plate-metallurgy",
        category = "custom-metallurgy",
		ingredients = {
          {type = "item", name = "carbon-steel-ore", amount = 1},
          {type = "item", name = "iron-ore", amount = 4},
        },
        results = {{type = "item", name = "carbon-steel-plate", amount = 1}},
        energy_required = 2,
        allow_productivity = true,
        enabled = false
    },

    -- Bio recipes
    {
        type = "recipe",
        name = "tree-seed",
        icon = "__escape-to-space__/graphics/icons/tree-seed.png",
        category = "bio",
        ingredients = {
            {type = "item", name = "biomass", amount = 10},
            {type = "fluid", name = "water", amount = 100},
        },
        results = {{type ="item", name = "tree-seed", amount = 1}},
        energy_required = 5,
        allow_productivity = true,
        enabled = false
    },
    {
        type = "recipe",
        name = "tree-seed-2",
        icon = "__escape-to-space__/graphics/icons/tree-seed.png",
        category = "bio",
        ingredients = {
            {type = "item", name = "wood", amount = 2},
            {type = "fluid", name = "water", amount = 100},
        },
        results = {{type ="item", name = "tree-seed", amount = 1}},
        energy_required = 5,
        allow_productivity = true,
        enabled = false
    },
    {
        type = "recipe",
        name = "wood",
        icon = "__base__/graphics/icons/wood.png",
        category = "bio",
        ingredients = {
            {type = "item", name = "tree-seed", amount = 1},
            {type = "fluid", name = "water", amount = 100},
        },
        results = {
            {type ="item", name = "wood", amount = 4},
        },
        energy_required = 5,
        allow_productivity = true,
        enabled = false
    },
    {
        type = "recipe",
        name = "biomass",
        icon = "__escape-to-space__/graphics/icons/biomass.png",
        category = "bio",
        ingredients = {
            {type = "item", name = "wood", amount = 2},
            {type = "fluid", name = "water", amount = 100},
        },
        results = {
            {type ="item", name = "biomass", amount = 4}
        },
        energy_required = 5,
        allow_productivity = true,
        enabled = false
    },
})