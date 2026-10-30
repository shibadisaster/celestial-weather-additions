-- TODO: make settings disappear when relevant mod isn't loaded
if mods["rubia"] then
    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-enable-rubia-changes",
            setting_type = "startup",
            default_value = true,
            order = "rubia0"
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
            order = "rubia1"
        }
    })

    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-rubia-enable-clouds",
            setting_type = "startup",
            default_value = true,
            order = "rubia2"
        }
    })

    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-rubia-enable-additional-dust",
            setting_type = "startup",
            default_value = true,
            order = "rubia3"
        }
    })
end


if mods["skewer_planet_vesta"] then
    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-enable-vesta-changes",
            setting_type = "startup",
            default_value = true,
            order = "vesta0"
        }
    })

    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-vesta-enable-fog",
            setting_type = "startup",
            default_value = true,
            order = "vesta1"
        }
    })

    data:extend({
        {
            type = "color-setting",
            name = "shibadisaster-cwa-vesta-fog-color",
            setting_type = "startup",
            default_value = {242.0/255.0, 189.0/255.0, 219.0/255.0, 1.0},
            order = "vesta2"
        }
    })

    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-vesta-enable-thick-clouds",
            setting_type = "startup",
            default_value = true,
            order = "vesta3"
        }
    })

    data:extend({
        {
            type = "color-setting",
            name = "shibadisaster-cwa-vesta-thick-cloud-color",
            setting_type = "startup",
            default_value = {48.0/255.0, 48.0/255.0, 48.0/255.0, 255.0/255.0},
            order = "vesta4"
        }
    })

    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-vesta-enable-clouds",
            setting_type = "startup",
            default_value = true,
            order = "vesta5"
        }
    })

    data:extend({
        {
            type = "color-setting",
            name = "shibadisaster-cwa-vesta-cloud-color",
            setting_type = "startup",
            default_value = {48.0/255.0, 48.0/255.0, 48.0/255.0, 255.0/255.0},
            order = "vesta6"
        }
    })

    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-vesta-reduce-cloud-cover",
            setting_type = "startup",
            default_value = false,
            order = "vesta7"
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
            order = "vesta8"
        }
    })
end


if mods["Muria"] then
    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-enable-muria-changes",
            setting_type = "startup",
            default_value = true,
            order = "muria0"
        }
    })

    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-muria-enable-original-rain",
            setting_type = "startup",
            default_value = false,
            order = "muria1"
        }
    })

    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-muria-enable-clouds",
            setting_type = "startup",
            default_value = true,
            order = "muria2"
        }
    })

    data:extend({
        {
            type = "color-setting",
            name = "shibadisaster-cwa-muria-cloud-color",
            setting_type = "startup",
            default_value = {8.0/255.0, 13.0/255.0, 2.0/255.0, 38.0/255.0},
            order = "muria3"
        }
    })

    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-muria-enable-fog",
            setting_type = "startup",
            default_value = true,
            order = "muria4"
        }
    })

    data:extend({
        {
            type = "color-setting",
            name = "shibadisaster-cwa-muria-fog-color",
            setting_type = "startup",
            default_value = {126.0/255.0 * 0.5, 31.0/255.0 * 0.5, 91.0/255.0 * 0.5, 1.0 * 0.5},
            order = "muria5"
        }
    })

    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-muria-enable-spores",
            setting_type = "startup",
            default_value = true,
            order = "muria6"
        }
    })

    data:extend({
        {
            type = "color-setting",
            name = "shibadisaster-cwa-muria-spore-color",
            setting_type = "startup",
            default_value = {0.83, 0.35, 0.52},
            order = "muria7"
        }
    })

    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-muria-enable-dust",
            setting_type = "startup",
            default_value = true,
            order = "muria8"
        }
    })
end


if mods["Paracelsin"] then
    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-enable-paracelsin-changes",
            setting_type = "startup",
            default_value = true,
            order = "paracelsin0"
        }
    })

    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-paracelsin-ash-snow",
            setting_type = "startup",
            default_value = true,
            order = "paracelsin1"
        }
    })

    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-paracelsin-remove-original-snow-effect",
            setting_type = "startup",
            default_value = false,
            order = "paracelsin2"
        }
    })

    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-paracelsin-always-dark",
            setting_type = "startup",
            default_value = true,
            order = "paracelsin3"
        }
    })
end


