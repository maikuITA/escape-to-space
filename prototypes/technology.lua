-- technology.lua

-- Hiding and disabling the vanilla tech tree

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
        tech.unit.ingredients = {{"earth-science-pack", 1}}
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

-- BUILDING CUSTOM TECH TREE BASED ON FACTORIO TECH TREE:
-- https://wiki.factorio.com/Technology
-- Only new technologies

-- Solar panel mk2
local solar_panel_mk2 = table.deepcopy(data.raw["technology"]["solar-energy"])
if solar_panel_mk2 then
    solar_panel_mk2.name = "solar-energy-mk2"
    solar_panel_mk2.icon = "__escape-to-space__/graphics/technology/solar-energy-mk2.png"
    solar_panel_mk2.icon_size = 256
    solar_panel_mk2.unit = {
        count = 100,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1}
        },
        time = 10,
    }
    solar_panel_mk2.effects = {
        {
            type = "unlock-recipe",
            recipe = "solar-panel-mk2"
        },
    }
    solar_panel_mk2.hidden = false
    solar_panel_mk2.enabled = true
    solar_panel_mk2.prerequisites = {"logistic-science-pack", "landfill"}
    data:extend({
        solar_panel_mk2
    })
end

-- Solar panel mk3
local solar_panel_mk3 = table.deepcopy(data.raw["technology"]["solar-energy"])
if solar_panel_mk3 then
    solar_panel_mk3.name = "solar-energy-mk3"
    solar_panel_mk3.icon = "__escape-to-space__/graphics/technology/solar-energy-mk3.png"
    solar_panel_mk3.icon_size = 256
    solar_panel_mk3.unit = {
        count = 100,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1},
            {"t-one-science-pack", 1}
        },
        time = 10,
    }
    solar_panel_mk3.effects = {
        {
            type = "unlock-recipe",
            recipe = "solar-panel-mk3"
        },
    }
    solar_panel_mk3.hidden = false
    solar_panel_mk3.enabled = true
    solar_panel_mk3.prerequisites = {"military-science-pack", "landfill"}
    data:extend({
        solar_panel_mk3
    })
end

local advanced_fuel = table.deepcopy(data.raw["technology"]["gun-turret"])
if advanced_fuel then
    advanced_fuel.name = "advanced-fuel-processing"
    advanced_fuel.icon = "__space-age__/graphics/technology/calcite-processing.png"
    advanced_fuel.icon_size = 256
    advanced_fuel.unit = {
        count = 100,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1},
            {"t-one-science-pack", 1}
        },
        time = 10,
    }
    advanced_fuel.effects = {
        {
            type = "unlock-recipe",
            recipe = "crush-oxide-chunk2"
        },
        {
            type = "unlock-recipe",
            recipe = "advanced-thruster-fuel"
        },
        {
            type = "unlock-recipe",
            recipe = "advanced-thruster-oxidizer"
        },
    }
    advanced_fuel.hidden = false
    advanced_fuel.enabled = true
    advanced_fuel.prerequisites = {"military-science-pack"}
    data:extend({
        advanced_fuel
    })
end

--Dissoluting
local dissoluting = table.deepcopy(data.raw["technology"]["gun-turret"])
if dissoluting then
    dissoluting.name = "dissoluting"
    dissoluting.icon = "__escape-to-space__/graphics/technology/chemical-stager-icon-big.png"
    dissoluting.icon_size = 320
    dissoluting.unit = {
        count = 100,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1},
            {"t-one-science-pack", 1}
        },
        time = 10,
    }
    dissoluting.effects = {
        {
            type = "unlock-recipe",
            recipe = "chemical-stager"
        },
        {
            type = "unlock-recipe",
            recipe = "oil-dissolution"
        },
        {
            type = "unlock-recipe",
            recipe = "crude-oil-dissolution"
        },
        {
            type = "unlock-recipe",
            recipe = "heavy-oil-dissolution"
        },
        {
            type = "unlock-recipe",
            recipe = "light-oil-dissolution"
        },
        {
            type = "unlock-recipe",
            recipe = "sulfuric-dissolution"
        },
    }
    dissoluting.hidden = false
    dissoluting.enabled = true
    dissoluting.prerequisites = {"automation-science-pack", "logistic-science-pack", "military-science-pack", "fluid-handling"}
end

data:extend({dissoluting})

