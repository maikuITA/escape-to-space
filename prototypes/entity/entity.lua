-- entity.lua

require ("util")
require("__base__.prototypes.entity.pipecovers")
local sounds = require("__base__.prototypes.entity.sounds")

data:extend({

    -- Basic electric furnace
    {
    type = "furnace",
    name = "basic-electric-furnace",
    icon = "__escape-to-space__/graphics/icons/basic-electric-furnace.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "basic-electric-furnace"},
    fast_replaceable_group = "furnace",
    circuit_wire_max_distance = furnace_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["basic-electric-furnace"],
    max_health = 350,
    corpse = "basic-electric-furnace-remnants",
    dying_explosion = data.raw["furnace"]["electric-furnace"].dying_explosion,
    resistances =
    {
      {
        type = "fire",
        percent = 80
      }
    },
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    damaged_trigger_effect = data.raw["furnace"]["electric-furnace"].damaged_trigger_effect,
    module_slots = 0,
    icon_draw_specification = {shift = {0, -0.1}},
    icons_positioning =
    {
      {inventory_index = defines.inventory.furnace_modules, shift = {0, 0.8}}
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"},
    crafting_categories = {"smelting"},
    result_inventory_size = 1,
    crafting_speed = 1,
    energy_usage = "90kW",
    source_inventory_size = 1,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 1 }
    },
    impact_category = "metal",
    open_sound = data.raw["furnace"]["electric-furnace"].open_sound,
    close_sound = data.raw["furnace"]["electric-furnace"].close_sound,
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/electric-furnace.ogg",
        volume = 0.85,
        modifiers = volume_multiplier("main-menu", 4.2),
        advanced_volume_control = {attenuation = "exponential"},
        audible_distance_modifier = 0.7,
      },
      max_sounds_per_prototype = 4,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    graphics_set =
    {
      animation =
      {
        layers =
        {
          {
            filename = "__escape-to-space__/graphics/entity/basic-electric-furnace/basic-electric-furnace.png",
            priority = "high",
            width = 239,
            height = 219,
            shift = util.by_pixel(0.75, 5.75),
            scale = 0.5
          },
          {
            filename = "__escape-to-space__/graphics/entity/basic-electric-furnace/basic-electric-furnace-shadow.png",
            priority = "high",
            width = 227,
            height = 171,
            draw_as_shadow = true,
            shift = util.by_pixel(11.25, 7.75),
            scale = 0.5
          }
        }
      },
      working_visualisations =
      {
        {
          fadeout = true,
          animation =
          {
            layers =
            {
              {
                filename = "__escape-to-space__/graphics/entity/basic-electric-furnace/basic-electric-furnace-heater.png",
                priority = "high",
                width = 60,
                height = 56,
                frame_count = 12,
                animation_speed = 0.5,
                draw_as_glow = true,
                shift = util.by_pixel(1.75, 32.75),
                scale = 0.5
              },
              {
                filename = "__escape-to-space__/graphics/entity/basic-electric-furnace/basic-electric-furnace-light.png",
                blend_mode = "additive",
                width = 202,
                height = 202,
                repeat_count = 12,
                draw_as_glow = true,
                shift = util.by_pixel(1, 0),
                scale = 0.5,
              },
            }
          },
        },
        {
          fadeout = true,
          animation =
          {
            filename = "__escape-to-space__/graphics/entity/basic-electric-furnace/basic-electric-furnace-ground-light.png",
            blend_mode = "additive",
            width = 166,
            height = 124,
            draw_as_light = true,
            shift = util.by_pixel(3, 69),
            scale = 0.5,
          },
        },
        {
          animation =
          {
            filename = "__escape-to-space__/graphics/entity/basic-electric-furnace/basic-electric-furnace-propeller-1.png",
            priority = "high",
            width = 37,
            height = 25,
            frame_count = 4,
            animation_speed = 0.5,
            shift = util.by_pixel(-20.5, -18.5),
            scale = 0.5
          }
        },
        {
          animation =
          {
            filename = "__escape-to-space__/graphics/entity/basic-electric-furnace/basic-electric-furnace-propeller-2.png",
            priority = "high",
            width = 23,
            height = 15,
            frame_count = 4,
            animation_speed = 0.5,
            shift = util.by_pixel(3.5, -38),
            scale = 0.5
          }
        }
      },
      water_reflection =
      {
        pictures =
        {
          filename = "__escape-to-space__/graphics/entity/basic-electric-furnace/basic-electric-furnace-reflection.png",
          priority = "extra-high",
          width = 24,
          height = 24,
          shift = util.by_pixel(5, 40),
          variation_count = 1,
          scale = 5
        },
        rotate = false,
        orientation_to_variation = false
      }
    }
  },

  --Cybernetics facility
    {
    type = "assembling-machine",
    name = "cybernetics-facility",
    icon = "__escape-to-space__/graphics/icons/cybernetics-facility-icon.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "cybernetics-facility"},
    --fast_replaceable_group = "furnace",
    circuit_wire_max_distance = furnace_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["basic-electric-furnace"],
    max_health = 350,
    corpse = "basic-electric-furnace-remnants",
    dying_explosion = data.raw["furnace"]["electric-furnace"].dying_explosion,
    effect_receiver = { base_effect = { productivity = 0.25 }},
    resistances = {
        {
            type = "fire",
            percent = 80
        }
    },
    collision_box = {{-1.9, -1.9}, {1.9, 1.9}},
    selection_box = {{-2.0, -2.0}, {2.0, 2.0}},
    damaged_trigger_effect = data.raw["furnace"]["electric-furnace"].damaged_trigger_effect,
    module_slots = 0,
    icon_draw_specification = {shift = {0, -0.1}},
    icons_positioning = {
        {
            inventory_index = defines.inventory.furnace_modules,
            shift = {0, 0.8}
        }
    },
    allowed_effects = {"consumption", "speed", "productivity", "quality"},
    crafting_categories = {"bottling", "mixing"},
    result_inventory_size = 1,
    crafting_speed = 1,
    energy_usage = "500kW",
    perceived_performance = {minimum = 0.25, maximum = 20},
    source_inventory_size = 1,
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
    },
    graphics_set = {
        animation = {
            layers = {
                {
                    filename = "__escape-to-space__/graphics/entity/cybernetics-facility/base/cybernetics-facility-hr-animation-1.png",
                    priority = "high",
                    width = 270,  -- tot/8
                    height = 310, -- tot/8
                    frame_count = 64,
                    line_length = 8,
                    animation_speed = 0.5,
                    shift = util.by_pixel(0, 0),
                    scale = 0.5
                },
                {
                    filename = "__escape-to-space__/graphics/entity/cybernetics-facility/base/cybernetics-facility-hr-shadow.png",
                    priority = "high",
                    width = 500,
                    height = 350,
                    frame_count = 1,
                    line_length = 1,
                    repeat_count = 64,
                    draw_as_shadow = true,
                    animation_speed = 0.5,
                    shift = util.by_pixel(0, 0),
                    scale = 0.5
                },
                {
                    filename = "__escape-to-space__/graphics/entity/cybernetics-facility/base/cybernetics-facility-hr-emission-1.png",
                    priority = "high",
                    width = 270,  -- tot/8
                    height = 310, -- tot/8
                    frame_count = 64,
                    line_length = 8,
                    animation_speed = 0.5,
                    draw_as_glow = true,
                    blend_mode = "additive",
                    shift = util.by_pixel(0, 0),
                    scale = 0.5
                },
            }
        }
    },
    fluid_boxes = {
      {
        production_type = "input",
        pipe_picture = util.empty_sprite(),
        pipe_covers = pipecoverspictures(),
        always_draw_covers = false,
        volume = 1000,
        pipe_connections = {
          { flow_direction = "input", direction = defines.direction.south, position = {-1.5, 1.5} }
        }
      },
      {
        production_type = "input",
        pipe_picture = util.empty_sprite(),
        pipe_covers = pipecoverspictures(),
        always_draw_covers = false,
        volume = 1000,
        pipe_connections = {
          { flow_direction = "input", direction = defines.direction.south, position = {1.5, 1.5} }
        }
      },
      {
        production_type = "output",
        pipe_picture = util.empty_sprite(),
        pipe_covers = pipecoverspictures(),
        always_draw_covers = false,
        volume = 1000,
        pipe_connections = {
          { flow_direction = "output", direction = defines.direction.north, position = {-1.5, -1.5} }
        }
      },
      {
        production_type = "output",
        pipe_picture = util.empty_sprite(),
        pipe_covers = pipecoverspictures(),
        always_draw_covers = false,
        volume = 1000,
        pipe_connections = {
          { flow_direction = "output", direction = defines.direction.north, position = {1.5, -1.5} }
        }
      }
    },
    fluid_boxes_off_when_no_fluid_recipe = true,
  },

  -- Electromagnetic lab
  {
    type = "lab",
    name = "oxide-lab",
    icon = "__escape-to-space__/graphics/entity/oxide-lab/oxide-lab-icon.png",
    icon_size = 64,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.1, result = "oxide-lab"},

    max_health = 350,
    corpse = data.raw["assembling-machine"]["electromagnetic-plant"].corpse,
    dying_explosion = data.raw["assembling-machine"]["electromagnetic-plant"].dying_explosion,
    collision_box = {{-1.9, -1.9}, {1.9, 1.9}},
    selection_box = {{-2.0, -2.0}, {2.0, 2.0}},
    effect_receiver = { base_effect = { productivity = 0.25 }},
    resistances = data.raw["assembling-machine"]["electromagnetic-plant"].resistances,
    damaged_trigger_effect = data.raw["assembling-machine"]["electromagnetic-plant"].damaged_trigger_effect,

    circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["electromagnetic-plant"],

    energy_source = {
      type = "electric",
      usage_priority = "secondary-input"
    },
    energy_usage = "500kW",
    heating_energy = "100kW",

    researching_speed = 1.5,
    inputs = {"earth-science-pack", "axkeria-science-pack", "t-one-science-pack", "t-two-science-pack", "t-three-science-pack"},
    module_slots = 4,
    allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"},

    on_animation = {
      layers = {
        {
          filename = "__escape-to-space__/graphics/entity/oxide-lab/oxide-lab-hr-animation-1.png",
          priority = "high",
          width = 280,
          height = 320,
          frame_count = 1,
          line_length = 1,
          shift = util.by_pixel(0, 0),
          scale = 0.5
        },
        {
          filename = "__escape-to-space__/graphics/entity/oxide-lab/oxide-lab-hr-color1-1.png",
          priority = "high",
          width = 280,
          height = 320,
          frame_count = 1,
          line_length = 1,
          shift = util.by_pixel(0, 0),
          scale = 0.5
        },
        {
          filename = "__escape-to-space__/graphics/entity/oxide-lab/oxide-lab-hr-color2-1.png",
          priority = "high",
          width = 280,
          height = 320,
          frame_count = 1,
          line_length = 1,
          shift = util.by_pixel(0, 0),
          scale = 0.5
        },
        {
          filename = "__escape-to-space__/graphics/entity/oxide-lab/oxide-lab-hr-emission-1.png",
          priority = "high",
          width = 280,
          height = 320,
          frame_count = 1,
          line_length = 1,
          draw_as_glow = true,
          blend_mode = "additive",
          shift = util.by_pixel(0, 0),
          scale = 0.5
        },
        {
          filename = "__escape-to-space__/graphics/entity/oxide-lab/oxide-lab-hr-shadow.png",
          priority = "high",
          width = 700,
          height = 500,
          frame_count = 1,
          line_length = 1,
          draw_as_shadow = true,
          shift = util.by_pixel(0, 0),
          scale = 0.5
        }
      }
    },
    off_animation = {
      layers = {
        {
          filename = "__escape-to-space__/graphics/entity/oxide-lab/oxide-lab-hr-animation-1.png",
          priority = "high",
          width = 280,
          height = 320,
          frame_count = 1,
          line_length = 1,
          shift = util.by_pixel(0, 0),
          scale = 0.5
        },
        {
          filename = "__escape-to-space__/graphics/entity/oxide-lab/oxide-lab-hr-color1-1.png",
          priority = "high",
          width = 280,
          height = 320,
          frame_count = 1,
          line_length = 1,
          shift = util.by_pixel(0, 0),
          scale = 0.5
        },
        {
          filename = "__escape-to-space__/graphics/entity/oxide-lab/oxide-lab-hr-color2-1.png",
          priority = "high",
          width = 280,
          height = 320,
          frame_count = 1,
          line_length = 1,
          shift = util.by_pixel(0, 0),
          scale = 0.5
        },
        {
          filename = "__escape-to-space__/graphics/entity/oxide-lab/oxide-lab-hr-shadow.png",
          priority = "high",
          width = 700,
          height = 500,
          frame_count = 1,
          line_length = 1,
          draw_as_shadow = true,
          shift = util.by_pixel(0, 0),
          scale = 0.5
        }
      }
    },
  },
  --Cybernetic lab
	{
		name = "cybernetic-lab",
		type = "lab",
		icon = "__escape-to-space__/graphics/entity/cybernetic-lab/cybernetic-lab.png",
		icon_size = 64,
		flags = { "placeable-neutral", "placeable-player", "player-creation" },
		minable = {
			mining_time = 0.5,
			results = { { type = "item", name = "cybernetic-lab", amount = 1 } },
		},
		max_health = 500,
		corpse = "medium-remnants",
		dying_explosion = "medium-explosion",
		circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
		circuit_connector = circuit_connector_definitions["cybernetic-lab"],
		collision_box = { { -4.7, -4.7 }, { 4.7, 4.7 } },
		selection_box = { { -5.1, -5.1 }, { 5.1, 5.1 } },
		energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
    },
		impact_category = "metal",
		open_sound = sounds.metal_large_open,
		close_sound = sounds.metal_large_close,
		energy_usage = "1500kW",
		heating_energy = "100kW",
		module_slots = 8,
		researching_speed = 3,
		inputs = {
			"energy-data-disk",
      "bio-data-disk",
      "promethium-data-disk",
      "mechanical-data-disk",
      "military-data-disk",
		},
		source_inventory_size = 1,
		on_animation = {
			layers = {
				{
					priority = "high",
					width = 330,
					height = 390,
					frame_count = 80,
					lines_per_file = 8,
					animation_speed = 0.35,
					scale = 1.08,
					shift = util.by_pixel(2, -40),
					stripes = {
						{
							filename = "__escape-to-space__/graphics/entity/cybernetic-lab/cybernetic-lab-hr-animation-1.png",
							width_in_frames = 8,
							height_in_frames = 8,
						},
						{
							filename = "__escape-to-space__/graphics/entity/cybernetic-lab/cybernetic-lab-hr-animation-2.png",
							width_in_frames = 8,
							height_in_frames = 2,
						},
					},
				},
				{
					priority = "high",
					draw_as_glow = true,
					blend_mode = "additive",
					width = 330,
					height = 390,
					frame_count = 80,
					lines_per_file = 8,
					animation_speed = 0.35,
					scale = 1.08,
					shift = util.by_pixel(2, -40),
					stripes = {
						{
							filename = "__escape-to-space__/graphics/entity/cybernetic-lab/cybernetic-lab-hr-emission-1.png",
							width_in_frames = 8,
							height_in_frames = 8,
						},
						{
							filename = "__escape-to-space__/graphics/entity/cybernetic-lab/cybernetic-lab-hr-emission-2.png",
							width_in_frames = 8,
							height_in_frames = 2,
						},
					},
				},
				{
					filename = "__escape-to-space__/graphics/entity/cybernetic-lab/cybernetic-lab-hr-shadow.png",
					priority = "high",
					width = 1200,
					height = 700,
					frame_count = 1,
					line_length = 1,
					repeat_count = 80,
					animation_speed = 0.35,
					draw_as_shadow = true,
					scale = 1.08,
					shift = util.by_pixel(2, -40),
				},
			},
		},
		off_animation = {
			layers = {
				{
					filename = "__escape-to-space__/graphics/entity/cybernetic-lab/cybernetic-lab-hr-shadow.png",
					priority = "high",
					width = 1200,
					height = 700,
					frame_count = 1,
					line_length = 1,
					repeat_count = 80,
					animation_speed = 0.35,
					draw_as_shadow = true,
					scale = 1.08,
					shift = util.by_pixel(2, -40),
				},
				{
					priority = "high",
					width = 330,
					height = 390,
					frame_count = 80,
					lines_per_file = 8,
					animation_speed = 0.35,
					scale = 1.08,
					shift = util.by_pixel(2, -40),
					stripes = {
						{
							filename = "__escape-to-space__/graphics/entity/cybernetic-lab/cybernetic-lab-hr-animation-1.png",
							width_in_frames = 8,
							height_in_frames = 8,
						},
						{
							filename = "__escape-to-space__/graphics/entity/cybernetic-lab/cybernetic-lab-hr-animation-2.png",
							width_in_frames = 8,
							height_in_frames = 2,
						},
					},
				},
			},
		},

		alert_icon_shift = util.by_pixel(0, -12),
		icon_draw_specification = { shift = { 0, -0.3 } },

		icons_positioning = {
			{ inventory_index = defines.inventory.lab_modules, shift = { 0, -0.6 } },
			{
				inventory_index = defines.inventory.lab_input,
				shift = { 0, 0.4 },
				max_icons_per_row = 10,
				separation_multiplier = 1 / 1.1,
			},
		},

		working_sound = {
			sound = {
				filename = "__space-age__/sound/entity/fusion/fusion-generator.ogg",
				volume = 0.4,
				advanced_volume_control = { attenuation = "exponential" },
			},
			sound_accents = {
				{
					sound = {
						variations = sound_variations("__space-age__/sound/entity/biolab/biolab-beaker", 7, 0.8),
						audible_distance_modifier = 0.4,
					},
					frame = 1,
				},
			},
			max_sounds_per_prototype = 2,
		},
	},

  --Mixing station
  {
    type = "assembling-machine",
    name = "mixing-station",
    icon = "__escape-to-space__/graphics/icons/mixing-station-icon.png",
    icon_size = 64,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "mixing-station"},
    circuit_wire_max_distance = furnace_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["basic-electric-furnace"],
    max_health = 350,
    corpse = "basic-electric-furnace-remnants",
    dying_explosion = data.raw["furnace"]["electric-furnace"].dying_explosion,
    resistances =
    {
      {
        type = "fire",
        percent = 80
      }
    },
    collision_box = {{-1.9, -1.9}, {1.9, 1.9}},
    selection_box = {{-2.0, -2.0}, {2.0, 2.0}},
    damaged_trigger_effect = data.raw["furnace"]["electric-furnace"].damaged_trigger_effect,
    module_slots = 0,
    icon_draw_specification = {shift = {0, -0.1}},
    icons_positioning =
    {
      {inventory_index = defines.inventory.furnace_modules, shift = {0, 0.8}}
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"},
    crafting_categories = {"blending"},
    result_inventory_size = 1,
    crafting_speed = 1,
    energy_usage = "500kW",
    source_inventory_size = 1,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input"
    },
    graphics_set = {
        animation = {
            layers = {
              {
                priority = "high",
                width = 270,
                height = 310,
                frame_count = 80,          -- 64 + 16
                lines_per_file = 8,
                animation_speed = 0.5,
                shift = util.by_pixel(0, 0),
                scale = 0.5,
                stripes = {
                  {
                    filename = "__escape-to-space__/graphics/entity/mixing-station/base/mixing-station-hr-animation-1.png",
                    width_in_frames = 8,
                    height_in_frames = 8
                  },
                  {
                    filename = "__escape-to-space__/graphics/entity/mixing-station/base/mixing-station-hr-animation-2.png",
                    width_in_frames = 8,
                    height_in_frames = 2
                  }
                }
              },
              {
                filename = "__escape-to-space__/graphics/entity/mixing-station/base/mixing-station-hr-shadow.png",
                priority = "high",
                width = 500,
                height = 350,
                frame_count = 1,
                line_length = 1,
                repeat_count = 80,         -- deve seguire il frame_count totale
                draw_as_shadow = true,
                animation_speed = 0.5,
                shift = util.by_pixel(0, 0),
                scale = 0.5
              },
              {
                priority = "high",
                width = 270,
                height = 310,
                frame_count = 80,          -- 64 + 16
                lines_per_file = 8,
                animation_speed = 0.5,
                draw_as_glow = true,
                blend_mode = "additive",
                shift = util.by_pixel(0, 0),
                scale = 0.5,
                stripes = {
                  {
                    filename = "__escape-to-space__/graphics/entity/mixing-station/base/mixing-station-hr-emission1-1.png",
                    width_in_frames = 8,
                    height_in_frames = 8
                  },
                  {
                    filename = "__escape-to-space__/graphics/entity/mixing-station/base/mixing-station-hr-emission1-2.png",
                    width_in_frames = 8,
                    height_in_frames = 2
                  }
                }
              },
              {
                priority = "high",
                width = 270,
                height = 310,
                frame_count = 80,          -- 64 + 16
                lines_per_file = 8,
                animation_speed = 0.5,
                draw_as_glow = true,
                blend_mode = "additive",
                shift = util.by_pixel(0, 0),
                scale = 0.5,
                stripes = {
                  {
                    filename = "__escape-to-space__/graphics/entity/mixing-station/base/mixing-station-hr-emission2-1.png",
                    width_in_frames = 8,
                    height_in_frames = 8
                  },
                  {
                    filename = "__escape-to-space__/graphics/entity/mixing-station/base/mixing-station-hr-emission2-2.png",
                    width_in_frames = 8,
                    height_in_frames = 2
                  }
                }
              },
            }
        }
    },
    fluid_boxes = {
      {
        production_type = "input",
        pipe_picture = util.empty_sprite(),
        pipe_covers = pipecoverspictures(),
        always_draw_covers = false,
        volume = 1000,
        pipe_connections = {
          { flow_direction = "input", direction = defines.direction.south, position = {-1.5, 1.5} }
        }
      },
      {
        production_type = "input",
        pipe_picture = util.empty_sprite(),
        pipe_covers = pipecoverspictures(),
        always_draw_covers = false,
        volume = 1000,
        pipe_connections = {
          { flow_direction = "input", direction = defines.direction.south, position = {1.5, 1.5} }
        }
      },
    },
    fluid_boxes_off_when_no_fluid_recipe = true,
  },

  --Chemical stager
  {
    type = "assembling-machine",
    name = "chemical-stager",
    icon = "__escape-to-space__/graphics/icons/chemical-stager-icon.png",
    icon_size = 64,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "chemical-stager"},
    circuit_wire_max_distance = furnace_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["basic-electric-furnace"],
    max_health = 350,
    corpse = "basic-electric-furnace-remnants",
    dying_explosion = data.raw["furnace"]["electric-furnace"].dying_explosion,
    resistances =
    {
      {
        type = "fire",
        percent = 80
      }
    },
    collision_box = {{-2.2, -2.2}, {2.2, 2.2}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    damaged_trigger_effect = data.raw["furnace"]["electric-furnace"].damaged_trigger_effect,
    module_slots = 0,
    icon_draw_specification = {shift = {0, -0.1}},
    icons_positioning =
    {
      {inventory_index = defines.inventory.furnace_modules, shift = {0, 0.8}}
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"},
    crafting_categories = {"dissolution"},
    result_inventory_size = 1,
    crafting_speed = 1,
    energy_usage = "500kW",
    source_inventory_size = 1,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input"
    },
    graphics_set = {
        animation = {
            layers = {
                {
                    filename = "__escape-to-space__/graphics/entity/chemical-stager/chemical-stager-hr-animation-1.png",
                    priority = "high",
                    width = 400,  -- tot/8
                    height = 400, -- tot/8
                    frame_count = 60,
                    line_length = 8,
                    animation_speed = 0.5,
                    shift = util.by_pixel(0, 0),
                    scale = 0.5
                },
                {
                    filename = "__escape-to-space__/graphics/entity/chemical-stager/chemical-stager-hr-shadow.png",
                    priority = "high",
                    width = 800,
                    height = 600,
                    frame_count = 1,
                    line_length = 1,
                    repeat_count = 60,
                    draw_as_shadow = true,
                    animation_speed = 0.5,
                    shift = util.by_pixel(0, 0),
                    scale = 0.5
                },
                {
                    filename = "__escape-to-space__/graphics/entity/chemical-stager/chemical-stager-hr-emission-1.png",
                    priority = "high",
                    width = 400,  -- tot/8
                    height = 400, -- tot/8
                    frame_count = 60,
                    line_length = 8,
                    animation_speed = 0.5,
                    draw_as_glow = true,
                    blend_mode = "additive",
                    shift = util.by_pixel(0, 0),
                    scale = 0.5
                },
            }
        }
    },
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_picture = util.empty_sprite(),
        pipe_covers = pipecoverspictures(),
        always_draw_covers = false,
        volume = 1000,
        pipe_connections = {{ flow_direction="input", direction = defines.direction.south, position = {-1, 2} }}
      },
      {
        production_type = "input",
        pipe_picture = util.empty_sprite(),
        pipe_covers = pipecoverspictures(),
        always_draw_covers = false,
        volume = 1000,
        pipe_connections = {{ flow_direction="input", direction = defines.direction.south, position = {1, 2} }}
      },
      {
        production_type = "output",
        pipe_picture = util.empty_sprite(),
        pipe_covers = pipecoverspictures(),
        always_draw_covers = false,
        volume = 100,
        pipe_connections = {{ flow_direction="output", direction = defines.direction.north, position = {-1, -2} }}
      },
      {
        production_type = "output",
        pipe_picture = util.empty_sprite(),
        pipe_covers = pipecoverspictures(),
        always_draw_covers = false,
        volume = 100,
        pipe_connections = {{ flow_direction="output", direction = defines.direction.north, position = {1, -2} }}
      }
    },
    fluid_boxes_off_when_no_fluid_recipe = true,
  },
  -- Quantum stabilizer
  {
    type = "assembling-machine",
    name = "quantum-stabilizer",
    icon = "__escape-to-space__/graphics/icons/quantum-stabilizer-icon.png",
    icon_size = 64,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "quantum-stabilizer"},
    circuit_wire_max_distance = furnace_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["basic-electric-furnace"],
    max_health = 350,
    corpse = "basic-electric-furnace-remnants",
    dying_explosion = data.raw["furnace"]["electric-furnace"].dying_explosion,
    resistances =
    {
      {
        type = "fire",
        percent = 80
      }
    },
    collision_box = {{-2.2, -2.2}, {2.2, 2.2}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    damaged_trigger_effect = data.raw["furnace"]["electric-furnace"].damaged_trigger_effect,
    module_slots = 0,
    icon_draw_specification = {shift = {0, -0.1}},
    icons_positioning =
    {
      {inventory_index = defines.inventory.furnace_modules, shift = {0, 0.8}}
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"},
    crafting_categories = {"stabilizing"},
    result_inventory_size = 1,
    crafting_speed = 1,
    energy_usage = "2000kW",
    source_inventory_size = 1,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input"
    },
    graphics_set = {
        animation = {
            layers = {
                {
                  priority = "high",
                  width = 410,
                  height = 410,
                  frame_count = 100,          -- 64 + 16
                  lines_per_file = 8,
                  animation_speed = 0.5,
                  shift = util.by_pixel(0, 0),
                  scale = 0.5,
                  stripes = {
                    {
                      filename = "__escape-to-space__/graphics/entity/quantum-stabilizer/quantum-stabilizer-hr-animation-1.png",
                      width_in_frames = 8,
                      height_in_frames = 8
                    },
                    {
                      filename = "__escape-to-space__/graphics/entity/quantum-stabilizer/quantum-stabilizer-hr-animation-2.png",
                      width_in_frames = 8,
                      height_in_frames = 5
                    }
                  }
                },
                {
                    filename = "__escape-to-space__/graphics/entity/quantum-stabilizer/quantum-stabilizer-hr-shadow.png",
                    priority = "high",
                    width = 900,
                    height = 420,
                    frame_count = 1,
                    line_length = 1,
                    repeat_count = 100,         -- deve seguire il frame_count totale
                    draw_as_shadow = true,
                    animation_speed = 0.5,
                    shift = util.by_pixel(0, 0),
                    scale = 0.5
                },
                {
                priority = "high",
                width = 410,
                height = 410,
                frame_count = 100,          -- 64 + 16
                lines_per_file = 8,
                animation_speed = 0.5,
                draw_as_glow = true,
                blend_mode = "additive",
                shift = util.by_pixel(0, 0),
                scale = 0.5,
                stripes = {
                  {
                    filename = "__escape-to-space__/graphics/entity/quantum-stabilizer/quantum-stabilizer-hr-emission-1.png",
                    width_in_frames = 8,
                    height_in_frames = 8
                  },
                  {
                    filename = "__escape-to-space__/graphics/entity/quantum-stabilizer/quantum-stabilizer-hr-emission-2.png",
                    width_in_frames = 8,
                    height_in_frames = 5
                  }
                }
              },
            }
        }
    },
  },

  --Gravity assembler
  {
    type = "assembling-machine",
    name = "gravity-assembler",
    icon = "__escape-to-space__/graphics/icons/gravity-assembler-icon.png",
    icon_size = 64,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "gravity-assembler"},
    circuit_wire_max_distance = furnace_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["basic-electric-furnace"],
    max_health = 350,
    corpse = "basic-electric-furnace-remnants",
    dying_explosion = data.raw["furnace"]["electric-furnace"].dying_explosion,
    effect_receiver = { base_effect = { productivity = 0.25 }},
    resistances =
    {
      {
        type = "fire",
        percent = 80
      }
    },
    collision_box = {{-2.2, -2.2}, {2.2, 2.2}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    damaged_trigger_effect = data.raw["furnace"]["electric-furnace"].damaged_trigger_effect,
    module_slots = 8,
    icon_draw_specification = {shift = {0, -0.1}},
    icons_positioning =
    {
      {inventory_index = defines.inventory.furnace_modules, shift = {0, 0.8}}
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"},
    crafting_categories = {"basic-crafting", "crafting", "advanced-crafting", "crafting-with-fluid"},
    result_inventory_size = 1,
    crafting_speed = 5,
    energy_usage = "5000kW",
    source_inventory_size = 1,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input"
    },
    graphics_set = {
        animation = {
            layers = {
                {
                    filename = "__escape-to-space__/graphics/entity/gravity-assembler/base/gravity-assembler-animation.png",
                    priority = "high",
                    width = 320,
                    height = 320,
                    frame_count = 100,
                    line_length = 10,
                    animation_speed = 0.5,
                    shift = util.by_pixel(0, 0),
                    scale = 0.5
                },
                {
                    filename = "__escape-to-space__/graphics/entity/gravity-assembler/base/gravity-assembler-color1.png",
                    priority = "high",
                    width = 320,
                    height = 320,
                    frame_count = 100,
                    line_length = 10,
                    animation_speed = 0.5,
                    draw_as_glow = false,
                    blend_mode = "normal",
                    shift = util.by_pixel(0, 0),
                    scale = 0.5
                },
                {
                    filename = "__escape-to-space__/graphics/entity/gravity-assembler/base/gravity-assembler-color2.png",
                    priority = "high",
                    width = 320,
                    height = 320,
                    frame_count = 100,
                    line_length = 10,
                    animation_speed = 0.5,
                    draw_as_glow = false,
                    blend_mode = "normal",
                    shift = util.by_pixel(0, 0),
                    scale = 0.5
                },
                {
                    filename = "__escape-to-space__/graphics/entity/gravity-assembler/base/gravity-assembler-color3.png",
                    priority = "high",
                    width = 320,
                    height = 320,
                    frame_count = 100,
                    line_length = 10,
                    animation_speed = 0.5,
                    draw_as_glow = false,
                    blend_mode = "normal",
                    shift = util.by_pixel(0, 0),
                    scale = 0.5
                },
                {
                    filename = "__escape-to-space__/graphics/entity/gravity-assembler/base/gravity-assembler-emission1.png",
                    priority = "high",
                    width = 320,
                    height = 320,
                    frame_count = 100,
                    line_length = 10,
                    animation_speed = 0.5,
                    draw_as_glow = true,
                    blend_mode = "additive",
                    shift = util.by_pixel(0, 0),
                    scale = 0.5
                },
                {
                    filename = "__escape-to-space__/graphics/entity/gravity-assembler/base/gravity-assembler-emission2.png",
                    priority = "high",
                    width = 320,
                    height = 320,
                    frame_count = 100,
                    line_length = 10,
                    animation_speed = 0.5,
                    draw_as_glow = true,
                    blend_mode = "additive",
                    shift = util.by_pixel(0, 0),
                    scale = 0.5
                },
                {
                    filename = "__escape-to-space__/graphics/entity/gravity-assembler/base/gravity-assembler-emission3.png",
                    priority = "high",
                    width = 320,
                    height = 320,
                    frame_count = 100,
                    line_length = 10,
                    animation_speed = 0.5,
                    draw_as_glow = true,
                    blend_mode = "additive",
                    shift = util.by_pixel(0, 0),
                    scale = 0.5
                },
            }
        }
    },
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_picture = util.empty_sprite(),
        pipe_covers = pipecoverspictures(),
        always_draw_covers = false,
        volume = 1000,
        pipe_connections = {{ flow_direction="input", direction = defines.direction.south, position = {-1, 2} }}
      },
      {
        production_type = "input",
        pipe_picture = util.empty_sprite(),
        pipe_covers = pipecoverspictures(),
        always_draw_covers = false,
        volume = 1000,
        pipe_connections = {{ flow_direction="input", direction = defines.direction.south, position = {1, 2} }}
      },
      {
        production_type = "output",
        pipe_picture = util.empty_sprite(),
        pipe_covers = pipecoverspictures(),
        always_draw_covers = false,
        volume = 100,
        pipe_connections = {{ flow_direction="output", direction = defines.direction.north, position = {-1, -2} }}
      },
      {
        production_type = "output",
        pipe_picture = util.empty_sprite(),
        pipe_covers = pipecoverspictures(),
        always_draw_covers = false,
        volume = 100,
        pipe_connections = {{ flow_direction="output", direction = defines.direction.north, position = {1, -2} }}
      }
    },
    fluid_boxes_off_when_no_fluid_recipe = true,
  },

  --Greenhouse
  {
    type = "assembling-machine",
    name = "greenhouse",
    icon = "__escape-to-space__/graphics/icons/greenhouse-icon.png",
    icon_size = 64,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "greenhouse"},
    circuit_wire_max_distance = furnace_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["basic-electric-furnace"],
    max_health = 350,
    corpse = "basic-electric-furnace-remnants",
    dying_explosion = data.raw["furnace"]["electric-furnace"].dying_explosion,
    resistances =
    {
      {
        type = "fire",
        percent = 80
      }
    },
    collision_box = {{-2.2, -2.2}, {2.2, 2.2}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    damaged_trigger_effect = data.raw["furnace"]["electric-furnace"].damaged_trigger_effect,
    module_slots = 4,
    icon_draw_specification = {shift = {0, -0.1}},
    icons_positioning =
    {
      {inventory_index = defines.inventory.furnace_modules, shift = {0, 0.8}}
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"},
    crafting_categories = {"bio"},
    result_inventory_size = 1,
    crafting_speed = 1,
    energy_usage = "2000kW",
    source_inventory_size = 1,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input"
    },
    graphics_set = {
        animation = {
            layers = {
                {
                  priority = "high",
                  width = 340,
                  height = 355,
                  frame_count = 128,
                  lines_per_file = 8,
                  animation_speed = 0.5,
                  shift = util.by_pixel(0, 0),
                  scale = 0.5,
                  stripes = {
                    {
                      filename = "__escape-to-space__/graphics/entity/greenhouse/sprite/greenhouse-hr-animation-1.png",
                      width_in_frames = 8,
                      height_in_frames = 8
                    },
                    {
                      filename = "__escape-to-space__/graphics/entity/greenhouse/sprite/greenhouse-hr-animation-2.png",
                      width_in_frames = 8,
                      height_in_frames = 8
                    }
                  }
                },
                {
                  priority = "high",
                  width = 340,
                  height = 355,
                  frame_count = 128,
                  lines_per_file = 8,
                  animation_speed = 0.5,
                  draw_as_glow = false,
                  blend_mode = "normal",
                  shift = util.by_pixel(0, 0),
                  scale = 0.5,
                  stripes = {
                    {
                      filename = "__escape-to-space__/graphics/entity/greenhouse/sprite/greenhouse-hr-color1-1.png",
                      width_in_frames = 8,
                      height_in_frames = 8
                    },
                    {
                      filename = "__escape-to-space__/graphics/entity/greenhouse/sprite/greenhouse-hr-color1-2.png",
                      width_in_frames = 8,
                      height_in_frames = 8
                    }
                  }
                },
                {
                  priority = "high",
                  width = 340,
                  height = 355,
                  frame_count = 128,
                  lines_per_file = 8,
                  animation_speed = 0.5,
                  draw_as_glow = false,
                  blend_mode = "normal",
                  shift = util.by_pixel(0, 0),
                  scale = 0.5,
                  stripes = {
                    {
                      filename = "__escape-to-space__/graphics/entity/greenhouse/sprite/greenhouse-hr-color2-1.png",
                      width_in_frames = 8,
                      height_in_frames = 8
                    },
                    {
                      filename = "__escape-to-space__/graphics/entity/greenhouse/sprite/greenhouse-hr-color2-2.png",
                      width_in_frames = 8,
                      height_in_frames = 8
                    }
                  }
                },
                {
                  priority = "high",
                  width = 340,
                  height = 355,
                  frame_count = 128,
                  lines_per_file = 8,
                  animation_speed = 0.5,
                  draw_as_glow = false,
                  blend_mode = "normal",
                  shift = util.by_pixel(0, 0),
                  scale = 0.5,
                  stripes = {
                    {
                      filename = "__escape-to-space__/graphics/entity/greenhouse/sprite/greenhouse-hr-color3-1.png",
                      width_in_frames = 8,
                      height_in_frames = 8
                    },
                    {
                      filename = "__escape-to-space__/graphics/entity/greenhouse/sprite/greenhouse-hr-color3-2.png",
                      width_in_frames = 8,
                      height_in_frames = 8
                    }
                  }
                },
                {
                  priority = "high",
                  width = 340,
                  height = 355,
                  frame_count = 128,
                  lines_per_file = 8,
                  animation_speed = 0.5,
                  draw_as_glow = true,
                  blend_mode = "additive",
                  shift = util.by_pixel(0, 0),
                  scale = 0.5,
                  stripes = {
                    {
                      filename = "__escape-to-space__/graphics/entity/greenhouse/sprite/greenhouse-hr-emission-1.png",
                      width_in_frames = 8,
                      height_in_frames = 8
                    },
                    {
                      filename = "__escape-to-space__/graphics/entity/greenhouse/sprite/greenhouse-hr-emission-2.png",
                      width_in_frames = 8,
                      height_in_frames = 8
                    }
                  }
                },
                {
                    filename = "__escape-to-space__/graphics/entity/greenhouse/sprite/greenhouse-hr-shadow.png",
                    priority = "high",
                    width = 700,
                    height = 500,
                    frame_count = 1,
                    line_length = 1,
                    repeat_count = 128,         -- deve seguire il frame_count totale
                    draw_as_shadow = true,
                    animation_speed = 0.5,
                    shift = util.by_pixel(0, 0),
                    scale = 0.5
                },
            }
        }
    },
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_picture = util.empty_sprite(),
        pipe_covers = pipecoverspictures(),
        always_draw_covers = false,
        volume = 1000,
        pipe_connections = {{ flow_direction="input", direction = defines.direction.south, position = {-1, 2} }}
      },
      {
        production_type = "input",
        pipe_picture = util.empty_sprite(),
        pipe_covers = pipecoverspictures(),
        always_draw_covers = false,
        volume = 1000,
        pipe_connections = {{ flow_direction="input", direction = defines.direction.south, position = {1, 2} }}
      },
      {
        production_type = "output",
        pipe_picture = util.empty_sprite(),
        pipe_covers = pipecoverspictures(),
        always_draw_covers = false,
        volume = 100,
        pipe_connections = {{ flow_direction="output", direction = defines.direction.north, position = {-1, -2} }}
      },
      {
        production_type = "output",
        pipe_picture = util.empty_sprite(),
        pipe_covers = pipecoverspictures(),
        always_draw_covers = false,
        volume = 100,
        pipe_connections = {{ flow_direction="output", direction = defines.direction.north, position = {1, -2} }}
      }
    },
    fluid_boxes_off_when_no_fluid_recipe = true,
  },
  -- Solar panel mk2
  {
    type = "solar-panel",
    name = "solar-panel-mk2",
    icon = "__escape-to-space__/graphics/icons/solar-panel-mk2.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "solar-panel-mk2"},
    fast_replaceable_group = "solar-panel",
    max_health = 200,
    corpse = "solar-panel-remnants",
    dying_explosion = "solar-panel-explosion",
    collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    damaged_trigger_effect = data.raw["solar-panel"]["solar-panel"].damaged_trigger_effect,
    energy_source =
    {
      type = "electric",
      usage_priority = "solar"
    },
    picture =
    {
      layers =
      {
        {
          filename = "__escape-to-space__/graphics/entity/solar-panel/solar-panel-mk2.png",
          priority = "high",
          width = 230,
          height = 224,
          shift = util.by_pixel(-3, 3.5),
          scale = 0.5
        },
        {
          filename = "__escape-to-space__/graphics/entity/solar-panel/solar-panel-mk2-shadow.png",
          priority = "high",
          width = 220,
          height = 180,
          shift = util.by_pixel(9.5, 6),
          draw_as_shadow = true,
          scale = 0.5
        }
      }
    },
    overlay =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/solar-panel/solar-panel-shadow-overlay.png",
          priority = "high",
          width = 214,
          height = 180,
          shift = util.by_pixel(10.5, 6),
          scale = 0.5
        }
      }
    },
    impact_category = "glass",
    production = "180kW"
  },
  -- Solar panel mk3
  {
    type = "solar-panel",
    name = "solar-panel-mk3",
    icon = "__escape-to-space__/graphics/icons/solar-panel-mk3.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "solar-panel-mk3"},
    fast_replaceable_group = "solar-panel",
    max_health = 200,
    corpse = "solar-panel-remnants",
    dying_explosion = "solar-panel-explosion",
    collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    damaged_trigger_effect = data.raw["solar-panel"]["solar-panel"].damaged_trigger_effect,
    energy_source =
    {
      type = "electric",
      usage_priority = "solar"
    },
    picture =
    {
      layers =
      {
        {
          filename = "__escape-to-space__/graphics/entity/solar-panel/solar-panel-mk3.png",
          priority = "high",
          width = 230,
          height = 224,
          shift = util.by_pixel(-3, 3.5),
          scale = 0.5
        },
        {
          filename = "__escape-to-space__/graphics/entity/solar-panel/solar-panel-mk3-shadow.png",
          priority = "high",
          width = 220,
          height = 180,
          shift = util.by_pixel(9.5, 6),
          draw_as_shadow = true,
          scale = 0.5
        }
      }
    },
    overlay =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/solar-panel/solar-panel-shadow-overlay.png",
          priority = "high",
          width = 214,
          height = 180,
          shift = util.by_pixel(10.5, 6),
          scale = 0.5
        }
      }
    },
    impact_category = "glass",
    production = "360kW"
  },
  -- Arc furnace
  {
    type = "assembling-machine",
    name = "arc-furnace",
    icon = "__escape-to-space__/graphics/icons/arc-furnace.png",
    flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 0.2, result = "arc-furnace"},
    fast_replaceable_group = "arc-furnace",
    max_health = 350,
    corpse = "foundry-remnants",
    dying_explosion = "foundry-explosion",
    circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["foundry"],
    collision_box = {{-2.2, -2.2}, {2.2, 2.2}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    heating_energy = "250kW",
    damaged_trigger_effect = data.raw["assembling-machine"]["foundry"].damaged_trigger_effect,
    drawing_box_vertical_extension = 1.3,
    effect_receiver = { base_effect = { productivity = 0.25 }},
    module_slots = 4,
    icon_draw_specification = {scale = 2, shift = {0, -0.3}},
    icons_positioning =
    {
      {inventory_index = defines.inventory.assembling_machine_modules, shift = {0, 1.25}}
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"},
    crafting_categories = {"metallurgy", "pressing", "crafting-with-fluid-or-metallurgy", "metallurgy-or-assembling"},
    crafting_speed = 4,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 6 }
    },
    energy_usage = "2500kW",
    perceived_performance = {minimum = 0.25, maximum = 20},
    graphics_set = {
        animation = {
            layers = {
                {
                  filename = "__escape-to-space__/graphics/entity/arc-furnace/arc-furnace-hr-animation-1.png",
                  priority = "high",
                  width = 320,
                  height = 280,
                  frame_count = 50,
                  line_length = 7,
                  shift = util.by_pixel(0, 0),
                  scale = 0.5
                },
                {
                  filename = "__escape-to-space__/graphics/entity/arc-furnace/arc-furnace-hr-emission-1.png",
                  priority = "high",
                  width = 320,
                  height = 280,
                  frame_count = 50,
                  line_length = 7,
                  draw_as_glow = true,
                  blend_mode = "additive",
                  shift = util.by_pixel(0, 0),
                  scale = 0.5
                },
                {
                  filename = "__escape-to-space__/graphics/entity/arc-furnace/arc-furnace-hr-shadow.png",
                  priority = "high",
                  width = 600,
                  height = 400,
                  frame_count = 1,
                  line_length = 1,
                  repeat_count = 50,
                  draw_as_shadow = true,
                  shift = util.by_pixel(0, 0),
                  scale = 0.5
                },
            }
        }
    },
    open_sound = sounds.steam_open,
    close_sound = sounds.steam_close,
    working_sound =
    {
      sound =
      {
        filename = "__space-age__/sound/entity/foundry/foundry.ogg",
        volume = 0.5,
        audible_distance_modifier = 0.6
      },
      fade_in_ticks = 4,
      fade_out_ticks = 20,
      sound_accents =
      {
        {sound = {filename = "__space-age__/sound/entity/foundry/foundry-pipe-out.ogg", volume = 0.9, audible_distance_modifier = 0.4}, frame = 2},
        {sound = {filename = "__space-age__/sound/entity/foundry/foundry-slide-close.ogg", volume = 0.65, audible_distance_modifier = 0.3}, frame = 18},
        {sound = {filename = "__space-age__/sound/entity/foundry/foundry-clamp.ogg", volume = 0.45, audible_distance_modifier = 0.3}, frame = 39},
        {sound = {filename = "__space-age__/sound/entity/foundry/foundry-slide-stop.ogg", volume = 0.7, audible_distance_modifier = 0.4}, frame = 43},
        {sound = {variations = sound_variations("__space-age__/sound/entity/foundry/foundry-fire-whoosh", 3, 0.8), audible_distance_modifier = 0.3}, frame = 64},
        {sound = {filename = "__space-age__/sound/entity/foundry/foundry-metal-clunk.ogg", volume = 0.65, audible_distance_modifier = 0.4}, frame = 64},
        {sound = {filename = "__space-age__/sound/entity/foundry/foundry-slide-open.ogg", volume = 0.65, audible_distance_modifier = 0.3}, frame = 74},
        {sound = {filename = "__space-age__/sound/entity/foundry/foundry-pipe-in.ogg", volume = 0.75, audible_distance_modifier = 0.4}, frame = 106},
        {sound = {filename = "__space-age__/sound/entity/foundry/foundry-smoke-puff.ogg", volume = 0.8, audible_distance_modifier = 0.3}, frame = 106},
        {sound = {variations = sound_variations("__space-age__/sound/entity/foundry/foundry-pour", 2, 0.7)}, frame = 110},
        {sound = {filename = "__space-age__/sound/entity/foundry/foundry-rocks.ogg", volume = 0.65, audible_distance_modifier = 0.3}, frame = 120},
        {sound = {filename = "__space-age__/sound/entity/foundry/foundry-blade.ogg", volume = 0.7}, frame = 126},
      },
      max_sounds_per_prototype = 2
    },
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_picture = util.empty_sprite(),
        pipe_picture_frozen = require("__space-age__.prototypes.entity.foundry-pictures").pipe_picture_frozen,
        pipe_covers = pipecoverspictures(),
        always_draw_covers = false,
        volume = 1000,
        pipe_connections = {{ flow_direction="input", direction = defines.direction.south, position = {-1, 2} }}
      },
      {
        production_type = "input",
        pipe_picture = util.empty_sprite(),
        --pipe_picture_frozen = require("__space-age__.prototypes.entity.foundry-pictures").pipe_picture_frozen,
        pipe_covers = pipecoverspictures(),
        always_draw_covers = false,
        volume = 1000,
        pipe_connections = {{ flow_direction="input", direction = defines.direction.south, position = {1, 2} }}
      },
      {
        production_type = "output",
        pipe_picture = util.empty_sprite(),
        --pipe_picture_frozen = require("__space-age__.prototypes.entity.foundry-pictures").pipe_picture_frozen,
        pipe_covers = pipecoverspictures(),
        always_draw_covers = false,
        volume = 100,
        pipe_connections = {{ flow_direction="output", direction = defines.direction.north, position = {-1, -2} }}
      },
      {
        production_type = "output",
        pipe_picture = util.empty_sprite(),
        pipe_picture_frozen = require("__space-age__.prototypes.entity.foundry-pictures").pipe_picture_frozen,
        pipe_covers = pipecoverspictures(),
        always_draw_covers = false,
        volume = 100,
        pipe_connections = {{ flow_direction="output", direction = defines.direction.north, position = {1, -2} }}
      }
    },
    fluid_boxes_off_when_no_fluid_recipe = true,
    water_reflection =
    {
      pictures = util.sprite_load("__space-age__/graphics/entity/foundry/foundry-reflection",
      {
          scale = 5,
          shift = {0,2}
      }),
      rotate = false
    }
  },
})
