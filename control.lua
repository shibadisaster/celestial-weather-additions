local function modify_surface_visuals(surface)
    ------ PARACELSIN ------
    if surface.name == "paracelsin" then
        if settings.startup["shibadisaster-cwa-paracelsin-always-dark"].value and settings.startup["shibadisaster-cwa-enable-paracelsin-changes"].value then
            surface.daytime = 0.5
            surface.freeze_daytime = true
        end
    end


    ------ RUBIA ------
    if surface.name == "rubia" then
        if settings.startup["shibadisaster-cwa-enable-rubia-changes"].value then
            surface.wind_speed = 0.5
            surface.wind_orientation = 0.25
            surface.wind_orientation_change = 0.0
        end
    end
end


-- modify existing planets on load/save creation
script.on_init(function()
    for _, surface in pairs(game.surfaces) do
        modify_surface_visuals(surface)
    end
end)

-- modify surfaces that get created
script.on_event(defines.events.on_surface_created, function(event)
    local surface = game.surfaces[event.surface_index]
    modify_surface_visuals(surface)
end)

-- modify surfaces every 5 seconds (todo: on save loading?)
script.on_nth_tick(300, function()
    for _, surface in pairs(game.surfaces) do
        modify_surface_visuals(surface)
    end
end)