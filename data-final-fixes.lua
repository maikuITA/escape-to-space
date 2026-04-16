-- data.final-fixes.lua

-- Modifiche alle technologies del base game

local steam_power = data.raw.technology["steam-power"]
if steam_power then
    steam_power.effects = {
        {
            type = "unlock-recipe",
            recipe = "pipe"
        },
        {
            type = "unlock-recipe",
            recipe = "pipe-to-ground"
        },
        {
            type = "unlock-recipe",
            recipe = "engine-unit"
        },
    }
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
            recipe = "assembling-machine-1"
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

-- Circuit network
local circuit_network = data.raw["technology"]["circuit-network"]
if circuit_network then
    circuit_network.unit = {
        count = 50,
        ingredients = {
            {"earth-science-pack", 1}
        },
        time = 10,
    }
    circuit_network.hidden = false
    circuit_network.enabled = true
    circuit_network.prerequisites = {"automation-science-pack"}
end

-- Advanced combinatiors
local adv_combinators = data.raw["technology"]["advanced-combinators"]
if adv_combinators then
    adv_combinators.unit = {
        count = 50,
        ingredients = {
            {"earth-science-pack", 1}
        },
        time = 10,
    }
    adv_combinators.hidden = false
    adv_combinators.enabled = true
    adv_combinators.prerequisites = {"circuit-network"}
end

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
    gun_turret.effects = {
        {
            type = "unlock-recipe",
            recipe = "gun-turret"
        },
        {
            type = "unlock-recipe",
            recipe = "firearm-magazine"
        },
    }
    gun_turret.hidden = false
    gun_turret.enabled = true
    gun_turret.prerequisites = {"automation-science-pack"}
end

local concrete = data.raw["technology"]["concrete"]
if concrete then
    concrete.unit = {
        count = 50,
        ingredients = {
            {"earth-science-pack", 1}
        },
        time = 10,
    }
    concrete.hidden = false
    concrete.enabled = true
    concrete.prerequisites = {"automation-science-pack"}
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

-- Fluid handling
local fluid_handling = data.raw["technology"]["fluid-handling"]
if fluid_handling then
    fluid_handling.unit = {
        count = 50,
        ingredients = {
            {"earth-science-pack", 1}
        },
        time = 10,
    }
    fluid_handling.hidden = false
    fluid_handling.enabled = true
    fluid_handling.prerequisites = {"automation-science-pack", "steel-processing"}
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
            recipe = "ice-melting"
        },
        {
            type = "unlock-recipe",
            recipe = "oxide-asteroid-crushing"
        },
        {
            type = "unlock-recipe",
            recipe = "carbonic-asteroid-crushing"
        },
        {
            type = "unlock-recipe",
            recipe = "solar-panel"
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
        {
            type = "unlock-recipe",
            recipe = "thruster-fuel"
        },
        {
            type = "unlock-recipe",
            recipe = "thruster-oxidizer"
        },
        {
            type = "unlock-space-location",
            space_location = "axos",
            use_icon_overlay_constant = true
        },
        {
            type = "unlock-space-location",
            space_location = "keria",
            use_icon_overlay_constant = true
        },
    }
    landfill.hidden = false
    landfill.enabled = true
    landfill.prerequisites = {"automation-science-pack"}
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
    asm_2.prerequisites = {"automation-science-pack", "logistic-science-pack", "steel-processing", "heavy-armor"}
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
    logistics_2.prerequisites = {"automation-science-pack", "logistic-science-pack", "logistics"}
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

local heavy_armor = data.raw["technology"]["heavy-armor"]
if heavy_armor then
    heavy_armor.researched = false

    heavy_armor.icons = nil
    heavy_armor.icon = "__escape-to-space__/graphics/technology/oxidic-processing.png"
    heavy_armor.icon_size = 256
    heavy_armor.icon_mipmaps = nil
    
    heavy_armor.unit = {
        count = 100,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1}
        },
        time = 10,
    }
    heavy_armor.effects = {
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
        {
            type = "unlock-recipe",
            recipe = "oxidic-cable"
        },
    }
    heavy_armor.hidden = false
    heavy_armor.enabled = true
    heavy_armor.prerequisites = {"automation-science-pack", "logistic-science-pack", "toolbelt", "fast-inserter"}
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
        "heavy-armor",
    }
end

-- Military 2 (oxidic-rounds-magazine)
local military_2 = data.raw["technology"]["military-2"]
if military_2 then
    military_2.unit = {
        count = 150,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1},
            {"t-one-science-pack", 1}
        },
        time = 10,
    }
    military_2.effects = {
        {
            type = "unlock-recipe",
            recipe = "oxidic-rounds-magazine"
        },
    }
    military_2.hidden = false
    military_2.enabled = true
    military_2.prerequisites = {"automation-science-pack", "logistic-science-pack", "military", "military-science-pack"}
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

