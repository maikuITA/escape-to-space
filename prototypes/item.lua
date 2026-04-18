-- item.lua

--------------------------------------------------------------------------
--- START ASTEROIDS

-- Irony asteroid chunk
local irony_asteroid_chunk = {
  type = "item",
  name = "irony-asteroid-chunk",
  icon = "__escape-to-space__/graphics/icons/irony-asteroid-chunk.png",
  icon_size = 64,
  subgroup = "raw-material",
  order = "a[raw]-a[irony-asteroid-chunk]",
  stack_size = 100
}

data:extend({irony_asteroid_chunk})

-- Coppery asteroid chunk
local coppery_asteroid_chunk = {
  type = "item",
  name = "coppery-asteroid-chunk",
  icon = "__escape-to-space__/graphics/icons/coppery-asteroid-chunk.png",
  icon_size = 64,
  subgroup = "raw-material",
  order = "a[raw]-b[coppery-asteroid-chunk]",
  stack_size = 100
}

data:extend({coppery_asteroid_chunk})

-- Rocky asteroid chunk
local rocky_asteroid_chunk = {
  type = "item",
  name = "rocky-asteroid-chunk",
  icon = "__escape-to-space__/graphics/icons/rocky-asteroid-chunk.png",
  icon_size = 64,
  subgroup = "raw-material",
  order = "a[raw]-c[rocky-asteroid-chunk]",
  stack_size = 100
}

data:extend({rocky_asteroid_chunk})

-- Tungsten asteroid chunk
local tungsten_asteroid_chunk = {
  type = "item",
  name = "tungsten-asteroid-chunk",
  icon = "__escape-to-space__/graphics/icons/tungsten-asteroid-chunk.png",
  icon_size = 64,
  subgroup = "raw-material",
  order = "a[raw]-d[tungsten-asteroid-chunk]",
  stack_size = 100
}

data:extend({tungsten_asteroid_chunk})

-- Scrap asteroid chunk
local scrap_asteroid_chunk = {
  type = "item",
  name = "scrap-asteroid-chunk",
  icon = "__escape-to-space__/graphics/icons/scrap-asteroid-chunk.png",
  icon_size = 64,
  subgroup = "raw-material",
  order = "a[raw]-e[scrap-asteroid-chunk]",
  stack_size = 100
}

data:extend({scrap_asteroid_chunk})

-- Alien asteroid chunk
local alien_asteroid_chunk = {
  type = "item",
  name = "alien-asteroid-chunk",
  icon = "__escape-to-space__/graphics/icons/alien-asteroid-chunk.png",
  icon_size = 64,
  subgroup = "raw-material",
  order = "a[raw]-f[alien-asteroid-chunk]",
  stack_size = 100
}

data:extend({alien_asteroid_chunk})

-- Fluorite asteroid chunk
local fluorite_asteroid_chunk = {
  type = "item",
  name = "fluorite-asteroid-chunk",
  icon = "__escape-to-space__/graphics/icons/fluorite-asteroid-chunk.png",
  icon_size = 64,
  subgroup = "raw-material",
  order = "a[raw]-f[fluorite-asteroid-chunk]",
  stack_size = 100
}

data:extend({fluorite_asteroid_chunk})

--- END ASTEROIDS
--------------------------------------------------------------------------

--------------------------------------------------------------------------
--- START MACHINES

-- Basic electric furnace
local basic_electric_furnace = {
  type = "item",
  name = "basic-electric-furnace",
  icon = "__escape-to-space__/graphics/icons/basic-electric-furnace.png",
  icon_size = 64,
  subgroup = "production-machine",
  order = "a[production-machine]-a[basic-electric-furnace]",
  place_result = "basic-electric-furnace",
  stack_size = 50
}

data:extend({basic_electric_furnace})

-- Cybernetics facility
local cybernetics_facility = {
  type = "item",
  name = "cybernetics-facility",
  icon = "__escape-to-space__/graphics/icons/cybernetics-facility-icon.png",
  icon_size = 64,
  subgroup = "production-machine",
  order = "a[production-machine]-b[cybernetics-facility]",
  place_result = "cybernetics-facility",
  stack_size = 50
}

data:extend({cybernetics_facility})