if mods["cubium"] then
    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-enable-cubium-changes",
            setting_type = "startup",
            default_value = true,
            order = "cubium0"
        }
    })

    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-cubium-enable-clouds",
            setting_type = "startup",
            default_value = true,
            order = "cubium1"
        }
    })

    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-cubium-enable-sparks",
            setting_type = "startup",
            default_value = true,
            order = "cubium2"
        }
    })

    data:extend({
        {
            type = "color-setting",
            name = "shibadisaster-cwa-cubium-sparks-color",
            setting_type = "startup",
            default_value = {47.0/255.0 * 1.0, 63.0/255.0 * 1.0, 119.0/255.0 * 1.0, 1.0 * 1.0},
            order = "cubium3"
        }
    })
end


if mods["planet-rabbasca"] then
    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-enable-rabbasca-changes",
            setting_type = "startup",
            default_value = true,
            order = "rabbasca0"
        }
    })

    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-rabbasca-enable-clouds",
            setting_type = "startup",
            default_value = true,
            order = "rabbasca1"
        }
    })

    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-rabbasca-enable-sparks",
            setting_type = "startup",
            default_value = true,
            order = "rabbasca2"
        }
    })

    data:extend({
        {
            type = "color-setting",
            name = "shibadisaster-cwa-rabbasca-sparks-color",
            setting_type = "startup",
            default_value = {1.0, 0.5, 1.0},
            order = "rabbasca3"
        }
    })

    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-rabbasca-enable-fog",
            setting_type = "startup",
            default_value = true,
            order = "rabbasca4"
        }
    })

    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-rabbasca-enable-dust",
            setting_type = "startup",
            default_value = true,
            order = "rabbasca5"
        }
    })
end


if mods["panglia_planet"] then
    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-enable-panglia-changes",
            setting_type = "startup",
            default_value = true,
            order = "panglia0"
        }
    })

    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-panglia-enable-clouds",
            setting_type = "startup",
            default_value = true,
            order = "panglia1"
        }
    })

    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-panglia-enable-sparks",
            setting_type = "startup",
            default_value = true,
            order = "panglia2"
        }
    })

    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-panglia-enable-dust",
            setting_type = "startup",
            default_value = true,
            order = "panglia3"
        }
    })

    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-panglia-enable-antilinear-fog",
            setting_type = "startup",
            default_value = true,
            order = "panglia4"
        }
    })

    data:extend({
        {
            type = "color-setting",
            name = "shibadisaster-cwa-panglia-antilinear-fog-color",
            setting_type = "startup",
            default_value = {191.0/255.0, 191.0/255.0, 255.0/255.0},
            order = "panglia5"
        }
    })

    data:extend({
        {
            type = "double-setting",
            name = "shibadisaster-cwa-panglia-antilinear-fog-speed-multiplier",
            setting_type = "startup",
            default_value = 1.0,
            order = "panglia6"
        }
    })
end


if mods["Igrys"] then
    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-enable-igrys-changes",
            setting_type = "startup",
            default_value = true,
            order = "igrys0"
        }
    })

    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-igrys-enable-fog",
            setting_type = "startup",
            default_value = true,
            order = "igrys1"
        }
    })

    data:extend({
        {
            type = "color-setting",
            name = "shibadisaster-cwa-igrys-fog-color",
            setting_type = "startup",
            default_value = {1.0, 1.0, 1.0},
            order = "igrys2"
        }
    })

    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-igrys-enable-clouds",
            setting_type = "startup",
            default_value = true,
            order = "igrys3"
        }
    })

    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-igrys-enable-sparkles",
            setting_type = "startup",
            default_value = true,
            order = "igrys4"
        }
    })

    data:extend({
        {
            type = "color-setting",
            name = "shibadisaster-cwa-igrys-sparkles-color",
            setting_type = "startup",
            default_value = {1.0, 0.75, 0.5},
            order = "igrys5"
        }
    })

    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-igrys-enable-dust",
            setting_type = "startup",
            default_value = true,
            order = "igrys6"
        }
    })
end


