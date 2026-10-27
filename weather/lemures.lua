local common_effects = require("common.common-effects")

le_effects = {data.raw["planet"]["lemures"].player_effects} or {}

if settings.startup["shibadisaster-cwa-lemures-enable-heavy-snow"].value then
    if settings.startup["shibadisaster-cwa-lemures-heavy-snow-overwrite-original"].value then
        le_effects = {}
    end

    local le_snow = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
    le_snow.name = "le_snow"
    le_snow.color = {1.0, 1.0, 1.0}
    data:extend({le_snow})
    
    local le_weather = table.deepcopy(common_effects.cluster_particles)
    le_weather.cluster_count = settings.startup["shibadisaster-cwa-lemures-heavy-snow-particle-amount"].value
    le_weather.action_delivery.source_effects.smoke_name= "le_snow"
    le_weather.action_delivery.source_effects.speed = {-0.2, 0.3}
    le_weather.action_delivery.source_effects.speed_multiplier = 0.9 * settings.startup["shibadisaster-cwa-lemures-heavy-snow-speed-multiplier"].value

    table.insert(le_effects, le_weather)
end


if settings.startup["shibadisaster-cwa-lemures-enable-fog"].value then
    local le_fog = table.deepcopy(common_effects.fog)
    le_fog.color1 = {1, 1, 1, 1}
    le_fog.color2 = {1, 1, 1, 1}
    le_fog.tick_factor = 0.0004

    data.raw["planet"]["lemures"].surface_render_parameters = data.raw["planet"]["lemures"]["surface_render_parameters"] or {}
    data.raw["planet"]["lemures"].surface_render_parameters["fog"] = le_fog
end


if #le_effects >= 1 then
    data.raw["planet"]["lemures"].ticks_between_player_effects = 1
    data.raw["planet"]["lemures"].player_effects = le_effects
end