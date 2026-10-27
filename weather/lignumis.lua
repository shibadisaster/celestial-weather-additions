local common_effects = require("common.common-effects")

li_effects = {data.raw["planet"]["lignumis"].player_effects} or {}

if settings.startup["shibadisaster-cwa-lignumis-enable-rain"].value then
    local li_rain = table.deepcopy(data.raw["trivial-smoke"]["gleba-raindrops"])
    li_rain.name = "li_rain"
    li_rain.color = {0.533, 0.737, 0.929, 0.2}
    li_rain.animation.filename = "__celestial-weather-additions__/graphics/vfx/light-rain.png"
    li_rain.animation.width = 256
    li_rain.animation.height = 256
    li_rain.animation.line_length = 2
    li_rain.animation.frame_count = 4
    li_rain.animation.scale = 0.8
    data:extend({li_rain})
    
    li_weather = table.deepcopy(common_effects.cluster_particles)
    li_weather.cluster_count = 10
    li_weather.action_delivery.source_effects.smoke_name = "li_rain"
    li_weather.action_delivery.source_effects.speed = {-0.02, 0.5}
    li_weather.action_delivery.source_effects.speed_multiplier = 2.5 * settings.startup["shibadisaster-cwa-lignumis-rain-speed-multiplier"].value
    table.insert(li_effects, li_weather)
    
    if settings.startup["shibadisaster-cwa-lignumis-rain-enable-sounds"].value then
        data.raw["planet"]["lignumis"].persistent_ambient_sounds = data.raw["planet"]["lignumis"].persistent_ambient_sounds or {}
        data.raw["planet"]["lignumis"].persistent_ambient_sounds.semi_persistent = {{
            sound = {
                filename = "__celestial-weather-additions__/sounds/rain.ogg", volume = 0.2
            }
        }}
    end
end


if settings.startup["shibadisaster-cwa-lignumis-enable-fog"].value then
    local li_fog = table.deepcopy(common_effects.fog)
    li_fog.color1 = {0.549, 0.737, 0.91, 1.0}
    li_fog.color2 = {0.431, 0.592, 0.741, 1.0}
    li_fog.tick_factor = 0.0002

    data.raw["planet"]["lignumis"].surface_render_parameters = data.raw["planet"]["lignumis"]["surface_render_parameters"] or {}
    data.raw["planet"]["lignumis"].surface_render_parameters["fog"] = li_fog
end


if #li_effects >= 1 then
    data.raw["planet"]["lignumis"].ticks_between_player_effects = 1
    data.raw["planet"]["lignumis"].player_effects = li_effects
end
    