--Blending
local blending = table.deepcopy(data.raw["technology"]["gun-turret"])
if blending then
    blending.name = "blending"
    blending.icon = "__escape-to-space__/graphics/technology/mixing-station-icon-big.png"
    blending.icon_size = 640
    blending.unit = {
        count = 100,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1},
            {"t-one-science-pack", 1}
        },
        time = 10,
    }
    blending.effects = {
        {
            type = "unlock-recipe",
            recipe = "mixing-station"
        },
        {
            type = "unlock-recipe",
            recipe = "carbon-steel-ore"
        },
        {
            type = "unlock-recipe",
            recipe = "carbon-steel-plate"
        },
        {
            type = "unlock-recipe",
            recipe = "sulfur-blending"
        },
        {
            type = "unlock-recipe",
            recipe = "coal-blending"
        },
        {
            type = "unlock-recipe",
            recipe = "silicon-blending"
        },
        {
            type = "unlock-recipe",
            recipe = "plastic-blending"
        },
        {
            type = "unlock-recipe",
            recipe = "battery-blending"
        },
    }
    blending.hidden = false
    blending.enabled = true
    blending.prerequisites = {"automation-science-pack", "logistic-science-pack", "military-science-pack", "heavy-armor", "dissoluting"}
end

data:extend({blending})

-- Lubricant
local lubricant = table.deepcopy(data.raw["technology"]["lubricant"])
if lubricant then
    lubricant.unit = {
        count = 100,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1},
            {"t-one-science-pack", 1}
        },
        time = 10,
    }
    lubricant.effects = {
        {
            type = "unlock-recipe",
            recipe = "lubricant"
        },
    }
    lubricant.hidden = false
    lubricant.enabled = true
    lubricant.prerequisites = {"automation-science-pack", "logistic-science-pack", "military-science-pack", "dissoluting"}
end

data:extend({lubricant})

local t_two_sp = table.deepcopy(data.raw["technology"]["military-science-pack"])
if t_two_sp then
    t_two_sp.name = "t-two-science-pack"
    t_two_sp.icon = "__escape-to-space__/graphics/technology/t-two-science-pack.png"
    t_two_sp.icon_size = 256
    t_two_sp.unit = {
        count = 250,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1},
            {"t-one-science-pack", 1}
        },
        time = 10,
    }
    t_two_sp.effects = {
        {
            type = "unlock-recipe",
            recipe = "t-two-fluid"
        },
        {
            type = "unlock-recipe",
            recipe = "t-two-science-pack"
        },
    }
    t_two_sp.hidden = false
    t_two_sp.enabled = true
    t_two_sp.prerequisites = {
        "automation-science-pack",
        "logistic-science-pack",
        "military-science-pack",
        "advanced-circuit",
        "logistics-3",
        "modules",
        "effect-transmission",
        "blending",
    }
end

data:extend({t_two_sp})

-- Planet Nekohaven
local nekohaven = table.deepcopy(data.raw["technology"]["planet-discovery-vulcanus"])
if nekohaven then
    nekohaven.name = "planet-discovery-nekohaven"
    nekohaven.icons = util.technology_icon_constant_planet("__escape-to-space__/graphics/technology/nekohaven.png")
    nekohaven.icon_size = 512
    nekohaven.unit = {
        count = 500,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1},
            {"t-one-science-pack", 1},
            {"t-two-science-pack", 1}
        },
        time = 10,
    }
    nekohaven.effects = {
        {
            type = "unlock-space-location",
            space_location = "nekohaven",
            use_icon_overlay_constant = true
        },
    }
    nekohaven.hidden = false
    nekohaven.enabled = true
    nekohaven.prerequisites = {
        "t-two-science-pack",
    }
    data:extend({nekohaven})
end

-- Planet Ropoloid
local ropoloid = table.deepcopy(data.raw["technology"]["planet-discovery-vulcanus"])
if ropoloid then
    ropoloid.name = "planet-discovery-ropoloid"
    ropoloid.icons = util.technology_icon_constant_planet("__escape-to-space__/graphics/technology/ropoloid.png")
    ropoloid.icon_size = 512
    ropoloid.unit = {
        count = 500,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1},
            {"t-one-science-pack", 1},
            {"t-two-science-pack", 1}
        },
        time = 10,
    }
    ropoloid.effects = {
        {
            type = "unlock-space-location",
            space_location = "ropoloid",
            use_icon_overlay_constant = true
        },
    }
    ropoloid.hidden = false
    ropoloid.enabled = true
    ropoloid.prerequisites = {
        "t-two-science-pack",
    }
    data:extend({ropoloid})
end