-- Laser
local laser = data.raw["technology"]["laser"]
if laser then
    laser.unit = {
        count = 100,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1},
            {"t-one-science-pack", 1}
        },
        time = 10,
    }
    laser.effects = {
        {
            type = "unlock-recipe",
            recipe = "laser-turret"
        },
    }
    laser.hidden = false
    laser.enabled = true
    laser.prerequisites = {"automation-science-pack", "logistic-science-pack", "military-science-pack", "blending"}
end

-- Laser shooting speed 1
local laser_shoot_speed_1 = data.raw["technology"]["laser-shooting-speed-1"]
if laser_shoot_speed_1 then
    laser_shoot_speed_1.unit = {
        count = 150,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1},
            {"t-one-science-pack", 1}
        },
        time = 10,
    }
    laser_shoot_speed_1.hidden = false
    laser_shoot_speed_1.enabled = true
    laser_shoot_speed_1.prerequisites = {"automation-science-pack", "logistic-science-pack", "military", "laser", "military-science-pack"}
end

-- Laser shooting speed 2
local laser_shoot_speed_2 = data.raw["technology"]["laser-shooting-speed-2"]
if laser_shoot_speed_2 then
    laser_shoot_speed_2.unit = {
        count = 150,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1},
            {"t-one-science-pack", 1}
        },
        time = 10,
    }
    laser_shoot_speed_2.hidden = false
    laser_shoot_speed_2.enabled = true
    laser_shoot_speed_2.prerequisites = {"automation-science-pack", "logistic-science-pack", "military", "laser", "military-science-pack", "laser-shooting-speed-1"}
end

-- Laser shooting speed 3
local laser_shoot_speed_3 = data.raw["technology"]["laser-shooting-speed-3"]
if laser_shoot_speed_3 then
    laser_shoot_speed_3.unit = {
        count = 150,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1},
            {"t-one-science-pack", 1}
        },
        time = 10,
    }
    laser_shoot_speed_3.hidden = false
    laser_shoot_speed_3.enabled = true
    laser_shoot_speed_3.prerequisites = {"automation-science-pack", "logistic-science-pack", "military", "laser", "military-science-pack", "laser-shooting-speed-2"}
end

-- Laser weapon damage 1
local laser_dmg_1 = data.raw["technology"]["laser-weapons-damage-1"]
if laser_dmg_1 then
    laser_dmg_1.unit = {
        count = 150,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1},
            {"t-one-science-pack", 1}
        },
        time = 10,
    }
    laser_dmg_1.hidden = false
    laser_dmg_1.enabled = true
    laser_dmg_1.prerequisites = {"automation-science-pack", "logistic-science-pack", "military", "laser", "military-science-pack"}
end

-- Laser weapon damage 2
local laser_dmg_2 = data.raw["technology"]["laser-weapons-damage-2"]
if laser_dmg_2 then
    laser_dmg_2.unit = {
        count = 150,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1},
            {"t-one-science-pack", 1}
        },
        time = 10,
    }
    laser_dmg_2.hidden = false
    laser_dmg_2.enabled = true
    laser_dmg_2.prerequisites = {"automation-science-pack", "logistic-science-pack", "military", "laser", "military-science-pack", "laser-weapons-damage-1"}
end

-- Laser weapon damage 3
local laser_dmg_3 = data.raw["technology"]["laser-weapons-damage-3"]
if laser_dmg_3 then
    laser_dmg_3.unit = {
        count = 150,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1},
            {"t-one-science-pack", 1}
        },
        time = 10,
    }
    laser_dmg_3.hidden = false
    laser_dmg_3.enabled = true
    laser_dmg_3.prerequisites = {"automation-science-pack", "logistic-science-pack", "military", "laser", "military-science-pack", "laser-weapons-damage-1", "laser-weapons-damage-2"}
end

-- Automation 3
local asm_3 = data.raw["technology"]["automation-3"]
if asm_3 then
    asm_3.unit = {
        count = 150,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1},
            {"t-one-science-pack", 1}
        },
        time = 10,
    }
    asm_3.hidden = false
    asm_3.enabled = true
    asm_3.prerequisites = {"automation-science-pack", "logistic-science-pack", "military-science-pack", "automation-2"}
end

-- Logistics 3
local logistics_3 = data.raw["technology"]["logistics-3"]
if logistics_3 then
    logistics_3.unit = {
        count = 150,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1},
            {"t-one-science-pack", 1}
        },
        time = 10,
    }
    logistics_3.hidden = false
    logistics_3.enabled = true
    logistics_3.prerequisites = {"automation-science-pack", "logistic-science-pack", "military-science-pack", "logistics-2", "lubricant", "heavy-armor"}
end

