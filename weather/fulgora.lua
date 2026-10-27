local common_effects = require("common.common-effects")

fu_effects = {}

if settings.startup["shibadisaster-cwa-fulgora-enable-sand"].value then
    local fu_sand = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
    fu_sand.name = "fu_sand"
    fu_sand.color = {0.741, 0.616, 0.596}
    fu_sand.animation.filename = "__celestial-weather-additions__/graphics/vfx/sand-particles.png"
    data:extend({fu_sand})
    
    local fu_weather_s = table.deepcopy(common_effects.cluster_particles)
    --   fu_weather.cluster_count = settings.startup["fulgora-particle-amount"].value
    fu_weather_s.cluster_count = 6
    fu_weather_s.action_delivery.source_effects.smoke_name= "fu_sand"
    fu_weather_s.action_delivery.source_effects.speed = {-0.28, 0}
    -- fu_weather.action_delivery.source_effects.speed_multiplier = settings.startup["fulgora-particle-speed"].value
    fu_weather_s.action_delivery.source_effects.speed_multiplier = 1.0

    table.insert(fu_effects, fu_weather_s)
end


if settings.startup["shibadisaster-cwa-fulgora-enable-fog"].value then
    local fu_fog = table.deepcopy(common_effects.fog)
    fu_fog.color1 = {1, 0.667, 0.667, 0.7}
    fu_fog.color2 = {0.741, 0.475, 0.475, 0.7}
    fu_fog.tick_factor = 0.0003
    fu_fog.detail_noise_texture.filename = "__celestial-weather-additions__/graphics/vfx/dense-clouds.png"

    data.raw["planet"]["fulgora"].surface_render_parameters = data.raw["planet"]["fulgora"]["surface_render_parameters"] or {}
    data.raw["planet"]["fulgora"].surface_render_parameters["fog"] = fu_fog
end


if #fu_effects >= 1 then
    data.raw["planet"]["fulgora"].ticks_between_player_effects = 1
    data.raw["planet"]["fulgora"].player_effects = fu_effects
end