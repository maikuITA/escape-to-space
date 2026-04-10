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
-- LEFT TO RIGHT, TOP TO BOTTOM

-- ROW 0

local steam_power = data.raw.technology["steam-power"]
if steam_power then
    steam_power.hidden = false
    steam_power.enabled = true
end

local electronics = data.raw.technology["electronics"]
if electronics then
    electronics.hidden = false
    electronics.enabled = true
end

-- ROW 0.5

local auto_sp = data.raw.technology["automation-science-pack"]
if auto_sp then
    auto_sp.icon = "__escape-to-space__/graphics/technology/earth-science-pack.png"
    auto_sp.icon_size = 256
    auto_sp.effects = {
        {
            type = "unlock-recipe",
            recipe = "carbon-wheel"
        },
        {
            type = "unlock-recipe",
            recipe = "carbon-stick"
        },
        {
            type = "unlock-recipe",
            recipe = "carbon-wire"
        },
        {
            type = "unlock-recipe",
            recipe = "basic-electric-furnace"
        },
        {
            type = "unlock-recipe",
            recipe = "platform-trash-depot"
        },
        {
            type = "unlock-recipe",
            recipe = "earth-science-pack"
        },
    }
    auto_sp.hidden = false
    auto_sp.enabled = true
end
    
-- ROW 1

-- Fast inserter
local fast_inserter = data.raw["technology"]["fast-inserter"]
if fast_inserter then
    fast_inserter.unit = {
        count = 50,
        ingredients = {
            {"earth-science-pack", 1}
        },
        time = 10,
    }
    fast_inserter.hidden = false
    fast_inserter.enabled = true
    fast_inserter.prerequisites = {"automation-science-pack"}
end

-- Logistics
local logistics = data.raw["technology"]["logistics"]
if logistics then
    logistics.unit = {
        count = 50,
        ingredients = {
            {"earth-science-pack", 1}
        },
        time = 10,
    }
    logistics.hidden = false
    logistics.enabled = true
    logistics.prerequisites = {"automation-science-pack"}
end

-- Gun turret
local gun_turret = data.raw["technology"]["gun-turret"]
if gun_turret then
    gun_turret.unit = {
        count = 50,
        ingredients = {
            {"earth-science-pack", 1}
        },
        time = 10,
    }
    gun_turret.hidden = false
    gun_turret.enabled = true
    gun_turret.prerequisites = {"automation-science-pack"}
end

-- Lamp
local lamp = data.raw["technology"]["lamp"]
if lamp then
    lamp.unit = {
        count = 50,
        ingredients = {
            {"earth-science-pack", 1}
        },
        time = 10,
    }
    lamp.hidden = false
    lamp.enabled = true
    lamp.prerequisites = {"automation-science-pack"}
end

-- Repair pack
local repair_pack = data.raw["technology"]["repair-pack"]
if repair_pack then
    repair_pack.unit = {
        count = 50,
        ingredients = {
            {"earth-science-pack", 1}
        },
        time = 10,
    }
    repair_pack.hidden = false
    repair_pack.enabled = true
    repair_pack.prerequisites = {"automation-science-pack"}
end

-- Axkeria science pack
local axkeria_sp = data.raw["technology"]["logistic-science-pack"]
if axkeria_sp then
    axkeria_sp.icon = "__escape-to-space__/graphics/technology/axkeria-science-pack.png"
    axkeria_sp.icon_size = 256
    axkeria_sp.unit = {
        count = 250,
        ingredients = {
            {"earth-science-pack", 1}
        },
        time = 10,
    }
    axkeria_sp.effects = {
        {
            type = "unlock-recipe",
            recipe = "axkeria-science-pack"
        },
        {
            type = "unlock-recipe",
            recipe = "carbon-plate"
        },
        {
            type = "unlock-recipe",
            recipe = "carbon-electronic-circuit"
        },
    }
    axkeria_sp.hidden = false
    axkeria_sp.enabled = true
    axkeria_sp.prerequisites = {"automation-science-pack", "landfill", "steel-processing"}