-- Greenhouse
local greenhouse = table.deepcopy(data.raw["technology"]["gun-turret"])
if greenhouse then
    greenhouse.name = "greenhouse"
    greenhouse.icon = "__escape-to-space__/graphics/technology/greenhouse-icon.png"
    greenhouse.icon_size = 640
    greenhouse.unit = {
        count = 100,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1},
            {"t-one-science-pack", 1},
            {"t-two-science-pack", 1}
        },
        time = 10,
    }
    greenhouse.effects = {
        {
            type = "unlock-recipe",
            recipe = "greenhouse"
        },
        {
            type = "unlock-recipe",
            recipe = "tree-seed"
        },
        {
            type = "unlock-recipe",
            recipe = "tree-seed-2"
        },
        {
            type = "unlock-recipe",
            recipe = "wood"
        },
    }
    greenhouse.hidden = false
    greenhouse.enabled = true
    greenhouse.prerequisites = {"planet-discovery-nekohaven"}
    data:extend({greenhouse})
end

-- Abandoned space platform
local space_platform = table.deepcopy(data.raw["technology"]["gun-turret"])
if space_platform then
    space_platform.name = "abandoned-space-platform"
    space_platform.icon = data.raw["technology"]["rocket-silo"].icon
    space_platform.icon_size = data.raw["technology"]["rocket-silo"].icon_size
    space_platform.unit = {
        count = 100,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1},
            {"t-one-science-pack", 1},
            {"t-two-science-pack", 1}
        },
        time = 10,
    }
    space_platform.effects = {
        {
            type = "unlock-recipe",
            recipe = "radio-terminal"
        },
    }
    space_platform.hidden = false
    space_platform.enabled = true
    space_platform.prerequisites = {"planet-discovery-ropoloid"}
    data:extend({space_platform})
end

-- Tier 3 science pack
local t_three_sp = table.deepcopy(data.raw["technology"]["military-science-pack"])
if t_three_sp then
    t_three_sp.name = "t-three-science-pack"
    t_three_sp.icon = "__escape-to-space__/graphics/technology/t-three-science-pack.png"
    t_three_sp.icon_size = 256
    t_three_sp.unit = {
        count = 500,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1},
            {"t-one-science-pack", 1},
            {"t-two-science-pack", 1}
        },
        time = 10,
    }
    t_three_sp.effects = {
        {
            type = "unlock-recipe",
            recipe = "t-three-fluid"
        },
        {
            type = "unlock-recipe",
            recipe = "t-three-science-pack"
        },
        {
            type = "unlock-recipe",
            recipe = "quantum-stabilizer"
        },
        {
            type = "unlock-recipe",
            recipe = "cybernetic-lab"
        },
    }
    t_three_sp.hidden = false
    t_three_sp.enabled = true
    t_three_sp.prerequisites = {
        "automation-science-pack",
        "logistic-science-pack",
        "military-science-pack",
        "t-two-science-pack",
        "planet-discovery-vulcanus",
        "planet-discovery-fulgora",
        "planet-discovery-gleba",
        "planet-discovery-aquilo",
    }
end

data:extend({t_three_sp})

-- data_disks
local data_disks = table.deepcopy(data.raw["technology"]["gun-turret"])
if data_disks then
    data_disks.name = "data-disks"
    data_disks.icon = "__escape-to-space__/graphics/technology/blank-data-disk.png"
    data_disks.icon_size = 128
    data_disks.unit = {
        count = 500,
        ingredients = {
            {"t-one-science-pack", 1},
            {"t-two-science-pack", 1},
            {"t-three-science-pack", 1}
        },
        time = 10,
    }
    data_disks.effects = {
        {
            type = "unlock-recipe",
            recipe = "blank-data-disk"
        },
    }
    data_disks.hidden = false
    data_disks.enabled = true
    data_disks.prerequisites = {"t-three-science-pack"}
end

data:extend({data_disks})

-- Energy data pack
local energy_data_disk = table.deepcopy(data.raw["technology"]["gun-turret"])
if energy_data_disk then
    energy_data_disk.name = "energy-data-disk"
    energy_data_disk.icon = "__escape-to-space__/graphics/technology/energy-data-disk.png"
    energy_data_disk.icon_size = 128
    energy_data_disk.unit = {
        count = 500,
        ingredients = {
            {"t-one-science-pack", 1},
            {"t-two-science-pack", 1},
            {"t-three-science-pack", 1}
        },
        time = 10,
    }
    energy_data_disk.effects = {
        {
            type = "unlock-recipe",
            recipe = "energy-data-disk"
        },
    }
    energy_data_disk.hidden = false
    energy_data_disk.enabled = true
    energy_data_disk.prerequisites = {"t-three-science-pack", "data-disks"}
end

data:extend({energy_data_disk})

