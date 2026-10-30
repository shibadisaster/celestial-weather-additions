local common_effects = require("common.common-effects")

mo_effects = {data.raw["planet"]["moshine"].player_effects} or {}

if settings.startup["shibadisaster-cwa-moshine-enable-sand"].value then
    local mo_sand = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
    mo_sand.name = "mo_sand"
    mo_sand.color = {1, 0.855, 0.624}
    mo_sand.animation.filename = "__celestial-weather-additions__/graphics/vfx/sand-particles.png"
    data:extend({mo_sand})

    local mo_weather_s = table.deepcopy(common_effects.cluster_particles)
    mo_weather_s.cluster_count = settings.startup["shibadisaster-cwa-moshine-sand-particle-amount"].value
    mo_weather_s.action_delivery.source_effects.smoke_name= "mo_sand"
    mo_weather_s.action_delivery.source_effects.speed = {-0.32, 0.04}
    mo_weather_s.action_delivery.source_effects.speed_multiplier = 1.0 * settings.startup["shibadisaster-cwa-moshine-sand-speed-multiplier"].value
    table.insert(mo_effects, mo_weather_s)

    local mo_weather_s2 = table.deepcopy(common_effects.cluster_particles)
    mo_weather_s2.cluster_count = settings.startup["shibadisaster-cwa-moshine-sand-particle-amount"].value
    mo_weather_s2.action_delivery.source_effects.smoke_name= "mo_sand"
    mo_weather_s2.action_delivery.source_effects.speed = {-0.43, -0.08}
    mo_weather_s2.action_delivery.source_effects.speed_multiplier = 1.0 * settings.startup["shibadisaster-cwa-moshine-sand-speed-multiplier"].value
    table.insert(mo_effects, mo_weather_s2)
end


if settings.startup["shibadisaster-cwa-moshine-enable-fire"].value then
    local mo_fire = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
    mo_fire.name = "mo_fire"
    mo_fire.color = settings.startup["shibadisaster-cwa-moshine-fire-color"].value
    mo_fire.animation.filename = "__celestial-weather-additions__/graphics/vfx/fire-particles.png"
    mo_fire.animation.blend_mode = "additive"
    mo_fire.start_scale = 1.0
    mo_fire.end_scale = 2.0
    mo_fire.movement_slow_down_factor = 1.0
    data:extend({mo_fire})
    
    mo_weather_f = table.deepcopy(common_effects.direct_particles)
    mo_weather_f.action_delivery.source_effects.smoke_name = "mo_fire"
    mo_weather_f.action_delivery.source_effects.speed = {-0.48, -0.4}
    mo_weather_f.action_delivery.source_effects.speed_multiplier = 0.10 * settings.startup["shibadisaster-cwa-moshine-fire-speed-multiplier"].value
    mo_weather_f.action_delivery.source_effects.speed_multiplier_deviation = 0.05 * settings.startup["shibadisaster-cwa-moshine-fire-speed-multiplier"].value
    table.insert(mo_effects, mo_weather_f)

    local mo_fire_near = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
    mo_fire_near.name = "mo_fire_near"
    mo_fire_near.color = settings.startup["shibadisaster-cwa-moshine-fire-color"].value
    mo_fire_near.animation.filename = "__celestial-weather-additions__/graphics/vfx/fire-particles.png"
    mo_fire_near.animation.blend_mode = "additive"
    mo_fire_near.start_scale = 1.5
    mo_fire_near.end_scale = 3.0
    mo_fire_near.movement_slow_down_factor = 1.0
    data:extend({mo_fire_near})

    mo_weather_f2 = table.deepcopy(common_effects.direct_particles)
    mo_weather_f2.action_delivery.source_effects.smoke_name = "mo_fire_near"
    mo_weather_f2.action_delivery.source_effects.speed = {-0.48, -0.4}
    mo_weather_f2.action_delivery.source_effects.speed_multiplier = 0.15 * settings.startup["shibadisaster-cwa-moshine-fire-speed-multiplier"].value
    mo_weather_f2.action_delivery.source_effects.speed_multiplier_deviation = 0.075 * settings.startup["shibadisaster-cwa-moshine-fire-speed-multiplier"].value
    table.insert(mo_effects, mo_weather_f)
end


if settings.startup["shibadisaster-cwa-moshine-enable-fog"].value then
    local mo_fog = table.deepcopy(common_effects.fog)
    mo_fog.color1 = {1, 0.749, 0.2, 1.0}
    mo_fog.color2 = {1, 0.8, 0.2, 1.0}
    mo_fog.tick_factor = 0.0003
    mo_fog.detail_noise_texture.filename = "__celestial-weather-additions__/graphics/vfx/dense-clouds.png"
    
    data.raw["planet"]["moshine"].surface_render_parameters = data.raw["planet"]["moshine"]["surface_render_parameters"] or {}
    data.raw["planet"]["moshine"].surface_render_parameters["fog"] = mo_fog
end


if #mo_effects >= 1 then
    data.raw["planet"]["moshine"].ticks_between_player_effects = 1
    data.raw["planet"]["moshine"].player_effects = mo_effects
end