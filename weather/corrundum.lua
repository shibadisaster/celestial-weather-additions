local common_effects = require("common.common-effects")

co_effects = {data.raw["planet"]["corrundum"].player_effects} or {}


if settings.startup["shibadisaster-cwa-corrundum-enable-sand"].value then
    local co_sand = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
    co_sand.name = "co_sand"
    co_sand.color = {0.494, 0.380, 0.290}
    co_sand.animation.filename = "__celestial-weather-additions__/graphics/vfx/sand-particles.png"
    data:extend({co_sand})

    local co_weather_s = table.deepcopy(common_effects.cluster_particles)
    co_weather_s.cluster_count = settings.startup["shibadisaster-cwa-corrundum-sand-particle-amount"].value
    co_weather_s.action_delivery.source_effects.smoke_name= "co_sand"
    co_weather_s.action_delivery.source_effects.speed = {-0.32, 0}
    co_weather_s.action_delivery.source_effects.speed_multiplier = settings.startup["shibadisaster-cwa-corrundum-sand-speed-multiplier"].value
    table.insert(co_effects, co_weather_s)
end


if settings.startup["shibadisaster-cwa-corrundum-enable-fog"].value then
    local co_fog = table.deepcopy(common_effects.fog)
    co_fog.color1 = {0.588, 0.45, 0.341, 1.0}
    co_fog.color2 = {0.678, 0.549, 0.45, 1.0}
    co_fog.tick_factor = 0.0004
    co_fog.detail_noise_texture.filename = "__celestial-weather-additions__/graphics/vfx/dense-clouds.png"
    
    data.raw["planet"]["corrundum"].surface_render_parameters = data.raw["planet"]["corrundum"]["surface_render_parameters"] or {}
    data.raw["planet"]["corrundum"].surface_render_parameters["fog"] = co_fog
end


if settings.startup["shibadisaster-cwa-corrundum-enable-rain"].value then
    local co_rain = table.deepcopy(data.raw["trivial-smoke"]["gleba-raindrops"])
    co_rain.name = "co_rain"
    co_rain.color = {0.882, 0.847, 0.478}
    co_rain.animation.filename = "__celestial-weather-additions__/graphics/vfx/light-rain.png"
    co_rain.animation.width = 256
    co_rain.animation.height = 256
    co_rain.animation.line_length = 2
    co_rain.animation.frame_count = 4
    co_rain.animation.scale = 0.8
    data:extend({co_rain})
    
    co_weather_r = table.deepcopy(common_effects.cluster_particles)
    co_weather_r.cluster_count = 4
    co_weather_r.action_delivery.source_effects.smoke_name = "co_rain"
    co_weather_r.action_delivery.source_effects.speed = {-0.02, 0.5}
    co_weather_r.action_delivery.source_effects.speed_multiplier = settings.startup["shibadisaster-cwa-corrundum-rain-speed-multiplier"].value
    table.insert(co_effects, co_weather_r)
    
    if settings.startup["shibadisaster-cwa-corrundum-rain-enable-sounds"].value then
        data.raw["planet"]["corrundum"].persistent_ambient_sounds = data.raw["planet"]["corrundum"].persistent_ambient_sounds or {}
        data.raw["planet"]["corrundum"].persistent_ambient_sounds.semi_persistent = {{
            sound = {
                filename = "__celestial-weather-additions__/sounds/rain.ogg", volume = 0.2
            }
        }}
    end
end


if #co_effects >= 1 then
    data.raw["planet"]["corrundum"].ticks_between_player_effects = 1
    data.raw["planet"]["corrundum"].player_effects = co_effects
end