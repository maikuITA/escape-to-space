--modified-entity.lua

local plant = data.raw["assembling-machine"]["electromagnetic-plant"]
local pics = require("__space-age__.prototypes.entity.electromagnetic-plant-pictures")

local em_lab = table.deepcopy(data.raw.lab["lab"])
em_lab.name = "electromagnetic-lab"
em_lab.icon = "__space-age__/graphics/icons/electromagnetic-plant.png"
em_lab.icon_size = 64
em_lab.minable = {mining_time = 0.1, result = "electromagnetic-lab"}

-- Struttura/robustezza dal plant
em_lab.corpse = plant.corpse
em_lab.dying_explosion = plant.dying_explosion
em_lab.resistances = plant.resistances
em_lab.collision_box = plant.collision_box
em_lab.selection_box = plant.selection_box
em_lab.damaged_trigger_effect = plant.damaged_trigger_effect

-- Energia e ricerca da lab
em_lab.energy_source = {type = "electric", usage_priority = "secondary-input"}
em_lab.energy_usage = "500kW"
em_lab.researching_speed = 1
em_lab.inputs = {"t-one-science-pack", "t-two-science-pack"}
em_lab.module_slots = 0
em_lab.allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"}

-- Grafica del plant applicata al lab
em_lab.on_animation = pics.graphics_set.animation
em_lab.off_animation = pics.graphics_set.animation
em_lab.water_reflection = pics.water_reflection

data:extend({em_lab})