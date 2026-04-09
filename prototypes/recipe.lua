data:extend({
    -- Modded items recipes

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
        enabled = true
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
        enabled = true
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
        enabled = true
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
        enabled = true
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
        enabled = true
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
        enabled = true
    },
    {
		type = "recipe",
		name = "t-one-science-pack",
        category = "crafting",
		ingredients = {
          {type = "item", name = "iron-gear-wheel", amount = 1},
          {type = "item", name = "copper-plate", amount = 2}
        },
        results = {{type = "item", name = "t-one-science-pack", amount = 1}},
        energy_required = 1,
        enabled = false
    },
    {
		type = "recipe",
		name = "t-two-science-pack",
        category = "crafting",
		ingredients = {
          {type = "item", name = "iron-gear-wheel", amount = 1},
          {type = "item", name = "copper-plate", amount = 2}
        },
        results = {{type = "item", name = "t-two-science-pack", amount = 1}},
        energy_required = 1,
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

    -- Metallurgy recipes
    {
        type = "recipe",
        name = "i-cast-bullet",
        category = "metallurgy",
        ingredients = {
            {type = "fluid", name = "molten-iron", amount = 400, fluidbox_multiplier = 10} -- 40 iron plate
        },
        results = {{type ="item", name = "firearm-magazine", amount = 10}},
        energy_required = 10,
        allow_productivity = false,
        enabled = false
    },
    {
        type = "recipe",
        name = "i-cast-red-bullet",
        category = "metallurgy",
        ingredients = {
            {type = "item", name = "firearm-magazine", amount = 10},
            {type = "fluid", name = "molten-iron", amount = 150, fluidbox_multiplier = 10}, -- 5 steel beams
            {type = "fluid", name = "molten-copper", amount = 100, fluidbox_multiplier = 10} -- 10 copper plate
        },
        results = {{type ="item", name = "piercing-rounds-magazine", amount = 10}},
        energy_required = 10,
        allow_productivity = false,
        enabled = false
    },
    {
        type = "recipe",
        name = "i-cast-nuclear-bullet",
        category = "metallurgy",
        ingredients = {
            {type = "item", name = "piercing-rounds-magazine", amount = 10},
            {type = "item", name = "uranium-238", amount = 10}
        },
        results = {{type ="item", name = "uranium-rounds-magazine", amount = 10}},
        energy_required = 10,
        allow_productivity = false,
        enabled = false
    }
})