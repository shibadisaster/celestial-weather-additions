local common_effects = require("common.common-effects")

vu_effects = {}

if settings.startup["shibadisaster-cwa-vulcanus-enable-ash"].value then
    local vu_ash = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
    vu_ash.name = "vu_ash"
    vu_ash.color = {0.443, 0.392, 0.317}
    vu_ash.animation.filename = "__celestial-weather-additions__/graphics/vfx/sand-particles.png"
    data:extend({vu_ash})
    
    vu_weather_a = table.deepcopy(common_effects.direct_particles)
    vu_weather_a.action_delivery.source_effects.smoke_name = "vu_ash"
    vu_weather_a.action_delivery.source_effects.speed = {-0.16, 0.4}
    -- vu_weather_a.action_delivery.source_effects.speed_multiplier = settings.startup["vulcanus-ash-particle-speed"].value
    vu_weather_a.action_delivery.source_effects.speed_multiplier = 0.2 * 1.0
    
    table.insert(vu_effects, vu_weather_a)
end


if settings.startup["shibadisaster-cwa-vulcanus-enable-rain"].value then
    local vu_rain = table.deepcopy(data.raw["trivial-smoke"]["gleba-raindrops"])
    vu_rain.name = "vu_rain"
    vu_rain.color = {0.882, 0.847, 0.478}
    vu_rain.animation.filename = "__celestial-weather-additions__/graphics/vfx/light-rain.png"
    vu_rain.animation.width = 256
    vu_rain.animation.height = 256
    vu_rain.animation.line_length = 2
    vu_rain.animation.frame_count = 4
    vu_rain.animation.animation_speed = 0.0001
    vu_rain.animation.scale = 1.3
    data:extend({vu_rain})
    
    vu_weather_r = table.deepcopy(common_effects.direct_particles)
    vu_weather_r.action_delivery.source_effects.smoke_name = "vu_rain"
    vu_weather_r.action_delivery.source_effects.speed = {-0.03, 0.5}
    -- vu_weather_r.action_delivery.source_effects.speed_multiplier = settings.startup["vulcanus-rain-particle-speed"].value
    vu_weather_r.action_delivery.source_effects.speed_multiplier = 2.5 * settings.startup["shibadisaster-cwa-vulcanus-rain-speed-multiplier"].value
    
    table.insert(vu_effects, vu_weather_r)

    if settings.startup["shibadisaster-cwa-vulcanus-enable-rain-sounds"].value then
        data.raw["planet"]["vulcanus"].persistent_ambient_sounds = data.raw["planet"]["vulcanus"].persistent_ambient_sounds or {}
        data.raw["planet"]["vulcanus"].persistent_ambient_sounds.semi_persistent = {{
            sound = {
                filename = "__celestial-weather-additions__/sounds/rain.ogg", volume = 0.1
            }
        }}
    end
end


-- SPLIT THIS OFF INTO A DIFFERENT CONDITIONAL
if settings.startup["shibadisaster-cwa-vulcanus-enable-fog"].value then
    local vu_fog = table.deepcopy(common_effects.fog)
    vu_fog.color1 = {0.882, 0.847, 0.478, 0.6}
    vu_fog.color2 = {0.882, 0.847, 0.478, 0.6}
    vu_fog.tick_factor = 0.0003

    data.raw["planet"]["vulcanus"].surface_render_parameters = data.raw["planet"]["vulcanus"]["surface_render_parameters"] or {}
    data.raw["planet"]["vulcanus"].surface_render_parameters["fog"] = vu_fog
end


if settings.startup["shibadisaster-cwa-vulcanus-enable-fire"].value then
    local vu_fire = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
    vu_fire.name = "vu_fire"
    vu_fire.color = {0.926, 0.407, 0.075}
    vu_fire.animation.filename = "__celestial-weather-additions__/graphics/vfx/fire-particles.png"
    data:extend({vu_fire})
    
    vu_weather_f = table.deepcopy(common_effects.direct_particles)
    vu_weather_f.action_delivery.source_effects.smoke_name = "vu_fire"
    vu_weather_f.action_delivery.source_effects.speed = {-0.16, -0.4}
    -- vu_weather_f.action_delivery.source_effects.speed_multiplier = settings.startup["vulcanus-fire-particle-speed"].value
    vu_weather_f.action_delivery.source_effects.speed_multiplier = 0.04 * settings.startup["shibadisaster-cwa-vulcanus-fire-particle-speed-multiplier"].value
    
    table.insert(vu_effects, vu_weather_f)
end

-- -- implement --
-- if vu_weather_a then
--     table.insert(vu_effects, vu_weather_a)
-- end

-- if vu_weather_r then
--     table.insert(vu_effects, vu_weather_r)
-- end

-- if vu_weather_f then
--     table.insert(vu_effects, vu_weather_f)
-- end

if #vu_effects >= 1 then
    data.raw["planet"]["vulcanus"].ticks_between_player_effects = 1
    data.raw["planet"]["vulcanus"].player_effects = vu_effects
end