-- Advanced circuit
local advanced_circuit = data.raw["technology"]["advanced-circuit"]
if advanced_circuit then
    advanced_circuit.unit = {
        count = 150,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1},
            {"t-one-science-pack", 1}
        },
        time = 10,
    }
    advanced_circuit.effects = {
        {
            type = "unlock-recipe",
            recipe = "electromagnetic-plant"
        },
        {
            type = "unlock-recipe",
            recipe = "advanced-circuit"
        },
        {
            type = "unlock-recipe",
            recipe = "oxidic-electronic-circuit"
        },
    }
    advanced_circuit.hidden = false
    advanced_circuit.enabled = true
    advanced_circuit.prerequisites = {"automation-science-pack", "logistic-science-pack", "military-science-pack", "advanced-material-processing-2", "blending", "automation-3", "concrete"}
end

-- Bulk inserter
local bulk_inserter = data.raw["technology"]["bulk-inserter"]
if bulk_inserter then
    bulk_inserter.unit = {
        count = 150,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1},
            {"t-one-science-pack", 1}
        },
        time = 10,
    }
    bulk_inserter.hidden = false
    bulk_inserter.enabled = true
    bulk_inserter.prerequisites = {"advanced-circuit"}
else
    error("ERRORE CRITICO: Il bulk-inserter non esiste ancora in questa fase!")
end

-- Inserter capacity bonus 1
local inserter_cap_bonus_1 = data.raw["technology"]["inserter-capacity-bonus-1"]
if inserter_cap_bonus_1 then
    inserter_cap_bonus_1.unit = {
        count = 150,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1},
            {"t-one-science-pack", 1}
        },
        time = 10,
    }
    inserter_cap_bonus_1.hidden = false
    inserter_cap_bonus_1.enabled = true
    inserter_cap_bonus_1.prerequisites = {"bulk-inserter"}
end

-- Inserter capacity bonus 2
local inserter_cap_bonus_2 = data.raw["technology"]["inserter-capacity-bonus-2"]
if inserter_cap_bonus_2 then
    inserter_cap_bonus_2.unit = {
        count = 175,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1},
            {"t-one-science-pack", 1}
        },
        time = 10,
    }
    inserter_cap_bonus_2.hidden = false
    inserter_cap_bonus_2.enabled = true
    inserter_cap_bonus_2.prerequisites = {"bulk-inserter", "inserter-capacity-bonus-1"}
end

-- Inserter capacity bonus 3
local inserter_cap_bonus_3 = data.raw["technology"]["inserter-capacity-bonus-3"]
if inserter_cap_bonus_3 then
    inserter_cap_bonus_3.unit = {
        count = 200,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1},
            {"t-one-science-pack", 1}
        },
        time = 10,
    }
    inserter_cap_bonus_3.hidden = false
    inserter_cap_bonus_3.enabled = true
    inserter_cap_bonus_3.prerequisites = {"bulk-inserter", "inserter-capacity-bonus-2"}
end

-- Inserter capacity bonus 4
local inserter_cap_bonus_4 = data.raw["technology"]["inserter-capacity-bonus-4"]
if inserter_cap_bonus_4 then
    inserter_cap_bonus_4.unit = {
        count = 225,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1},
            {"t-one-science-pack", 1}
        },
        time = 10,
    }
    inserter_cap_bonus_4.hidden = false
    inserter_cap_bonus_4.enabled = true
    inserter_cap_bonus_4.prerequisites = {"bulk-inserter", "inserter-capacity-bonus-3"}
end

-- Inserter capacity bonus 5
local inserter_cap_bonus_5 = data.raw["technology"]["inserter-capacity-bonus-5"]
if inserter_cap_bonus_5 then
    inserter_cap_bonus_5.unit = {
        count = 250,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1},
            {"t-one-science-pack", 1}
        },
        time = 10,
    }
    inserter_cap_bonus_5.hidden = false
    inserter_cap_bonus_5.enabled = true
    inserter_cap_bonus_5.prerequisites = {"bulk-inserter", "inserter-capacity-bonus-4"}
end

-- Inserter capacity bonus 6
local inserter_cap_bonus_6 = data.raw["technology"]["inserter-capacity-bonus-6"]
if inserter_cap_bonus_6 then
    inserter_cap_bonus_6.unit = {
        count = 275,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1},
            {"t-one-science-pack", 1}
        },
        time = 10,
    }
    inserter_cap_bonus_6.hidden = false
    inserter_cap_bonus_6.enabled = true
    inserter_cap_bonus_6.prerequisites = {"bulk-inserter", "inserter-capacity-bonus-5"}
end

