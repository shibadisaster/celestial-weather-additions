local common_effects = require("common.common-effects")

ni_effects = {data.raw["planet"]["nix"].player_effects} or {}

if settings.startup["shibadisaster-cwa-nix-enable-heavy-snow"].value then
    if settings.startup["shibadisaster-cwa-nix-heavy-snow-overwrite-original"].value then
        ni_effects = {}
    end

    local ni_snow = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
    ni_snow.name = "ni_snow"
    ni_snow.color = {1.0, 1.0, 1.0}
    data:extend({ni_snow})
    
    local ni_weather = table.deepcopy(common_effects.cluster_particles)
    ni_weather.cluster_count = settings.startup["shibadisaster-cwa-nix-heavy-snow-particle-amount"].value
    ni_weather.action_delivery.source_effects.smoke_name= "ni_snow"
    ni_weather.action_delivery.source_effects.speed = {-0.01, 0.3}
    ni_weather.action_delivery.source_effects.speed_multiplier = 0.7 * settings.startup["shibadisaster-cwa-nix-heavy-snow-speed-multiplier"].value

    table.insert(ni_effects, ni_weather)
end


if settings.startup["shibadisaster-cwa-nix-enable-fog"].value then
    local ni_fog = table.deepcopy(common_effects.fog)
    ni_fog.color1 = {1, 1, 1, 1}
    ni_fog.color2 = {1, 1, 1, 1}
    ni_fog.tick_factor = 0.0004

    data.raw["planet"]["nix"].surface_render_parameters = data.raw["planet"]["nix"]["surface_render_parameters"] or {}
    data.raw["planet"]["nix"].surface_render_parameters["fog"] = ni_fog
end


if #ni_effects >= 1 then
    data.raw["planet"]["nix"].ticks_between_player_effects = 1
    data.raw["planet"]["nix"].player_effects = ni_effects
end