end

-- Steel processing
local steel_processing = data.raw["technology"]["steel-processing"]
if steel_processing then
    steel_processing.unit = {
        count = 50,
        ingredients = {
            {"earth-science-pack", 1}
        },
        time = 10,
    }
    steel_processing.hidden = false
    steel_processing.enabled = true
    steel_processing.prerequisites = {"automation-science-pack"}
end

-- Stone wall
local stone_wall = data.raw["technology"]["stone-wall"]
if stone_wall then
    stone_wall.unit = {
        count = 50,
        ingredients = {
            {"earth-science-pack", 1}
        },
        time = 10,
    }
    stone_wall.hidden = false
    stone_wall.enabled = true
    stone_wall.prerequisites = {"automation-science-pack"}
end

-- Landfill
local landfill = data.raw["technology"]["landfill"]
if landfill then
    landfill.icon = "__escape-to-space__/graphics/technology/space-platform-thruster.png"
    landfill.icon_size = 256
    landfill.unit = {
        count = 50,
        ingredients = {
            {"earth-science-pack", 1}
        },
        time = 10,
    }
    landfill.effects = {
        {
            type = "unlock-recipe",
            recipe = "chemical-plant"
        },
        {
            type = "unlock-recipe",
            recipe = "space-platform-foundation"
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
            recipe = "cargo-bay"
        },
        {
            type = "unlock-recipe",
            recipe = "thruster"
        },
    }
    landfill.hidden = false
    landfill.enabled = true
    landfill.prerequisites = {"automation-science-pack"}
end

-- Red ammo
local red_ammo = data.raw["technology"]["military"]
if red_ammo then
    red_ammo.unit = {
        count = 100,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1}
        },
        time = 10,
    }
    red_ammo.effects = {
        {
            type = "unlock-recipe",
            recipe = "piercing-rounds-magazine"
        },
    }
    red_ammo.hidden = false
    red_ammo.enabled = true
    red_ammo.prerequisites = {"automation-science-pack", "logistic-science-pack", "gun-turret", "stone-wall", "steel-processing"}
end

-- Phisical projectile damage 1
local phys_proj_dmg_1 = data.raw["technology"]["physical-projectile-damage-1"]
if phys_proj_dmg_1 then
    phys_proj_dmg_1.unit = {
        count = 100,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1}
        },
        time = 10,
    }
    phys_proj_dmg_1.hidden = false
    phys_proj_dmg_1.enabled = true
    phys_proj_dmg_1.prerequisites = {"automation-science-pack", "logistic-science-pack", "military"}
end

-- Phisical projectile damage 2
local phys_proj_dmg_2 = data.raw["technology"]["physical-projectile-damage-2"]
if phys_proj_dmg_2 then
    phys_proj_dmg_2.unit = {
        count = 125,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1}
        },
        time = 10,
    }
    phys_proj_dmg_2.hidden = false
    phys_proj_dmg_2.enabled = true
    phys_proj_dmg_2.prerequisites = {"automation-science-pack", "logistic-science-pack", "physical-projectile-damage-1", "military"}
end

-- Weapon shooting speed 1
local shoot_speed_1 = data.raw["technology"]["weapon-shooting-speed-1"]
if shoot_speed_1 then
    shoot_speed_1.unit = {
        count = 100,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1}
        },
        time = 10,
    }
    shoot_speed_1.hidden = false
    shoot_speed_1.enabled = true
    shoot_speed_1.prerequisites = {"automation-science-pack", "logistic-science-pack", "military"}
end

-- Weapon shooting speed 2
local shoot_speed_2 = data.raw["technology"]["weapon-shooting-speed-2"]
if shoot_speed_2 then
    shoot_speed_2.unit = {
        count = 125,
        ingredients = {
            {"earth-science-pack", 1},  
            {"axkeria-science-pack", 1}
        },
        time = 10,
    }
    shoot_speed_2.hidden = false
    shoot_speed_2.enabled = true
    shoot_speed_2.prerequisites = {"automation-science-pack", "logistic-science-pack", "weapon-shooting-speed-1", "military"}