-- Inserter capacity bonus 7
local inserter_cap_bonus_7 = data.raw["technology"]["inserter-capacity-bonus-7"]
if inserter_cap_bonus_7 then
    inserter_cap_bonus_7.unit = {
        count = 300,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1},
            {"t-one-science-pack", 1}
        },
        time = 10,
    }
    inserter_cap_bonus_7.hidden = false
    inserter_cap_bonus_7.enabled = true
    inserter_cap_bonus_7.prerequisites = {"bulk-inserter", "inserter-capacity-bonus-6"}
end

-- Modules
local modules = data.raw["technology"]["modules"]
if modules then
    modules.unit = {
        count = 150,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1},
            {"t-one-science-pack", 1}
        },
        time = 10,
    }
    modules.hidden = false
    modules.enabled = true
    modules.prerequisites = {"automation-science-pack", "logistic-science-pack", "military-science-pack", "advanced-circuit", "lamp"}
end

local efficiency_module = data.raw["technology"]["efficiency-module"]
if efficiency_module then
    efficiency_module.unit = {
        count = 150,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1},
            {"t-one-science-pack", 1}
        },
        time = 10,
    }
    efficiency_module.hidden = false
    efficiency_module.enabled = true
    efficiency_module.prerequisites = {"automation-science-pack", "logistic-science-pack", "military-science-pack", "modules"}
end

local speed_module = data.raw["technology"]["speed-module"]
if speed_module then
    speed_module.unit = {
        count = 150,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1},
            {"t-one-science-pack", 1}
        },
        time = 10,
    }
    speed_module.hidden = false
    speed_module.enabled = true
    speed_module.prerequisites = {"automation-science-pack", "logistic-science-pack", "military-science-pack", "modules"}
end

local productivity_module = data.raw["technology"]["productivity-module"]
if productivity_module then
    productivity_module.unit = {
        count = 150,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1},
            {"t-one-science-pack", 1}
        },
        time = 10,
    }
    productivity_module.hidden = false
    productivity_module.enabled = true
    productivity_module.prerequisites = {"automation-science-pack", "logistic-science-pack", "military-science-pack", "modules"}
end

local quality_module = data.raw["technology"]["quality-module"]
if quality_module then
    quality_module.unit = {
        count = 150,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1},
            {"t-one-science-pack", 1}
        },
        time = 10,
    }
    quality_module.hidden = false
    quality_module.enabled = true
    quality_module.prerequisites = {"automation-science-pack", "logistic-science-pack", "military-science-pack", "modules"}
end

local beacon = data.raw["technology"]["effect-transmission"]
if beacon then
    beacon.unit = {
        count = 150,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1},
            {"t-one-science-pack", 1}
        },
        time = 10,
    }
    beacon.hidden = false
    beacon.enabled = true
    beacon.prerequisites = {"automation-science-pack", "logistic-science-pack", "military-science-pack", "modules"}
end

-- Planet Vulcanus
local vulcanus = data.raw["technology"]["planet-discovery-vulcanus"]
if vulcanus then
    vulcanus.unit = {
        count = 500,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1},
            {"t-one-science-pack", 1},
            {"t-two-science-pack", 1}
        },
        time = 10,
    }
    vulcanus.effects = {
        {
            type = "unlock-space-location",
            space_location = "vulcanus",
            use_icon_overlay_constant = true
        },
        {
            type = "unlock-recipe",
            recipe = "foundry"
        },
        {
            type = "unlock-recipe",
            recipe = "crush-tungsten-chunk"
        },
        {
            type = "unlock-recipe",
            recipe = "tungsten-plate"
        },
        {
            type = "unlock-recipe",
            recipe = "tungsten-carbide-blending"
        },
        {
            type = "unlock-recipe",
            recipe = "carbon-steel-plate-metallurgy"
        },
    }
    vulcanus.hidden = false
    vulcanus.enabled = true
    vulcanus.prerequisites = {
        "automation-science-pack",
        "logistic-science-pack",
        "military-science-pack",
        "t-two-science-pack",
    }
end

-- Turbo transport belt
local turbo_belt = data.raw["technology"]["turbo-transport-belt"]
if turbo_belt then
    turbo_belt.unit = {
        count = 150,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1},
            {"t-one-science-pack", 1},
            {"t-two-science-pack", 1}
        },
        time = 10,
    }
    turbo_belt.hidden = false
    turbo_belt.enabled = true
    turbo_belt.prerequisites = {
        "planet-discovery-vulcanus",
        "logistics-3"
    }
end

-- Planet Fulgora
local fulgora = data.raw["technology"]["planet-discovery-fulgora"]
if fulgora then
    fulgora.unit = {
        count = 500,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1},
            {"t-one-science-pack", 1},
            {"t-two-science-pack", 1}
        },
        time = 10,
    }
    fulgora.effects = {
        {
            type = "unlock-space-location",
            space_location = "fulgora",
            use_icon_overlay_constant = true
        },
        {
            type = "unlock-recipe",
            recipe = "scrap-asteroid-crushing"
        },
    }
    fulgora.hidden = false
    fulgora.enabled = true
    fulgora.prerequisites = {
        "automation-science-pack",
        "logistic-science-pack",
        "military-science-pack",
        "t-two-science-pack",
    }
