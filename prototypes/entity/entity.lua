-- entity.lua

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
        type = "furnace",
        name = "cybernetics-facility",
        icon = "__escape-to-space__/graphics/icons/cybernetics-facility-icon.png",
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {mining_time = 0.2, result = "cybernetics-facility"},
        fast_replaceable_group = "furnace",
        circuit_wire_max_distance = furnace_circuit_wire_max_distance,
        circuit_connector = circuit_connector_definitions["basic-electric-furnace"],
        max_health = 350,
        corpse = "basic-electric-furnace-remnants",
        dying_explosion = data.raw["furnace"]["electric-furnace"].dying_explosion,
        resistances = {
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
        icons_positioning = {
            {
                inventory_index = defines.inventory.furnace_modules, shift = {0, 0.8}
            }
        },
        allowed_effects = {"consumption", "speed", "productivity", "quality"},
        crafting_categories = {"bottling"},
        result_inventory_size = 1,
        crafting_speed = 1,
        energy_usage = "1000kW",
        source_inventory_size = 1,
        energy_source = {
            type = "electric",
            usage_priority = "secondary-input",
        }
    },
})