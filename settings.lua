-- TODO: make settings disappear when relevant mod isn't loaded

data:extend({
    {
        type = "bool-setting",
        name = "shibadisaster-cwa-enable-rubia-changes",
        setting_type = "startup",
        default_value = true,
        order = "a0"
    }
})

data:extend({
    {
        type = "double-setting",
        name = "shibadisaster-cwa-rubia-particle-speed",
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
        name = "shibadisaster-cwa-rubia-enable-clouds",
        setting_type = "startup",
        default_value = true,
        order = "a2"
    }
})

data:extend({
    {
        type = "bool-setting",
        name = "shibadisaster-cwa-rubia-enable-additional-dust",
        setting_type = "startup",
        default_value = true,
        order = "a3"
    }
})

data:extend({
    {
        type = "bool-setting",
        name = "shibadisaster-cwa-enable-vesta-changes",
        setting_type = "startup",
        default_value = true,
        order = "b0"
    }
})

data:extend({
    {
        type = "bool-setting",
        name = "shibadisaster-cwa-vesta-enable-fog",
        setting_type = "startup",
        default_value = true,
        order = "b1"
    }
})

data:extend({
    {
        type = "color-setting",
        name = "shibadisaster-cwa-vesta-fog-color",
        setting_type = "startup",
        default_value = {242.0/255.0, 189.0/255.0, 219.0/255.0, 1.0},
        order = "b2"
    }
})

data:extend({
    {
        type = "bool-setting",
        name = "shibadisaster-cwa-vesta-enable-thick-clouds",
        setting_type = "startup",
        default_value = true,
        order = "b3"
    }
})

data:extend({
    {
        type = "color-setting",
        name = "shibadisaster-cwa-vesta-thick-cloud-color",
        setting_type = "startup",
        default_value = {48.0/255.0, 48.0/255.0, 48.0/255.0, 255.0/255.0},
        order = "b4"
    }
})

data:extend({
    {
        type = "bool-setting",
        name = "shibadisaster-cwa-vesta-enable-clouds",
        setting_type = "startup",
        default_value = true,
        order = "b5"
    }
})

data:extend({
    {
        type = "color-setting",
        name = "shibadisaster-cwa-vesta-cloud-color",
        setting_type = "startup",
        default_value = {48.0/255.0, 48.0/255.0, 48.0/255.0, 255.0/255.0},
        order = "b6"
    }
})

data:extend({
    {
        type = "bool-setting",
        name = "shibadisaster-cwa-vesta-reduce-cloud-cover",
        setting_type = "startup",
        default_value = false,
        order = "b7"
    }
})

data:extend({
    {
        type = "double-setting",
        name = "shibadisaster-cwa-vesta-cloud-duration-multiplier",
        setting_type = "startup",
        default_value = 1.0,
        minimum_value = 0.1,
        maximum_value = 10.0,
        order = "b8"
    }
})

data:extend({
    {
        type = "bool-setting",
        name = "shibadisaster-cwa-enable-muria-changes",
        setting_type = "startup",
        default_value = true,
        order = "c0"
    }
})

data:extend({
    {
        type = "bool-setting",
        name = "shibadisaster-cwa-muria-enable-original-rain",
        setting_type = "startup",
        default_value = false,
        order = "c1"
    }
})

data:extend({
    {
        type = "bool-setting",
        name = "shibadisaster-cwa-muria-enable-clouds",
        setting_type = "startup",
        default_value = true,
        order = "c2"
    }
})

data:extend({
    {
        type = "color-setting",
        name = "shibadisaster-cwa-muria-cloud-color",
        setting_type = "startup",
        default_value = {8.0/255.0, 13.0/255.0, 2.0/255.0, 38.0/255.0},
        order = "c3"
    }
})

data:extend({
    {
        type = "bool-setting",
        name = "shibadisaster-cwa-muria-enable-fog",
        setting_type = "startup",
        default_value = true,
        order = "c4"
    }
})

data:extend({
    {
        type = "color-setting",
        name = "shibadisaster-cwa-muria-fog-color",
        setting_type = "startup",
        default_value = {126.0/255.0 * 0.5, 31.0/255.0 * 0.5, 91.0/255.0 * 0.5, 1.0 * 0.5},
        order = "c5"
    }
})