end

-- Planet Gleba
local gleba = data.raw["technology"]["planet-discovery-gleba"]
if gleba then
    gleba.unit = {
        count = 500,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1},
            {"t-one-science-pack", 1},
            {"t-two-science-pack", 1}
        },
        time = 10,
    }
    gleba.effects = {
        {
            type = "unlock-space-location",
            space_location = "gleba",
            use_icon_overlay_constant = true
        },
        {
            type = "unlock-recipe",
            recipe = "alien-asteroid-crushing"
        },
    }
    gleba.hidden = false
    gleba.enabled = true
    gleba.prerequisites = {
        "automation-science-pack",
        "logistic-science-pack",
        "military-science-pack",
        "t-two-science-pack",
    }
end

-- Planet Aquilo
local aquilo = data.raw["technology"]["planet-discovery-aquilo"]
if aquilo then
    aquilo.unit = {
        count = 500,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1},
            {"t-one-science-pack", 1},
            {"t-two-science-pack", 1}
        },
        time = 10,
    }
    aquilo.effects = {
        {
            type = "unlock-space-location",
            space_location = "aquilo",
            use_icon_overlay_constant = true
        },
        {
            type = "unlock-recipe",
            recipe = "fluorite-asteroid-crushing"
        },
    }
    aquilo.hidden = false
    aquilo.enabled = true
    aquilo.prerequisites = {
        "automation-science-pack",
        "logistic-science-pack",
        "military-science-pack",
        "t-two-science-pack",
    }
end

-- Military 3
local military_3 = data.raw["technology"]["military-3"]
if military_3 then
    military_3.unit = {
        count = 250,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1},
            {"t-one-science-pack", 1},
            {"t-two-science-pack", 1},

        },
        time = 10,
    }
    military_3.hidden = false
    military_3.enabled = true
    military_3.prerequisites = {
        "automation-science-pack",
        "logistic-science-pack",
        "military-science-pack",
        "t-two-science-pack",
        "military-2",
    }
end

-- Phisical projectile damage 5
local phys_proj_dmg_5 = data.raw["technology"]["physical-projectile-damage-5"]
if phys_proj_dmg_5 then
    phys_proj_dmg_5.unit = {
        count = 200,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1},
            {"t-one-science-pack", 1},
            {"t-two-science-pack", 1}
        },
        time = 10,
    }
    phys_proj_dmg_5.hidden = false
    phys_proj_dmg_5.enabled = true
    phys_proj_dmg_5.prerequisites = {"automation-science-pack", "logistic-science-pack", "physical-projectile-damage-1", "physical-projectile-damage-2", "physical-projectile-damage-3", "physical-projectile-damage-4", "military-science-pack", "military", "military-2", "military-3"}
end

-- Phisical projectile damage 6
local phys_proj_dmg_6 = data.raw["technology"]["physical-projectile-damage-6"]
if phys_proj_dmg_6 then
    phys_proj_dmg_6.unit = {
        count = 200,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1},
            {"t-one-science-pack", 1},
            {"t-two-science-pack", 1}
        },
        time = 10,
    }
    phys_proj_dmg_6.hidden = false
    phys_proj_dmg_6.enabled = true
    phys_proj_dmg_6.prerequisites = {"automation-science-pack", "logistic-science-pack", "physical-projectile-damage-1", "physical-projectile-damage-2", "physical-projectile-damage-3", "physical-projectile-damage-4", "physical-projectile-damage-5", "military-science-pack", "military", "military-2", "military-3"}
end

-- Weapon shooting speed 5
local shoot_speed_5 = data.raw["technology"]["weapon-shooting-speed-5"]
if shoot_speed_5 then
    shoot_speed_5.unit = {
        count = 200,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1},
            {"t-one-science-pack", 1},
            {"t-two-science-pack", 1}
        },
        time = 10,
    }
    shoot_speed_5.hidden = false
    shoot_speed_5.enabled = true
    shoot_speed_5.prerequisites = {"automation-science-pack", "logistic-science-pack", "weapon-shooting-speed-1", "weapon-shooting-speed-2", "weapon-shooting-speed-3", "weapon-shooting-speed-4", "military", "military-2", "military-3", "military-science-pack"}
end

