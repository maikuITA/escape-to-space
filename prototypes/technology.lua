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
    electronics.researched = true
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
        count = 100,
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
    axkeria_sp.prerequisites = {"automation-science-pack"}
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
    t_one_sp.prerequisites = {"automation-science-pack", "logistic-science-pack"}
end