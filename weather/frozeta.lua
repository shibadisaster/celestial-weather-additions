local common_effects = require("common.common-effects")

fr_effects = {data.raw["planet"]["frozeta"].player_effects} or {}

if settings.startup["shibadisaster-cwa-frozeta-enable-heavy-snow"].value then
    if settings.startup["shibadisaster-cwa-frozeta-heavy-snow-overwrite-original"].value then
        fr_effects = {}
    end

    local fr_snow = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
    fr_snow.name = "fr_snow"
    fr_snow.color = {1.0, 1.0, 1.0}
    fr_snow.start_scale = 2.0
    fr_snow.end_scale = 2.0
    data:extend({fr_snow})
    
    local fr_weather = table.deepcopy(common_effects.cluster_particles)
    fr_weather.cluster_count = settings.startup["shibadisaster-cwa-frozeta-heavy-snow-particle-amount"].value
    fr_weather.action_delivery.source_effects.smoke_name= "fr_snow"
    fr_weather.action_delivery.source_effects.speed = {-1.0, 0.3}
    fr_weather.action_delivery.source_effects.speed_multiplier = 1.0 * settings.startup["shibadisaster-cwa-frozeta-heavy-snow-speed-multiplier"].value
    fr_weather.action_delivery.source_effects.offset_deviation = {{-96, -64}, {160, 64}}

    table.insert(fr_effects, fr_weather)
end


if settings.startup["shibadisaster-cwa-frozeta-enable-fog"].value then
    local fr_fog = table.deepcopy(common_effects.fog)
    fr_fog.color1 = {1, 1, 1, 1}
    fr_fog.color2 = {1, 1, 1, 1}
    fr_fog.tick_factor = 0.0012

    data.raw["planet"]["frozeta"].surface_render_parameters = data.raw["planet"]["frozeta"]["surface_render_parameters"] or {}
    data.raw["planet"]["frozeta"].surface_render_parameters["fog"] = fr_fog
end


if #fr_effects >= 1 then
-- implement --
    data.raw["planet"]["frozeta"].ticks_between_player_effects = 1
    data.raw["planet"]["frozeta"].player_effects = fr_effects
end