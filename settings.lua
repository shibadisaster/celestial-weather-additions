data:extend({
    {
        type = "bool-setting",
        name = "shibadisaster-cwe-enable-rubia-changes",
        setting_type = "startup",
        default_value = true,
        order = "a0"
    }
})

data:extend({
    {
        type = "double-setting",
        name = "shibadisaster-cwe-rubia-particle-speed",
        setting_type = "startup",
        default_value = 1.0,
        minimum_value = 0.1,
        maximum_value = 10.0,
        order = "a1"
    }
})

data:extend({
    {
        type = "bool-setting",
        name = "shibadisaster-cwe-enable-vesta-changes",
        setting_type = "startup",
        default_value = true,
        order = "b0"
    }
})

data:extend({
    {
        type = "color-setting",
        name = "shibadisaster-cwe-vesta-fog-color",
        setting_type = "startup",
        default_value = {0.682, 0.500, 0.635, 1.0},
        order = "b1"
    }
})

data:extend({
    {
        type = "color-setting",
        name = "shibadisaster-cwe-vesta-thick-cloud-color",
        setting_type = "startup",
        default_value = {0.839, 0.757, 0.824, 0.5},
        order = "b2"
    }
})

data:extend({
    {
        type = "color-setting",
        name = "shibadisaster-cwe-vesta-cloud-color",
        setting_type = "startup",
        default_value = {0.173, 0.173, 0.173, 0.086},
        order = "b3"
    }
})

data:extend({
    {
        type = "bool-setting",
        name = "shibadisaster-cwe-vesta-reduce-cloud-cover",
        setting_type = "startup",
        default_value = false,
        order = "b4"
    }
})

data:extend({
    {
        type = "double-setting",
        name = "shibadisaster-cwe-vesta-cloud-duration-multiplier",
        setting_type = "startup",
        default_value = 1.0,
        minimum_value = 0.1,
        maximum_value = 10.0,
        order = "b5"
    }
})

data:extend({
    {
        type = "bool-setting",
        name = "shibadisaster-cwe-enable-muria-changes",
        setting_type = "startup",
        default_value = true,
        order = "c0"
    }
})

data:extend({
    {
        type = "bool-setting",
        name = "shibadisaster-cwe-muria-enable-clouds",
        setting_type = "startup",
        default_value = true,
        order = "c1"
    }
})

data:extend({
    {
        type = "bool-setting",
        name = "shibadisaster-cwe-muria-enable-fog",
        setting_type = "startup",
        default_value = true,
        order = "c2"
    }
})

data:extend({
    {
        type = "bool-setting",
        name = "shibadisaster-cwe-muria-enable-spores",
        setting_type = "startup",
        default_value = true,
        order = "c3"
    }
})

data:extend({
    {
        type = "color-setting",
        name = "shibadisaster-cwe-muria-spore-color",
        setting_type = "startup",
        default_value = {0.83, 0.35, 0.52},
        order = "c4"
    }
})

data:extend({
    {
        type = "bool-setting",
        name = "shibadisaster-cwe-enable-paracelsin-changes",
        setting_type = "startup",
        default_value = true,
        order = "d0"
    }
})

data:extend({
    {
        type = "bool-setting",
        name = "shibadisaster-cwe-paracelsin-ash-snow",
        setting_type = "startup",
        default_value = true,
        order = "d1"
    }
})

data:extend({
    {
        type = "bool-setting",
        name = "shibadisaster-cwe-paracelsin-always-dark",
        setting_type = "startup",
        default_value = true,
        order = "d2"
    }
})