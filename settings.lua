-- settings

data:extend({
    {
        type = "string-setting",
        name = "arrow-style",
        order = "a",
        setting_type = "startup",
        default_value = "line-thin",
        allowed_values = { "arrows", "arrow", "arrow-doubled", "arrow-quadrupled", "no-arrows", "line-thick", "line-thin", "line-side" }
    },
    {
        type = "string-setting",
        name = "rail-style",
        order = "b",
        setting_type = "startup",
        default_value = "colored",
        allowed_values = { "vanilla", "ir3-alt", "colored" }
    },
    {
        type = "bool-setting",
        name = "arrow-glow",
        order = "c",
        setting_type = "startup",
        default_value = false
    },
    {
        type = "bool-setting",
        name = "rail-glow",
        order = "d",
        setting_type = "startup",
        default_value = false
    },
    -- {
    --     type = "bool-setting",
    --     name = "thick-turbo-arrows",
    --     order = "e",
    --     setting_type = "startup",
    --     default_value = false
    -- },
})