-- Weapon shooting speed 6
local shoot_speed_6 = data.raw["technology"]["weapon-shooting-speed-6"]
if shoot_speed_6 then
    shoot_speed_6.unit = {
        count = 200,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1},
            {"t-one-science-pack", 1},
            {"t-two-science-pack", 1}
        },
        time = 10,
    }
    shoot_speed_6.hidden = false
    shoot_speed_6.enabled = true
    shoot_speed_6.prerequisites = {"automation-science-pack", "logistic-science-pack", "weapon-shooting-speed-1", "weapon-shooting-speed-2", "weapon-shooting-speed-3", "weapon-shooting-speed-4", "weapon-shooting-speed-5", "military", "military-2", "military-3", "military-science-pack"}
end

-- Laser shooting speed 4
local laser_shoot_speed_4 = data.raw["technology"]["laser-shooting-speed-4"]
if laser_shoot_speed_4 then
    laser_shoot_speed_4.unit = {
        count = 150,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1},
            {"t-one-science-pack", 1},
            {"t-two-science-pack", 1}
        },
        time = 10,
    }
    laser_shoot_speed_4.hidden = false
    laser_shoot_speed_4.enabled = true
    laser_shoot_speed_4.prerequisites = {"automation-science-pack", "logistic-science-pack", "military", "laser", "military-science-pack", "military-3", "laser-shooting-speed-3"}
end

-- Laser weapons damage 4
local laser_dmg_4 = data.raw["technology"]["laser-weapons-damage-4"]
if laser_dmg_4 then
    laser_dmg_4.unit = {
        count = 150,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1},
            {"t-one-science-pack", 1},
            {"t-two-science-pack", 1}
        },
        time = 10,
    }
    laser_dmg_4.hidden = false
    laser_dmg_4.enabled = true
    laser_dmg_4.prerequisites = {"automation-science-pack", "logistic-science-pack", "military", "laser", "military-science-pack", "military-3", "laser-weapons-damage-3"}
end

-- Laser weapons damage 5
local laser_dmg_5 = data.raw["technology"]["laser-weapons-damage-5"]
if laser_dmg_5 then
    laser_dmg_5.unit = {
        count = 150,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1},
            {"t-one-science-pack", 1},
            {"t-two-science-pack", 1}
        },
        time = 10,
    }
    laser_dmg_5.hidden = false
    laser_dmg_5.enabled = true
    laser_dmg_5.prerequisites = {"automation-science-pack", "logistic-science-pack", "military", "laser", "military-science-pack", "military-3", "laser-weapons-damage-3", "laser-weapons-damage-4"}
end

--Laser weapons damage 6
local laser_dmg_6 = data.raw["technology"]["laser-weapons-damage-6"]
if laser_dmg_6 then
    laser_dmg_6.unit = {
        count = 150,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1},
            {"t-one-science-pack", 1},
            {"t-two-science-pack", 1}
        },
        time = 10,
    }
    laser_dmg_6.hidden = false
    laser_dmg_6.enabled = true
    laser_dmg_6.prerequisites = {"automation-science-pack", "logistic-science-pack", "military", "laser", "military-science-pack", "military-3", "laser-weapons-damage-3", "laser-weapons-damage-4", "laser-weapons-damage-5"}
end

-- Laser shooting speed 5
local laser_shoot_speed_5 = data.raw["technology"]["laser-shooting-speed-5"]
if laser_shoot_speed_5 then
    laser_shoot_speed_5.unit = {
        count = 150,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1},
            {"t-one-science-pack", 1},
            {"t-two-science-pack", 1}
        },
        time = 10,
    }
    laser_shoot_speed_5.hidden = false
    laser_shoot_speed_5.enabled = true
    laser_shoot_speed_5.prerequisites = {"automation-science-pack", "logistic-science-pack", "military", "laser", "military-science-pack", "military-3", "laser-shooting-speed-4"}
end

-- Laser shooting speed 6
local laser_shoot_speed_6 = data.raw["technology"]["laser-shooting-speed-6"]
if laser_shoot_speed_6 then
    laser_shoot_speed_6.unit = {
        count = 150,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1},
            {"t-one-science-pack", 1},
            {"t-two-science-pack", 1}
        },
        time = 10,
    }
    laser_shoot_speed_6.hidden = false
    laser_shoot_speed_6.enabled = true
    laser_shoot_speed_6.prerequisites = {"automation-science-pack", "logistic-science-pack", "military", "laser", "military-science-pack", "military-3", "laser-shooting-speed-5"}
end

-- Efficiency module 2
local efficiency_module_2 = data.raw["technology"]["efficiency-module-2"]
if efficiency_module_2 then
    efficiency_module_2.unit = {
        count = 150,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1},
            {"t-one-science-pack", 1},
            {"t-two-science-pack", 1}
        },
        time = 10,
    }
    efficiency_module_2.hidden = false
    efficiency_module_2.enabled = true
    efficiency_module_2.prerequisites = {"t-two-science-pack", "efficiency-module"}
end