-- Bio data disk
local bio_data_disk = table.deepcopy(data.raw["technology"]["gun-turret"])
if bio_data_disk then
    bio_data_disk.name = "bio-data-disk"
    bio_data_disk.icon = "__escape-to-space__/graphics/technology/bio-data-disk.png"
    bio_data_disk.icon_size = 128
    bio_data_disk.unit = {
        count = 500,
        ingredients = {
            {"t-one-science-pack", 1},
            {"t-two-science-pack", 1},
            {"t-three-science-pack", 1}
        },
        time = 10,
    }
    bio_data_disk.effects = {
        {
            type = "unlock-recipe",
            recipe = "bio-data-disk"
        },
    }
    bio_data_disk.hidden = false
    bio_data_disk.enabled = true
    bio_data_disk.prerequisites = {"t-three-science-pack", "data-disks", "greenhouse"}
end

data:extend({bio_data_disk})

-- Promethium data pack
local promethium_data_disk = table.deepcopy(data.raw["technology"]["gun-turret"])
if promethium_data_disk then
    promethium_data_disk.name = "promethium-data-disk"
    promethium_data_disk.icon = "__escape-to-space__/graphics/technology/promethium-data-disk.png"
    promethium_data_disk.icon_size = 128
    promethium_data_disk.unit = {
        count = 500,
        ingredients = {
            {"t-one-science-pack", 1},
            {"t-two-science-pack", 1},
            {"t-three-science-pack", 1}
        },
        time = 10,
    }
    promethium_data_disk.effects = {
        {
            type = "unlock-recipe",
            recipe = "promethium-data-disk"
        },
        {
            type = "unlock-space-location",
            space_location = "solar-system-edge"
        },
        {
            type = "unlock-space-location",
            space_location = "shattered-planet"
        },
    }
    promethium_data_disk.hidden = false
    promethium_data_disk.enabled = true
    promethium_data_disk.prerequisites = {"t-three-science-pack", "data-disks"}
end

data:extend({promethium_data_disk})

-- Mechanical data pack
local mechanical_data_disk = table.deepcopy(data.raw["technology"]["gun-turret"])
if mechanical_data_disk then
    mechanical_data_disk.name = "mechanical-data-disk"
    mechanical_data_disk.icon = "__escape-to-space__/graphics/technology/mechanical-data-disk.png"
    mechanical_data_disk.icon_size = 128
    mechanical_data_disk.unit = {
        count = 500,
        ingredients = {
            {"t-one-science-pack", 1},
            {"t-two-science-pack", 1},
            {"t-three-science-pack", 1}
        },
        time = 10,
    }
    mechanical_data_disk.effects = {
        {
            type = "unlock-recipe",
            recipe = "mechanical-data-disk"
        },
    }
    mechanical_data_disk.hidden = false
    mechanical_data_disk.enabled = true
    mechanical_data_disk.prerequisites = {"t-three-science-pack", "data-disks"}
end

data:extend({mechanical_data_disk})

-- Military data disk
local military_data_disk = table.deepcopy(data.raw["technology"]["gun-turret"])
if military_data_disk then
    military_data_disk.name = "military-data-disk"
    military_data_disk.icon = "__escape-to-space__/graphics/technology/military-data-disk.png"
    military_data_disk.icon_size = 128
    military_data_disk.unit = {
        count = 500,
        ingredients = {
            {"t-one-science-pack", 1},
            {"t-two-science-pack", 1},
            {"t-three-science-pack", 1}
        },
        time = 10,
    }
    military_data_disk.effects = {
        {
            type = "unlock-recipe",
            recipe = "military-data-disk"
        },
    }
    military_data_disk.hidden = false
    military_data_disk.enabled = true
    military_data_disk.prerequisites = {"t-three-science-pack", "data-disks", "railgun", "rocket-turret"}
end

data:extend({military_data_disk})

-- Dissoluting productivity max10
local dissoluting_prod = table.deepcopy(data.raw["technology"]["gun-turret"])
if dissoluting_prod then
    dissoluting_prod.name = "dissoluting-productivity"
    dissoluting_prod.icon = data.raw["technology"]["productivity-module-3"].icon
    dissoluting_prod.icon_size = data.raw["technology"]["productivity-module-3"].icon_size
    dissoluting_prod.unit =
    {
      count_formula = "1.5^L*100",
      ingredients =
      {
        {"mechanical-data-disk", 1},
      },
      time = 60
    }
    dissoluting_prod.max_level = 10
    dissoluting_prod.upgrade = true
    dissoluting_prod.effects = {
        {
            type = "change-recipe-productivity",
            recipe = "oil-dissolution",
            change = 0.1
        },
        {
            type = "change-recipe-productivity",
            recipe = "crude-oil-dissolution",
            change = 0.1
        },
        {
            type = "change-recipe-productivity",
            recipe = "heavy-oil-dissolution",
            change = 0.1
        },
        {
            type = "change-recipe-productivity",
            recipe = "light-oil-dissolution",
            change = 0.1
        },
    }
    dissoluting_prod.hidden = false
    dissoluting_prod.enabled = true
    dissoluting_prod.prerequisites = {"t-three-science-pack", "dissoluting", "mechanical-data-disk", "productivity-module-3"}