if mods["alchemy-khemia"] then
    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-enable-khemia-changes",
            setting_type = "startup",
            default_value = true,
            order = "khemia0"
        }
    })

    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-khemia-enable-clouds",
            setting_type = "startup",
            default_value = true,
            order = "khemia1"
        }
    })

    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-khemia-enable-sparkles",
            setting_type = "startup",
            default_value = true,
            order = "khemia2"
        }
    })

    data:extend({
        {
            type = "color-setting",
            name = "shibadisaster-cwa-khemia-sparkles-color",
            setting_type = "startup",
            default_value = {1.0, 0.25, 0.5},
            order = "khemia3"
        }
    })

    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-khemia-enable-fog",
            setting_type = "startup",
            default_value = true,
            order = "khemia4"
        }
    })

    data:extend({
        {
            type = "color-setting",
            name = "shibadisaster-cwa-khemia-fog-color",
            setting_type = "startup",
            default_value = {255.0/255.0, 191.0/255.0, 221.0/255.0},
            order = "khemia5"
        }
    })

    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-khemia-enable-dust",
            setting_type = "startup",
            default_value = true,
            order = "khemia6"
        }
    })
end


if mods["pelagos"] then
    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-enable-pelagos-changes",
            setting_type = "startup",
            default_value = true,
            order = "pelagos0"
        }
    })

    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-pelagos-enable-tropical-recolor",
            setting_type = "startup",
            default_value = false,
            order = "pelagos1"
        }
    })

    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-pelagos-enable-clouds",
            setting_type = "startup",
            default_value = true,
            order = "pelagos2"
        }
    })

    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-pelagos-enable-water-ripples",
            setting_type = "startup",
            default_value = true,
            order = "pelagos3"
        }
    })

    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-pelagos-larger-water-ripples",
            setting_type = "startup",
            default_value = false,
            order = "pelagos4"
        }
    })
end


if mods["carna"] then
    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-enable-carna-changes",
            setting_type = "startup",
            default_value = true,
            order = "carna0"
        }
    })

    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-carna-enable-plasma-fog",
            setting_type = "startup",
            default_value = true,
            order = "carna1"
        }
    })

    data:extend({
        {
            type = "color-setting",
            name = "shibadisaster-cwa-carna-plasma-fog-color-1",
            setting_type = "startup",
            default_value = {0.0/255.0, 127.0/255.0, 63.0/255.0},
            order = "carna2"
        }
    })

    data:extend({
        {
            type = "color-setting",
            name = "shibadisaster-cwa-carna-plasma-fog-color-2",
            setting_type = "startup",
            default_value = {0.0/255.0, 117.0/255.0, 58.0/255.0},
            order = "carna3"
        }
    })

    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-carna-enable-sparks",
            setting_type = "startup",
            default_value = true,
            order = "carna4"
        }
    })
end

if true then
    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-enable-vulcanus-changes",
            setting_type = "startup",
            default_value = true,
            order = "vulcanus0"
        }
    })

    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-vulcanus-enable-ash",
            setting_type = "startup",
            default_value = true,
            order = "vulcanus1"
        }
    })

    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-vulcanus-enable-fog",
            setting_type = "startup",
            default_value = true,
            order = "vulcanus2"
        }
    })

    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-vulcanus-enable-rain",
            setting_type = "startup",
            default_value = true,
            order = "vulcanus3"
        }
    })

    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-vulcanus-enable-rain-sounds",
            setting_type = "startup",
            default_value = true,
            order = "vulcanus4"
        }
    })

    data:extend({
        {
            type = "double-setting",
            name = "shibadisaster-cwa-vulcanus-rain-speed-multiplier",
            setting_type = "startup",
            default_value = 1.0,
            order = "vulcanus5"
        }
    })

    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-vulcanus-enable-fire",
            setting_type = "startup",
            default_value = true,
            order = "vulcanus6"
        }
    })

    data:extend({
        {
            type = "double-setting",
            name = "shibadisaster-cwa-vulcanus-fire-particle-speed-multiplier",
            setting_type = "startup",
            default_value = 1.0,
            order = "vulcanus7"
        }
    })
end

if true then
    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-enable-fulgora-changes",
            setting_type = "startup",
            default_value = true,
            order = "fulgora0"
        }
    })

    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-fulgora-enable-sand",
            setting_type = "startup",
            default_value = true,
            order = "fulgora1"
        }
    })

    data:extend({
        {
            type = "color-setting",
            name = "shibadisaster-cwa-fulgora-sand-color",
            setting_type = "startup",
            default_value = {0.651, 0.463, 0.435},
            order = "fulgora2"
        }
    })

    data:extend({
        {
            type = "int-setting",
            name = "shibadisaster-cwa-fulgora-sand-particle-amount",
            setting_type = "startup",
            default_value = 3,
            order = "fulgora3"
        }
    })

    data:extend({
        {
            type = "double-setting",
            name = "shibadisaster-cwa-fulgora-sand-speed-multiplier",
            setting_type = "startup",
            default_value = 1.0,
            order = "fulgora4"
        }
    })

    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-fulgora-enable-fog",
            setting_type = "startup",
            default_value = true,
            order = "fulgora5"
        }
    })