-- Speed module 2
local speed_module_2 = data.raw["technology"]["speed-module-2"]
if speed_module_2 then
    speed_module_2.unit = {
        count = 150,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1},
            {"t-one-science-pack", 1},
            {"t-two-science-pack", 1}
        },
        time = 10,
    }
    speed_module_2.hidden = false
    speed_module_2.enabled = true
    speed_module_2.prerequisites = {"t-two-science-pack", "speed-module"}
end

-- Productivity module 2
local productivity_module_2 = data.raw["technology"]["productivity-module-2"]
if productivity_module_2 then
    productivity_module_2.unit = {
        count = 150,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1},
            {"t-one-science-pack", 1},
            {"t-two-science-pack", 1}
        },
        time = 10,
    }
    productivity_module_2.hidden = false
    productivity_module_2.enabled = true
    productivity_module_2.prerequisites = {"t-two-science-pack", "productivity-module"}
end

-- Quality module 2
local quality_module_2 = data.raw["technology"]["quality-module-2"]
if quality_module_2 then
    quality_module_2.unit = {
        count = 150,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1},
            {"t-one-science-pack", 1},
            {"t-two-science-pack", 1}
        },
        time = 10,
    }
    quality_module_2.hidden = false
    quality_module_2.enabled = true
    quality_module_2.prerequisites = {"t-two-science-pack", "quality-module"}
end

-- Epic quality
local epic_quality = data.raw["technology"]["epic-quality"]
if epic_quality then
    epic_quality.unit = {
        count = 200,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1},
            {"t-one-science-pack", 1},
            {"t-two-science-pack", 1}
        },
        time = 10,
    }
    epic_quality.hidden = false
    epic_quality.enabled = true
    epic_quality.prerequisites = {"t-two-science-pack", "quality-module-2"}
end

-- Processing unit
local processing_unit = data.raw["technology"]["processing-unit"]
if processing_unit then
    processing_unit.unit = {
        count = 200,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1},
            {"t-one-science-pack", 1},
            {"t-two-science-pack", 1}
        },
        time = 10,
    }
    processing_unit.hidden = false
    processing_unit.enabled = true
    processing_unit.prerequisites = {"t-two-science-pack", "advanced-circuit", "planet-discovery-fulgora", "dissoluting"}
end

-- Low density structure
local low_density_structure = data.raw["technology"]["low-density-structure"]
if low_density_structure then
    low_density_structure.unit = {
        count = 200,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1},
            {"t-one-science-pack", 1},
            {"t-two-science-pack", 1}
        },
        time = 10,
    }
    low_density_structure.hidden = false
    low_density_structure.enabled = true
    low_density_structure.prerequisites = {"t-two-science-pack", "planet-discovery-fulgora"}
end

-- Rocket turret
local rocket_turret = data.raw["technology"]["rocket-turret"]
if rocket_turret then
    rocket_turret.unit = {
        count = 200,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1},
            {"t-one-science-pack", 1},
            {"t-two-science-pack", 1}
        },
        time = 10,
    }
    rocket_turret.effects = {
        {
            type = "unlock-recipe",
            recipe = "rocket-turret"
        },
    }
    rocket_turret.hidden = false
    rocket_turret.enabled = true
    rocket_turret.prerequisites = {"t-two-science-pack", "planet-discovery-gleba", "military-3"}
end

-- Rocketry
local rocketry = data.raw["technology"]["rocketry"]
if rocketry then
    rocketry.unit = {
        count = 200,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1},
            {"t-one-science-pack", 1},
            {"t-two-science-pack", 1}
        },
        time = 10,
    }
    rocketry.hidden = false
    rocketry.enabled = true
    rocketry.prerequisites = {"rocket-turret"}
end

-- Explosive rocketry
local explosive_rocketry = data.raw["technology"]["explosive-rocketry"]
if explosive_rocketry then
    explosive_rocketry.unit = {
        count = 200,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1},
            {"t-one-science-pack", 1},
            {"t-two-science-pack", 1}
        },
        time = 10,
    }
    explosive_rocketry.hidden = false
    explosive_rocketry.enabled = true
    explosive_rocketry.prerequisites = {"rocketry"}
end

-- Railgun
local railgun = data.raw["technology"]["railgun"]
if railgun then
    railgun.unit = {
        count = 200,
        ingredients = {
            {"earth-science-pack", 1},
            {"axkeria-science-pack", 1},
            {"t-one-science-pack", 1},
            {"t-two-science-pack", 1}
        },
        time = 10,
    }
    railgun.effects = {
        {
            type = "unlock-recipe",
            recipe = "railgun"
        },
    }
    railgun.hidden = false
    railgun.enabled = true
    railgun.prerequisites = {"t-two-science-pack", "planet-discovery-aquilo", "military-3"}
