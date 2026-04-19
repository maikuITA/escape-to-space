-- technology.lua

-- BUILDING CUSTOM TECH TREE BASED ON FACTORIO TECH TREE:
-- https://wiki.factorio.com/Technology
-- Only new technologies

-- Electronics
local electronics_tech = table.deepcopy(data.raw.technology["electronics"])
if electronics_tech then
    electronics_tech.effects = {
        {
            type = "unlock-recipe",
            recipe = "cybernetics-facility"
        },
        {
            type = "unlock-recipe",
            recipe = "oxide-lab"
        },
        {
            type = "unlock-recipe",
            recipe = "blank-data-disk"
        },
        {
            type = "unlock-recipe",
            recipe = "basic-data-disk"
        },
    }
    electronics_tech.research_trigger =
    {
      type = "craft-item",
      item = "electronic-circuit",
      count = 10
    }
    electronics_tech.hidden = false
    electronics_tech.enabled = true
    data:extend({electronics_tech})
end
--------------------------------------------------------------------------

-- Space machines
local space_machines_tech = {
    type = "technology",
    name = "space-machines",
    icon = "__space-age__/graphics/technology/space-platform-thruster.png",
    icon_size = 256,
    unit = {
        count = 100,
        ingredients = {
            {"basic-data-disk", 1},
        },
        time = 10
    },
    effects = {
        {
            type = "unlock-recipe",
            recipe = "cargo-bay"
        },
        {
            type = "unlock-recipe",
            recipe = "asteroid-collector"
        },
        {
            type = "unlock-recipe",
            recipe = "crusher"
        },
        {
            type = "unlock-recipe",
            recipe = "thruster"
        },
        {
            type = "unlock-recipe",
            recipe = "thruster-fuel"
        },
        {
            type = "unlock-recipe",
            recipe = "thruster-oxidizer"
        },
    },
    hidden = false,
    enabled = true,
    prerequisites = {"electronics"}
}

if space_machines_tech then
    data:extend({space_machines_tech})
end
--------------------------------------------------------------------------

-- Fast inserter
local fast_inserter_tech = {
    type = "technology",
    name = "fast-inserter",
    icon = "__base__/graphics/technology/fast-inserter.png",
    icon_size = 256,
    unit = {
        count = 100,
        ingredients = {
            {"basic-data-disk", 1},
        },
        time = 10
    },
    effects = {
        {
            type = "unlock-recipe",
            recipe = "fast-inserter"
        },
    },
    hidden = false,
    enabled = true,
    prerequisites = {"electronics"}
}

if fast_inserter_tech then
    data:extend({fast_inserter_tech})
end
--------------------------------------------------------------------------

-- Planet Axos 
local axos_discovery = {
    type = "technology",
    name = "planet-discovery-axos",
    icon = "__space-age__/graphics/technology/space-platform-thruster.png",
    icon_size = 256,
    unit = {
        count = 250,
        ingredients = {
            {"basic-data-disk", 1},
        },
        time = 10,
    },
    effects = {
        {
            type = "unlock-space-location",
            space_location = "axos",
            use_icon_overlay_constant = true
        },
        {
            type = "unlock-recipe",
            recipe = "carbon"
        },
    },
    hidden = false,
    enabled = true,
    prerequisites = {
        "space-machines",
    }
}

if axos_discovery then
    data:extend({axos_discovery})
end
--------------------------------------------------------------------------

-- Planet Keria
local keria_discovery = {
    type = "technology",
    name = "planet-discovery-keria",
    icon = "__space-age__/graphics/technology/space-platform-thruster.png",
    icon_size = 256,
    unit = {
        count = 250,
        ingredients = {
            {"basic-data-disk", 1},
        },
        time = 10,
    },
    effects = {
        {
            type = "unlock-space-location",
            space_location = "keria",
            use_icon_overlay_constant = true
        },
        {
            type = "unlock-recipe",
            recipe = "ice"
        },
        {
            type = "unlock-recipe",
            recipe = "ice-melting"
        },
    },
    hidden = false,
    enabled = true,
    prerequisites = {
        "space-machines",
    }
}

if keria_discovery then
    data:extend({keria_discovery})
end
--------------------------------------------------------------------------

-- Carbon processing
local carbon_processing = {
    type = "technology",
    name = "carbon-processing",
    icon = "__escape-to-space__/graphics/technology/carbon-engine-unit.png",
    icon_size = 256,
    unit = {
        count = 100,
        ingredients = {
            {"basic-data-disk", 1},
        },
        time = 10,
    },
    effects = {
        {
            type = "unlock-recipe",
            recipe = "carbon-gear-wheel"
        },
        {
            type = "unlock-recipe",
            recipe = "carbon-plate"
        },
        {
            type = "unlock-recipe",
            recipe = "carbon-wire"
        },
        {
            type = "unlock-recipe",
            recipe = "carbon-stick"
        },
        {
            type = "unlock-recipe",
            recipe = "carbon-pipe"
        },
        {
            type = "unlock-recipe",
            recipe = "carbon-engine-unit"
        },
    },
    hidden = false,
    enabled = true,
    prerequisites = {
        "electronics",
        "planet-discovery-axos",
    }
}

if carbon_processing then
    data:extend({carbon_processing})
end
--------------------------------------------------------------------------

-- Data disk mk1
local data_disk_mk1 = {
    type = "technology",
    name = "data-disk-mk1",
    icon = "__escape-to-space__/graphics/technology/data-disk-mk1.png",
    icon_size = 256,
    unit = {
        count = 200,
        ingredients = {
            {"basic-data-disk", 1},
        },
        time = 10,
    },
    effects = {
        {
            type = "unlock-recipe",
            recipe = "data-disk-mk1"
        },
    },
    hidden = false,
    enabled = true,
    prerequisites = {
        "electronics",
        "fast-inserter",
        "carbon-processing",
        "planet-discovery-keria",
    }
}

if data_disk_mk1 then
    data:extend({data_disk_mk1})
end
--------------------------------------------------------------------------