end

if true then
    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-enable-aquilo-changes",
            setting_type = "startup",
            default_value = true,
            order = "aquilo0"
        }
    })

    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-aquilo-enable-heavy-snow",
            setting_type = "startup",
            default_value = true,
            order = "aquilo1"
        }
    })

    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-aquilo-heavy-snow-overwrite-original",
            setting_type = "startup",
            default_value = false,
            order = "aquilo2"
        }
    })

    data:extend({
        {
            type = "int-setting",
            name = "shibadisaster-cwa-aquilo-heavy-snow-particle-amount",
            setting_type = "startup",
            default_value = 10,
            order = "aquilo3"
        }
    })


    data:extend({
        {
            type = "double-setting",
            name = "shibadisaster-cwa-aquilo-heavy-snow-speed-multiplier",
            setting_type = "startup",
            default_value = 1.0,
            order = "aquilo4"
        }
    })

    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-aquilo-enable-fog",
            setting_type = "startup",
            default_value = true,
            order = "aquilo5"
        }
    })
end

if mods["planet-muluna"] then
    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-enable-muluna-changes",
            setting_type = "startup",
            default_value = true,
            order = "muluna0"
        }
    })

    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-muluna-enable-dust",
            setting_type = "startup",
            default_value = true,
            order = "muluna1"
        }
    })

    data:extend({
        {
            type = "int-setting",
            name = "shibadisaster-cwa-muluna-dust-particle-amount",
            setting_type = "startup",
            default_value = 2,
            order = "muluna2"
        }
    })

    data:extend({
        {
            type = "double-setting",
            name = "shibadisaster-cwa-muluna-dust-speed-multiplier",
            setting_type = "startup",
            default_value = 1.0,
            order = "muluna3"
        }
    })
end

if mods["Moshine"] then
    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-enable-moshine-changes",
            setting_type = "startup",
            default_value = true,
            order = "moshine0"
        }
    })

    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-moshine-enable-sand",
            setting_type = "startup",
            default_value = true,
            order = "moshine0"
        }
    })

    data:extend({
        {
            type = "int-setting",
            name = "shibadisaster-cwa-moshine-sand-particle-amount",
            setting_type = "startup",
            default_value = 2,
            order = "moshine1"
        }
    })

    data:extend({
        {
            type = "double-setting",
            name = "shibadisaster-cwa-moshine-sand-speed-multiplier",
            setting_type = "startup",
            default_value = 1.0,
            order = "moshine2"
        }
    })

    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-moshine-enable-fire",
            setting_type = "startup",
            default_value = true,
            order = "moshine3"
        }
    })

    data:extend({
        {
            type = "color-setting",
            name = "shibadisaster-cwa-moshine-fire-color",
            setting_type = "startup",
            default_value = {1.0, 0.5, 0.25},
            order = "moshine4"
        }
    })

    data:extend({
        {
            type = "double-setting",
            name = "shibadisaster-cwa-moshine-fire-speed-multiplier",
            setting_type = "startup",
            default_value = 1.0,
            order = "moshine5"
        }
    })

    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-moshine-enable-fog",
            setting_type = "startup",
            default_value = true,
            order = "moshine6"
        }
    })
end

if mods["corrundum"] then
    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-enable-corrundum-changes",
            setting_type = "startup",
            default_value = true,
            order = "corrundum0"
        }
    })

    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-corrundum-enable-sand",
            setting_type = "startup",
            default_value = true,
            order = "corrundum1"
        }
    })

    data:extend({
        {
            type = "int-setting",
            name = "shibadisaster-cwa-corrundum-sand-particle-amount",
            setting_type = "startup",
            default_value = 8,
            order = "corrundum2"
        }
    })

    data:extend({
        {
            type = "double-setting",
            name = "shibadisaster-cwa-corrundum-sand-speed-multiplier",
            setting_type = "startup",
            default_value = 1.2,
            order = "corrundum3"
        }
    })

    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-corrundum-enable-rain",
            setting_type = "startup",
            default_value = true,
            order = "corrundum4"
        }
    })

    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-corrundum-rain-enable-sounds",
            setting_type = "startup",
            default_value = true,
            order = "corrundum5"
        }
    })

    data:extend({
        {
            type = "double-setting",
            name = "shibadisaster-cwa-corrundum-rain-speed-multiplier",
            setting_type = "startup",
            default_value = 2.0,
            order = "corrundum6"
        }
    })

    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-corrundum-enable-fog",
            setting_type = "startup",
            default_value = true,
            order = "corrundum7"
        }
    })
