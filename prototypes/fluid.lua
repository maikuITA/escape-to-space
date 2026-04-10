-- fluid.lua

data:extend({
    {
    type = "fluid",
    name = "t-one-fluid",
    subgroup = "fluid",
    default_temperature = 25,
    max_temperature = 100,
    base_color = {r = 0.73, g = 0, b = 0.04},
    flow_color = {r = 0.73, g = 0, b = 0.04},
    icon = "__escape-to-space__/graphics/icons/fluid/t-one-fluid.png",
    icon_size = 64,
    auto_barrel = true,
    order = "a[fluid]-b[t-one-fluid]"
  },
  {
    type = "fluid",
    name = "t-two-fluid",
    subgroup = "fluid",
    default_temperature = 25,
    max_temperature = 100,
    base_color = {r = 0.4, g = 0.1451, b = 0.9137},
    flow_color = {r = 0.4, g = 0.1451, b = 0.9137},
    icon = "__escape-to-space__/graphics/icons/fluid/t-two-fluid.png",
    icon_size = 64,
    auto_barrel = true,
    order = "a[fluid]-b[t-two-fluid]"
  }
})