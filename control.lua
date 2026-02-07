local function modify_surface_visuals(surface)
    ------ PARACELSIN ------
    if surface.name == "paracelsin" then
        surface.daytime = 0.5
        surface.freeze_daytime = true
    end


    ------ RUBIA ------
    if surface.name == "rubia" then
        surface.wind_speed = 0.5
        surface.wind_orientation = 0.25
        surface.wind_orientation_change = 0.0
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