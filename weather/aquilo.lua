local common_effects = require("common.common-effects")

aq_effects = {data.raw["planet"]["aquilo"].player_effects} or {}

if settings.startup["shibadisaster-cwa-aquilo-enable-heavy-snow"].value then
    if settings.startup["shibadisaster-cwa-aquilo-heavy-snow-overwrite-original"].value then
        aq_effects = {}
    end

    local aq_snow = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
    aq_snow.name = "aq_snow"
    aq_snow.color = {1.0, 1.0, 1.0}
    data:extend({aq_snow})
    
    local aq_weather = table.deepcopy(common_effects.cluster_particles)
    aq_weather.cluster_count = settings.startup["shibadisaster-cwa-aquilo-heavy-snow-particle-amount"].value
    aq_weather.action_delivery.source_effects.smoke_name= "aq_snow"
    aq_weather.action_delivery.source_effects.speed = {-0.15, 0.3}
    aq_weather.action_delivery.source_effects.speed_multiplier = 0.3 * settings.startup["shibadisaster-cwa-aquilo-heavy-snow-speed-multiplier"].value

    table.insert(aq_effects, aq_weather)
end


if settings.startup["shibadisaster-cwa-aquilo-enable-fog"].value then
    local aq_fog = table.deepcopy(common_effects.fog)
    aq_fog.color1 = {1, 1, 1, 1}
    aq_fog.color2 = {1, 1, 1, 1}
    aq_fog.tick_factor = 0.0002

    data.raw["planet"]["aquilo"].surface_render_parameters = data.raw["planet"]["aquilo"]["surface_render_parameters"] or {}
    data.raw["planet"]["aquilo"].surface_render_parameters["fog"] = aq_fog
end


if #aq_effects >= 1 then
-- implement --
    data.raw["planet"]["aquilo"].ticks_between_player_effects = 1
    data.raw["planet"]["aquilo"].player_effects = aq_effects
end