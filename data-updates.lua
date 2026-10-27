-- Most code here adapted from Celestial Weather mod by Varaxia!
-- PLEASE REPORT ANY CRASHES TO ME BECAUSE IT'S PROBABLY DUE TO ONE OF THESE UPDATING

-- nested so we can potentially hide settings when the corresponding mod is disabled without crashing
if mods["rubia"] then
    if settings.startup["shibadisaster-cwa-enable-rubia-changes"].value then
        require("__celestial-weather-additions__.weather.rubia")
    end
end

if mods["skewer_planet_vesta"] then
    if settings.startup["shibadisaster-cwa-enable-vesta-changes"].value then
        require("__celestial-weather-additions__.weather.vesta")
    end
end

if mods["Muria"] then
    if settings.startup["shibadisaster-cwa-enable-muria-changes"].value then
        require("__celestial-weather-additions__.weather.muria")
    end
end

if mods["Paracelsin"] then
    if settings.startup["shibadisaster-cwa-enable-paracelsin-changes"].value then
        require("__celestial-weather-additions__.weather.paracelsin")
    end
end

if mods["planet-rabbasca"] then
    if settings.startup["shibadisaster-cwa-enable-rabbasca-changes"].value then
        require("__celestial-weather-additions__.weather.rabbasca")
    end
end

if mods["cubium"] then
    if settings.startup["shibadisaster-cwa-enable-cubium-changes"].value then
        require("__celestial-weather-additions__.weather.cubium")
    end
end

if mods["Igrys"] then
    if settings.startup["shibadisaster-cwa-enable-igrys-changes"].value then
        require("__celestial-weather-additions__.weather.igrys")
    end
end

if mods["alchemy-khemia"] then
    if settings.startup["shibadisaster-cwa-enable-khemia-changes"].value then
        require("__celestial-weather-additions__.weather.khemia")
    end
end

if mods["panglia_planet"] then
    if settings.startup["shibadisaster-cwa-enable-panglia-changes"].value then
        require("__celestial-weather-additions__.weather.panglia")
    end
end

if mods["pelagos"] then
    if settings.startup["shibadisaster-cwa-enable-pelagos-changes"].value then
        require("__celestial-weather-additions__.weather.pelagos")
    end
end

if mods["carna"] then 
    if settings.startup["shibadisaster-cwa-enable-carna-changes"].value then
        require("__celestial-weather-additions__.weather.carna") -- still wip!
    end
end


----- OG CELESTIAL WEATHER EFFECTS -----
if true then
    if settings.startup["shibadisaster-cwa-enable-vulcanus-changes"].value then
        require("__celestial-weather-additions__.weather.vulcanus")
    end
end

if true then
    if settings.startup["shibadisaster-cwa-enable-fulgora-changes"].value then
        require("__celestial-weather-additions__.weather.fulgora")
    end
end

-- not this one
-- if true then
--     if settings.startup["shibadisaster-cwa-enable-gleba-changes"].value then
--         require("__celestial-weather-additions__.weather.gleba")
--     end
-- end

if true then
    if settings.startup["shibadisaster-cwa-enable-aquilo-changes"].value then
        require("__celestial-weather-additions__.weather.aquilo")
    end
end

if mods["planet-muluna"] then
    if settings.startup["shibadisaster-cwa-enable-muluna-changes"].value then
        require("__celestial-weather-additions__.weather.muluna")
    end
end

if mods["Moshine"] then
    if settings.startup["shibadisaster-cwa-enable-moshine-changes"].value then
        require("__celestial-weather-additions__.weather.moshine")
    end
end

if mods["corrundum"] then
    if settings.startup["shibadisaster-cwa-enable-corrundum-changes"].value then
        require("__celestial-weather-additions__.weather.corrundum")
    end
end

if mods["secretas"] then
    if settings.startup["shibadisaster-cwa-enable-frozeta-changes"].value then
        require("__celestial-weather-additions__.weather.frozeta")
    end
end

if mods["dea-dia-system"] then
    if settings.startup["shibadisaster-cwa-enable-lemures-changes"].value then
        require("__celestial-weather-additions__.weather.lemures")
    end
end

if mods["metal-and-stars"] then
    if settings.startup["shibadisaster-cwa-enable-nix-changes"].value then
        require("__celestial-weather-additions__.weather.nix")
    end
end

if mods["lignumis"] then
    if settings.startup["shibadisaster-cwa-enable-lignumis-changes"].value then
        require("__celestial-weather-additions__.weather.lignumis")
    end
end