end

if mods["secretas"] then
    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-enable-frozeta-changes",
            setting_type = "startup",
            default_value = true,
            order = "frozeta0"
        }
    })

    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-frozeta-enable-heavy-snow",
            setting_type = "startup",
            default_value = true,
            order = "frozeta1"
        }
    })

    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-frozeta-heavy-snow-overwrite-original",
            setting_type = "startup",
            default_value = true,
            order = "frozeta2"
        }
    })

    data:extend({
        {
            type = "int-setting",
            name = "shibadisaster-cwa-frozeta-heavy-snow-particle-amount",
            setting_type = "startup",
            default_value = 20,
            order = "frozeta3"
        }
    })


    data:extend({
        {
            type = "double-setting",
            name = "shibadisaster-cwa-frozeta-heavy-snow-speed-multiplier",
            setting_type = "startup",
            default_value = 1.0,
            order = "frozeta4"
        }
    })

    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-frozeta-enable-fog",
            setting_type = "startup",
            default_value = true,
            order = "frozeta5"
        }
    })
end

if mods["dea-dia-system"] then
    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-enable-lemures-changes",
            setting_type = "startup",
            default_value = true,
            order = "lemures0"
        }
    })

        data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-lemures-enable-heavy-snow",
            setting_type = "startup",
            default_value = true,
            order = "lemures1"
        }
    })

    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-lemures-heavy-snow-overwrite-original",
            setting_type = "startup",
            default_value = true,
            order = "lemures2"
        }
    })

    data:extend({
        {
            type = "int-setting",
            name = "shibadisaster-cwa-lemures-heavy-snow-particle-amount",
            setting_type = "startup",
            default_value = 80,
            order = "lemures3"
        }
    })


    data:extend({
        {
            type = "double-setting",
            name = "shibadisaster-cwa-lemures-heavy-snow-speed-multiplier",
            setting_type = "startup",
            default_value = 0.9,
            order = "lemures4"
        }
    })

    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-lemures-enable-fog",
            setting_type = "startup",
            default_value = true,
            order = "lemures5"
        }
    })
end

if mods["metal-and-stars"] then
    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-enable-nix-changes",
            setting_type = "startup",
            default_value = true,
            order = "nix0"
        }
    })

    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-nix-enable-heavy-snow",
            setting_type = "startup",
            default_value = true,
            order = "nix1"
        }
    })

    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-nix-heavy-snow-overwrite-original",
            setting_type = "startup",
            default_value = true,
            order = "nix2"
        }
    })

    data:extend({
        {
            type = "int-setting",
            name = "shibadisaster-cwa-nix-heavy-snow-particle-amount",
            setting_type = "startup",
            default_value = 60,
            order = "nix3"
        }
    })


    data:extend({
        {
            type = "double-setting",
            name = "shibadisaster-cwa-nix-heavy-snow-speed-multiplier",
            setting_type = "startup",
            default_value = 1.0,
            order = "nix4"
        }
    })

    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-nix-enable-fog",
            setting_type = "startup",
            default_value = true,
            order = "nix5"
        }
    })
end

if mods["lignumis"] then
    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-enable-lignumis-changes",
            setting_type = "startup",
            default_value = true,
            order = "lignumis0"
        }
    })

    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-lignumis-enable-rain",
            setting_type = "startup",
            default_value = true,
            order = "lignumis1"
        }
    })

    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-lignumis-rain-enable-sounds",
            setting_type = "startup",
            default_value = true,
            order = "lignumis2"
        }
    })

    data:extend({
        {
            type = "double-setting",
            name = "shibadisaster-cwa-lignumis-rain-speed-multiplier",
            setting_type = "startup",
            default_value = 1.0,
            order = "lignumis3"
        }
    })

    data:extend({
        {
            type = "bool-setting",
            name = "shibadisaster-cwa-lignumis-enable-fog",
            setting_type = "startup",
            default_value = true,
            order = "lignumis4"
        }
    })
end