-- Mixing station
local mixing_station = {
  type = "item",
  name = "mixing-station",
  icon = "__escape-to-space__/graphics/icons/mixing-station-icon.png",
  icon_size = 64,
  subgroup = "production-machine",
  order = "a[production-machine]-c[mixing-station]",
  place_result = "mixing-station",
  stack_size = 50
}

data:extend({mixing_station})

-- Chemical stager
local chemical_stager = {
  type = "item",
  name = "chemical-stager",
  icon = "__escape-to-space__/graphics/icons/chemical-stager-icon.png",
  icon_size = 64,
  subgroup = "production-machine",
  order = "a[production-machine]-d[chemical-stager]",
  place_result = "chemical-stager",
  stack_size = 50
}

data:extend({chemical_stager})

-- Quantum stabilizer
local quantum_stabilizer = {
  type = "item",
  name = "quantum-stabilizer",
  icon = "__escape-to-space__/graphics/icons/quantum-stabilizer-icon.png",
  icon_size = 64,
  subgroup = "production-machine",
  order = "a[production-machine]-e[quantum-stabilizer]",
  place_result = "quantum-stabilizer",
  stack_size = 50
}

data:extend({quantum_stabilizer})

-- Gravity assembler
local gravity_assembler = {
  type = "item",
  name = "gravity-assembler",
  icon = "__escape-to-space__/graphics/icons/gravity-assembler-icon.png",
  icon_size = 64,
  subgroup = "production-machine",
  order = "a[production-machine]-f[gravity-assembler]",
  place_result = "gravity-assembler",
  stack_size = 50
}

data:extend({gravity_assembler})

-- Greenhouse
local greenhouse = {
  type = "item",
  name = "greenhouse",
  icon = "__escape-to-space__/graphics/icons/greenhouse-icon.png",
  icon_size = 64,
  subgroup = "production-machine",
  order = "a[production-machine]-g[greenhouse]",
  place_result = "greenhouse",
  stack_size = 50
}

data:extend({greenhouse})

-- Arc furnace
local arc_furnace = {
  type = "item",
  name = "arc-furnace",
  icon = "__escape-to-space__/graphics/icons/arc-furnace-icon.png",
  icon_size = 64,
  subgroup = "production-machine",
  order = "a[production-machine]-h[arc-furnace]",
  place_result = "arc-furnace",
  stack_size = 50
}

data:extend({arc_furnace})

-- Oxide lab
local oxide_lab = {
  type = "item",
  name = "oxide-lab",
  icon = "__escape-to-space__/graphics/icons/oxide-lab-icon.png",
  icon_size = 64,
  subgroup = "production-machine",
  order = "a[production-machine]-i[oxide-lab]",
  place_result = "oxide-lab",
  stack_size = 50
}

data:extend({oxide_lab})

-- Cybernetic lab
local cybernetic_lab = {
  type = "item",
  name = "cybernetic-lab",
  icon = "__escape-to-space__/graphics/icons/cybernetic-lab-icon.png",
  icon_size = 64,
  subgroup = "production-machine",
  order = "a[production-machine]-j[cybernetic-lab]",
  place_result = "cybernetic-lab",
  stack_size = 50
}

data:extend({cybernetic_lab})

-- Scrubber
local scrubber = {
  type = "item",
  name = "scrubber",
  icon = "__escape-to-space__/graphics/icons/scrubber-icon.png",
  icon_size = 64,
  subgroup = "production-machine",
  order = "a[production-machine]-k[scrubber]",
  place_result = "scrubber",
  stack_size = 50
}

data:extend({scrubber})

--- END MACHINES
--------------------------------------------------------------------------

--------------------------------------------------------------------------
--- START TOOLS

-- Memory card
local basic_memory_card = {
  type = "tool",
  name = "basic-memory-card",
  icon = "__escape-to-space__/graphics/icons/basic-memory-card.png",
  icon_size = 64,
  subgroup = "tool",
  order = "a[tool]-a[memory-card]",
  stack_size = 200,
  weight = 1*kg,
  durability = 1,
  durability_description_key = "description.science-pack-remaining-amount-key",
  factoriopedia_durability_description_key = "description.factoriopedia-science-pack-remaining-amount-key",
  durability_description_value = "description.science-pack-remaining-amount-value",
}

data:extend({basic_memory_card})

--- END TOOLS
--------------------------------------------------------------------------