end

-- Automation 2
local asm_2 = data.raw["technology"]["automation-2"]
if asm_2 then
    asm_2.unit = {
        count = 100,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1}
        },
        time = 10,
    }
    asm_2.hidden = false
    asm_2.enabled = true
    asm_2.prerequisites = {"automation-science-pack", "logistic-science-pack", "steel-processing", "electric-energy-distribution-1"}
end

-- Logistics 2
local logistics_2 = data.raw["technology"]["logistics-2"]
if logistics_2 then
    logistics_2.unit = {
        count = 100,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1}
        },
        time = 10,
    }
    logistics_2.hidden = false
    logistics_2.enabled = true
    logistics_2.prerequisites = {"automation-science-pack", "logistic-science-pack", "logistics", "electric-energy-distribution-1"}
end

-- Toolbelt equipment (carbon pipe and engine unit)
local toolbelt = data.raw["technology"]["toolbelt"]
if toolbelt then
    -- Se esiste icons, ha priorita su icon
    toolbelt.icons = nil
    toolbelt.icon = "__escape-to-space__/graphics/technology/carbon-engine-unit.png"
    toolbelt.icon_size = 256
    toolbelt.icon_mipmaps = nil

    toolbelt.unit = {
        count = 100,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1}
        },
        time = 10,
    }
    toolbelt.effects = {
        { type = "unlock-recipe", recipe = "carbon-pipe" },
        { type = "unlock-recipe", recipe = "carbon-engine-unit" }
    }
    toolbelt.hidden = false
    toolbelt.enabled = true
    toolbelt.prerequisites = {"automation-science-pack", "logistic-science-pack"}
end

-- Advanced material processing 2 (electric furnaces)
local adv_mat_proc_2 = data.raw["technology"]["advanced-material-processing-2"]
if adv_mat_proc_2 then
    adv_mat_proc_2.unit = {
        count = 100,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1}
        },
        time = 10, 
    }
    adv_mat_proc_2.hidden = false
    adv_mat_proc_2.enabled = true
    adv_mat_proc_2.prerequisites = {"automation-science-pack", "logistic-science-pack", "toolbelt"}
end

local electric_energy_distribution_1 = data.raw["technology"]["electric-energy-distribution-1"]
if electric_energy_distribution_1 then
    electric_energy_distribution_1.researched = false

    electric_energy_distribution_1.icons = nil
    electric_energy_distribution_1.icon = "__escape-to-space__/graphics/technology/oxidic-processing.png"
    electric_energy_distribution_1.icon_size = 256
    electric_energy_distribution_1.icon_mipmaps = nil
    
    electric_energy_distribution_1.unit = {
        count = 100,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1}
        },
        time = 10,
    }
    electric_energy_distribution_1.effects = {
        {
            type = "unlock-recipe",
            recipe = "crush-oxide-chunk"
        },
        {
           type = "unlock-recipe",
            recipe = "oxidic-plate"
        },
        {
            type = "unlock-recipe",
            recipe = "oxidic-stick"
        },
        {
            type = "unlock-recipe",
            recipe = "oxidic-gear-wheel"
        },
    }
    electric_energy_distribution_1.hidden = false
    electric_energy_distribution_1.enabled = true
    electric_energy_distribution_1.prerequisites = {"automation-science-pack", "logistic-science-pack", "toolbelt", "fast-inserter"}
end