data:extend({
    {
        type = "bool-setting",
        name = "shibadisaster-cwa-muria-enable-spores",
        setting_type = "startup",
        default_value = true,
        order = "c6"
    }
})

data:extend({
    {
        type = "color-setting",
        name = "shibadisaster-cwa-muria-spore-color",
        setting_type = "startup",
        default_value = {0.83, 0.35, 0.52},
        order = "c7"
    }
})

data:extend({
    {
        type = "bool-setting",
        name = "shibadisaster-cwa-muria-enable-dust",
        setting_type = "startup",
        default_value = true,
        order = "c8"
    }
})

data:extend({
    {
        type = "bool-setting",
        name = "shibadisaster-cwa-enable-paracelsin-changes",
        setting_type = "startup",
        default_value = false,
        order = "d0"
    }
})

data:extend({
    {
        type = "bool-setting",
        name = "shibadisaster-cwa-paracelsin-ash-snow",
        setting_type = "startup",
        default_value = true,
        order = "d1"
    }
})

data:extend({
    {
        type = "bool-setting",
        name = "shibadisaster-cwa-paracelsin-always-dark",
        setting_type = "startup",
        default_value = true,
        order = "d2"
    }
})

data:extend({
    {
        type = "bool-setting",
        name = "shibadisaster-cwa-enable-cubium-changes",
        setting_type = "startup",
        default_value = true,
        order = "e0"
    }
})

data:extend({
    {
        type = "bool-setting",
        name = "shibadisaster-cwa-cubium-enable-clouds",
        setting_type = "startup",
        default_value = true,
        order = "e1"
    }
})

data:extend({
    {
        type = "bool-setting",
        name = "shibadisaster-cwa-cubium-enable-sparks",
        setting_type = "startup",
        default_value = true,
        order = "e2"
    }
})

data:extend({
    {
        type = "color-setting",
        name = "shibadisaster-cwa-cubium-sparks-color",
        setting_type = "startup",
        default_value = {47.0/255.0 * 1.0, 63.0/255.0 * 1.0, 119.0/255.0 * 1.0, 1.0 * 1.0},
        order = "e3"
    }
})

data:extend({
    {
        type = "bool-setting",
        name = "shibadisaster-cwa-enable-rabbasca-changes",
        setting_type = "startup",
        default_value = true,
        order = "f0"
    }
})

data:extend({
    {
        type = "bool-setting",
        name = "shibadisaster-cwa-rabbasca-enable-clouds",
        setting_type = "startup",
        default_value = true,
        order = "f1"
    }
})

data:extend({
    {
        type = "bool-setting",
        name = "shibadisaster-cwa-rabbasca-enable-sparks",
        setting_type = "startup",
        default_value = true,
        order = "f2"
    }
})

data:extend({
    {
        type = "color-setting",
        name = "shibadisaster-cwa-rabbasca-sparks-color",
        setting_type = "startup",
        default_value = {1.0, 0.5, 1.0},
        order = "f3"
    }
})

data:extend({
    {
        type = "bool-setting",
        name = "shibadisaster-cwa-rabbasca-enable-fog",
        setting_type = "startup",
        default_value = true,
        order = "f4"
    }
})

data:extend({
    {
        type = "bool-setting",
        name = "shibadisaster-cwa-rabbasca-enable-dust",
        setting_type = "startup",
        default_value = true,
        order = "f5"
    }
})

data:extend({
    {
        type = "bool-setting",
        name = "shibadisaster-cwa-enable-panglia-changes",
        setting_type = "startup",
        default_value = true,
        order = "g0"
    }
})

data:extend({
    {
        type = "bool-setting",
        name = "shibadisaster-cwa-panglia-enable-clouds",
        setting_type = "startup",
        default_value = true,
        order = "g1"
    }
})

data:extend({
    {
        type = "bool-setting",
        name = "shibadisaster-cwa-panglia-enable-sparks",
        setting_type = "startup",
        default_value = true,
        order = "g2"
    }
})