end

-- Legendary quality
local legendary_quality = data.raw["technology"]["legendary-quality"]
if legendary_quality then
    legendary_quality.unit = {
        count = 200,
        ingredients = {
            {"t-one-science-pack", 1},
            {"t-two-science-pack", 1},
            {"t-three-science-pack", 1}
        },
        time = 10,
    }
    legendary_quality.hidden = false
    legendary_quality.enabled = true
    legendary_quality.prerequisites = {"t-three-science-pack", "epic-quality", "quality-module-3"}
end

-- Efficiency module 3
local efficiency_module_3 = data.raw["technology"]["efficiency-module-3"]
if efficiency_module_3 then
    efficiency_module_3.unit = {
        count = 200,
        ingredients = {
            {"t-one-science-pack", 1},
            {"t-two-science-pack", 1},
            {"t-three-science-pack", 1}
        },
        time = 10,
    }
    efficiency_module_3.hidden = false
    efficiency_module_3.enabled = true
    efficiency_module_3.prerequisites = {"t-three-science-pack", "efficiency-module-2"}
end

-- Speed module 3
local speed_module_3 = data.raw["technology"]["speed-module-3"]
if speed_module_3 then
    speed_module_3.unit = {
        count = 200,
        ingredients = {
            {"t-one-science-pack", 1},
            {"t-two-science-pack", 1},
            {"t-three-science-pack", 1}
        },
        time = 10,
    }
    speed_module_3.hidden = false
    speed_module_3.enabled = true
    speed_module_3.prerequisites = {"t-three-science-pack", "speed-module-2"}
end

-- Productivity module 3
local productivity_module_3 = data.raw["technology"]["productivity-module-3"]
if productivity_module_3 then
    productivity_module_3.unit = {
        count = 200,
        ingredients = {
            {"t-one-science-pack", 1},
            {"t-two-science-pack", 1},
            {"t-three-science-pack", 1}
        },
        time = 10,
    }
    productivity_module_3.hidden = false
    productivity_module_3.enabled = true
    productivity_module_3.prerequisites = {"t-three-science-pack", "productivity-module-2"}
end

-- Quality module 3
local quality_module_3 = data.raw["technology"]["quality-module-3"]
if quality_module_3 then
    quality_module_3.unit = {
        count = 200,
        ingredients = {
            {"t-one-science-pack", 1},
            {"t-two-science-pack", 1},
            {"t-three-science-pack", 1}
        },
        time = 10,
    }
    quality_module_3.hidden = false
    quality_module_3.enabled = true
    quality_module_3.prerequisites = {"t-three-science-pack", "quality-module-2"}
end

-- Railgun damage 1-infinite
local railgun_damage_inf = data.raw["technology"]["railgun-damage-1"]
if railgun_damage_inf then
    railgun_damage_inf.unit = {
        count_formula = "1^L*100",
        ingredients = {
            {"military-data-disk", 1},
        },
        time = 10,
    }
    railgun_damage_inf.hidden = false
    railgun_damage_inf.enabled = true
    railgun_damage_inf.prerequisites = {"military-data-disk", "railgun"}
end

-- Railgun shooting speed 1-infinite
local railgun_shooting_speed_inf = data.raw["technology"]["railgun-shooting-speed-1"]
if railgun_shooting_speed_inf then
    railgun_shooting_speed_inf.unit = {
        count_formula = "1^L*100",
        ingredients = {
            {"military-data-disk", 1},
        },
        time = 10,
    }
    railgun_shooting_speed_inf.hidden = false
    railgun_shooting_speed_inf.enabled = true
    railgun_shooting_speed_inf.prerequisites = {"military-data-disk", "railgun"}
end

---------------------------------------------------------------------------------------------
--- Final tech

local research_prod = table.deepcopy(data.raw["technology"]["gun-turret"])
if research_prod then
    research_prod.name = "research-productivity"
    research_prod.icon = data.raw["technology"]["research-productivity"].icon
    research_prod.icon_size = data.raw["technology"]["research-productivity"].icon_size
    research_prod.unit =
    {
      count_formula = "1.5^L*100",
      ingredients =
      {
        {"energy-data-disk", 1},
        {"bio-data-disk", 1},
        {"promethium-data-disk", 1},
        {"mechanical-data-disk", 1},
        {"military-data-disk", 1},
      },
      time = 60
    }
    research_prod.max_level = "infinite"
    research_prod.upgrade = true
    research_prod.effects = {
        {
            type = "laboratory-productivity",
            modifier = 0.10
        },
    }
    research_prod.hidden = false
    research_prod.enabled = true
    research_prod.prerequisites = {"energy-data-disk", "bio-data-disk", "promethium-data-disk", "mechanical-data-disk", "military-data-disk"}
end

data:extend({research_prod})