-- Tier 1 science pack
local t_one_sp = data.raw["technology"]["military-science-pack"]
if t_one_sp then
    t_one_sp.icon = "__escape-to-space__/graphics/technology/t-one-science-pack.png"
    t_one_sp.icon_size = 256
    t_one_sp.unit = {
        count = 100,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1}
        },
        time = 10,
    }
    t_one_sp.effects = {
        {
            type = "unlock-recipe",
            recipe = "glass-bottle"
        },
        {
            type = "unlock-recipe",
            recipe = "t-one-fluid"
        },
        {
            type = "unlock-recipe",
            recipe = "t-one-science-pack"
        },
        {
            type = "unlock-recipe",
            recipe = "cybernetics-facility"
        },
        {
            type = "unlock-recipe",
            recipe = "oxide-lab"
        },
    }  
    t_one_sp.hidden = false
    t_one_sp.enabled = true
    t_one_sp.prerequisites = {
        "automation-science-pack",
        "logistic-science-pack",
        "automation-2",
        "logistics-2",
        "advanced-material-processing-2",
        "fast-inserter",
        "electric-energy-distribution-1",
    }
end

-- Military 2 (oxidic-rounds-magazine)
local oxidic_ammo = data.raw["technology"]["military-2"]
if oxidic_ammo then
    oxidic_ammo.unit = {
        count = 150,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1},
            {"t-one-science-pack", 1}
        },
        time = 10,
    }
    oxidic_ammo.effects = {
        {
            type = "unlock-recipe",
            recipe = "oxidic-rounds-magazine"
        },
    }
    oxidic_ammo.hidden = false
    oxidic_ammo.enabled = true
    oxidic_ammo.prerequisites = {"automation-science-pack", "logistic-science-pack", "military", "military-science-pack"}
end

-- Phisical projectile damage 3
local phys_proj_dmg_3 = data.raw["technology"]["physical-projectile-damage-3"]
if phys_proj_dmg_3 then
    phys_proj_dmg_3.unit = {
        count = 175,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1},
            {"t-one-science-pack", 1}
        },
        time = 10,
    }
    phys_proj_dmg_3.hidden = false
    phys_proj_dmg_3.enabled = true
    phys_proj_dmg_3.prerequisites = {"automation-science-pack", "logistic-science-pack", "physical-projectile-damage-1", "physical-projectile-damage-2", "military", "military-2", "military-science-pack"}
end

-- Phisical projectile damage 4
local phys_proj_dmg_4 = data.raw["technology"]["physical-projectile-damage-4"]
if phys_proj_dmg_4 then
    phys_proj_dmg_4.unit = {
        count = 200,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1},
            {"t-one-science-pack", 1}
        },
        time = 10,
    }
    phys_proj_dmg_4.hidden = false
    phys_proj_dmg_4.enabled = true
    phys_proj_dmg_4.prerequisites = {"automation-science-pack", "logistic-science-pack", "physical-projectile-damage-1", "physical-projectile-damage-2", "physical-projectile-damage-3", "military", "military-2", "military-science-pack"}
end

-- Weapon shooting speed 3
local shoot_speed_3 = data.raw["technology"]["weapon-shooting-speed-3"]
if shoot_speed_3 then
    shoot_speed_3.unit = {
        count = 175,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1},
            {"t-one-science-pack", 1}
        },
        time = 10,
    }
    shoot_speed_3.hidden = false
    shoot_speed_3.enabled = true
    shoot_speed_3.prerequisites = {"automation-science-pack", "logistic-science-pack", "weapon-shooting-speed-1", "weapon-shooting-speed-2", "military", "military-2", "military-science-pack"}
end

-- Weapon shooting speed 4
local shoot_speed_4 = data.raw["technology"]["weapon-shooting-speed-4"]
if shoot_speed_4 then
    shoot_speed_4.unit = {
        count = 200,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1},
            {"t-one-science-pack", 1}
        },
        time = 10,
    }
    shoot_speed_4.hidden = false
    shoot_speed_4.enabled = true
    shoot_speed_4.prerequisites = {"automation-science-pack", "logistic-science-pack", "weapon-shooting-speed-1", "weapon-shooting-speed-2", "weapon-shooting-speed-3", "military", "military-2", "military-science-pack"}
end