end

data:extend({dissoluting_prod})

-- Blending productivity max10
local blending_prod = table.deepcopy(data.raw["technology"]["gun-turret"])
if blending_prod then
    blending_prod.name = "blending-productivity"
    blending_prod.icon = data.raw["technology"]["productivity-module-3"].icon
    blending_prod.icon_size = data.raw["technology"]["productivity-module-3"].icon_size
    blending_prod.unit =
    {
      count_formula = "1.5^L*100",
      ingredients =
      {
        {"mechanical-data-disk", 1},
      },
      time = 60
    }
    blending_prod.max_level = 10
    blending_prod.upgrade = true
    blending_prod.effects = {
        {
            type = "change-recipe-productivity",
            recipe = "carbon-steel-ore",
            change = 0.1
        },
        {
            type = "change-recipe-productivity",
            recipe = "carbon-steel-plate",
            change = 0.1
        },
        {
            type = "change-recipe-productivity",
            recipe = "sulfur-blending",
            change = 0.1
        },
        {
            type = "change-recipe-productivity",
            recipe = "coal-blending",
            change = 0.1
        },
        {
            type = "change-recipe-productivity",
            recipe = "silicon-blending",
            change = 0.1
        },
        {
            type = "change-recipe-productivity",
            recipe = "plastic-blending",
            change = 0.1
        },
    }
    blending_prod.hidden = false
    blending_prod.enabled = true
    blending_prod.prerequisites = {"t-three-science-pack", "blending", "mechanical-data-disk", "productivity-module-3"}
end

data:extend({blending_prod})

-- Phisical projectile damage 7-infinite
local phys_proj_dmg_inf = table.deepcopy(data.raw["technology"]["physical-projectile-damage-6"])
if phys_proj_dmg_inf then
    phys_proj_dmg_inf.name = "physical-projectile-damage-7"
    phys_proj_dmg_inf.unit = {
        count_formula = "1^L*100",
        ingredients = {
            {"military-data-disk", 1},
        },
        time = 10,
    }
    phys_proj_dmg_inf.max_level = "infinite"
    phys_proj_dmg_inf.upgrade = true
    phys_proj_dmg_inf.hidden = false
    phys_proj_dmg_inf.enabled = true
    phys_proj_dmg_inf.prerequisites = {"t-three-science-pack", "military-data-disk", "physical-projectile-damage-6"}
end

data:extend({phys_proj_dmg_inf})

-- Laser weapons damage 7-infinite
local laser_dmg_inf = table.deepcopy(data.raw["technology"]["laser-weapons-damage-6"])
if laser_dmg_inf then
    laser_dmg_inf.name = "laser-weapons-damage-7"
    laser_dmg_inf.unit = {
        count_formula = "1^L*100",
        ingredients = {
            {"military-data-disk", 1},
        },
        time = 10,
    }
    laser_dmg_inf.max_level = "infinite"
    laser_dmg_inf.upgrade = true
    laser_dmg_inf.hidden = false
    laser_dmg_inf.enabled = true
    laser_dmg_inf.prerequisites = {"t-three-science-pack", "military-data-disk", "laser-weapons-damage-6"}
end

data:extend({laser_dmg_inf})

--Gravity assembler
local gravity_assembler = table.deepcopy(data.raw["technology"]["gun-turret"])
if gravity_assembler then
    gravity_assembler.name = "gravity-assembler"
    gravity_assembler.icon = "__escape-to-space__/graphics/technology/gravity-assembler-icon-big.png"
    gravity_assembler.icon_size = 640
    gravity_assembler.unit = {
        count = 500,
        ingredients = {
            {"mechanical-data-disk", 1},
        },
        time = 10,
    }
    gravity_assembler.effects = {
        {
            type = "unlock-recipe",
            recipe = "gravity-assembler"
        },
    }
    gravity_assembler.hidden = false
    gravity_assembler.enabled = true
    gravity_assembler.prerequisites = {"mechanical-data-disk"}
    data:extend({gravity_assembler})
end