data:extend({
    {
        type = "bool-setting",
        name = "shibadisaster-cwa-panglia-enable-dust",
        setting_type = "startup",
        default_value = true,
        order = "g3"
    }
})

data:extend({
    {
        type = "bool-setting",
        name = "shibadisaster-cwa-enable-igrys-changes",
        setting_type = "startup",
        default_value = true,
        order = "h0"
    }
})

data:extend({
    {
        type = "bool-setting",
        name = "shibadisaster-cwa-igrys-enable-fog",
        setting_type = "startup",
        default_value = true,
        order = "h1"
    }
})

data:extend({
    {
        type = "color-setting",
        name = "shibadisaster-cwa-igrys-fog-color",
        setting_type = "startup",
        default_value = {1.0, 1.0, 1.0},
        order = "h2"
    }
})

data:extend({
    {
        type = "bool-setting",
        name = "shibadisaster-cwa-igrys-enable-clouds",
        setting_type = "startup",
        default_value = true,
        order = "h3"
    }
})

data:extend({
    {
        type = "bool-setting",
        name = "shibadisaster-cwa-igrys-enable-sparkles",
        setting_type = "startup",
        default_value = true,
        order = "h4"
    }
})

data:extend({
    {
        type = "color-setting",
        name = "shibadisaster-cwa-igrys-sparkles-color",
        setting_type = "startup",
        default_value = {1.0, 0.75, 0.5},
        order = "h5"
    }
})

data:extend({
    {
        type = "bool-setting",
        name = "shibadisaster-cwa-igrys-enable-dust",
        setting_type = "startup",
        default_value = true,
        order = "h6"
    }
})

data:extend({
    {
        type = "bool-setting",
        name = "shibadisaster-cwa-enable-khemia-changes",
        setting_type = "startup",
        default_value = true,
        order = "i0"
    }
})

data:extend({
    {
        type = "bool-setting",
        name = "shibadisaster-cwa-khemia-enable-clouds",
        setting_type = "startup",
        default_value = true,
        order = "i1"
    }
})

data:extend({
    {
        type = "bool-setting",
        name = "shibadisaster-cwa-khemia-enable-sparkles",
        setting_type = "startup",
        default_value = true,
        order = "i2"
    }
})

data:extend({
    {
        type = "color-setting",
        name = "shibadisaster-cwa-khemia-sparkles-color",
        setting_type = "startup",
        default_value = {1.0, 0.25, 0.5},
        order = "i3"
    }
})

data:extend({
    {
        type = "bool-setting",
        name = "shibadisaster-cwa-khemia-enable-fog",
        setting_type = "startup",
        default_value = true,
        order = "i4"
    }
})

data:extend({
    {
        type = "color-setting",
        name = "shibadisaster-cwa-khemia-fog-color",
        setting_type = "startup",
        default_value = {255.0/255.0, 191.0/255.0, 221.0/255.0},
        order = "i5"
    }
})

data:extend({
    {
        type = "bool-setting",
        name = "shibadisaster-cwa-khemia-enable-dust",
        setting_type = "startup",
        default_value = true,
        order = "i6"
    }
})

data:extend({
    {
        type = "bool-setting",
        name = "shibadisaster-cwa-enable-pelagos-changes",
        setting_type = "startup",
        default_value = true,
        order = "j0"
    }
})

data:extend({
    {
        type = "bool-setting",
        name = "shibadisaster-cwa-pelagos-enable-tropical-recolor",
        setting_type = "startup",
        default_value = false,
        order = "j1"
    }
})

data:extend({
    {
        type = "bool-setting",
        name = "shibadisaster-cwa-pelagos-enable-clouds",
        setting_type = "startup",
        default_value = true,
        order = "j2"
    }
})

data:extend({
    {
        type = "bool-setting",
        name = "shibadisaster-cwa-pelagos-enable-water-ripples",
        setting_type = "startup",
        default_value = true,
        order = "j3"
    }
})

data:extend({
    {
        type = "bool-setting",
        name = "shibadisaster-cwa-pelagos-larger-water-ripples",
        setting_type = "startup",
        default_value = false,
        order = "j4"
    }
})