local common_effects = require("common.common-effects")

------ PARACELSIN ------
if true then
    local paracelsin_effects = {table.deepcopy(data.raw["planet"]["paracelsin"].player_effects)} or {}

    if settings.startup["shibadisaster-cwa-paracelsin-remove-original-snow-effect"].value then
        paracelsin_effects = {}
    end

    if settings.startup["shibadisaster-cwa-paracelsin-ash-snow"].value then
        local ash_snow = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
        ash_snow.name = "paracelsin_ash_snow"
        ash_snow.color = {0.188, 0.188, 0.188, 1.0}
        ash_snow.start_scale = 1.2
        ash_snow.end_scale = 2.0
        ash_snow.animation.blend_mode = "normal"
        data:extend({ash_snow})

        local weather_ash_snow = table.deepcopy(common_effects.cluster_particles)
        weather_ash_snow.action_delivery.source_effects.smoke_name = "paracelsin_ash_snow"
        weather_ash_snow.action_delivery.source_effects.speed = {0.0, 0.25}
        weather_ash_snow.action_delivery.source_effects.speed_multiplier = 1.0
        weather_ash_snow.action_delivery.source_effects.repeat_count = 1
        weather_ash_snow.action_delivery.source_effects.probability = 0.4
        table.insert(paracelsin_effects, weather_ash_snow)
    end
    
    -- player_effects = 
    -- {
    --     type = "direct",
    --     action_delivery =
    --     {
    --         type = "instant",
    --         source_effects =
    --         {
    --             type = "create-trivial-smoke",
    --             smoke_name = "aquilo-snow-smoke",
    --             speed = {0, 0.1},
    --             initial_height = 0.5,
    --             speed_multiplier = 100.0,
    --             speed_multiplier_deviation = 0.5,
    --             starting_frame = 8,
    --             starting_frame_deviation = 8,
    --             offset_deviation = {{-96, -48}, {96, 48}},
    --             speed_from_center = 0.04,
    --             speed_from_center_deviation = 0.2
    --         }
    --     }
    -- }
    
    -- what the hell happens with the lighting when i dont do this
    -- someone who knows please tell me
    -- OKAY note to whoever, the tint/lamp colors are based on the lookup at 0.0, so we can actually set custom lamp colors by changing 0.0
    if settings.startup["shibadisaster-cwa-paracelsin-always-dark"].value then
        data.raw["planet"]["paracelsin"].surface_render_parameters = table.deepcopy(data.raw["planet"]["paracelsin"].surface_render_parameters) or {}

        data.raw["planet"]["paracelsin"].surface_render_parameters.day_night_cycle_color_lookup = {
            {0.00000000, "identity"},
            {0.00000001, "__celestial-weather-additions__/graphics/luts/cryovolcanic_paracelsin_night.png"},
            {0.99999999, "__celestial-weather-additions__/graphics/luts/cryovolcanic_paracelsin_night.png"}
        }
    end
    
    
    
    if #paracelsin_effects >= 1 then
        data.raw["planet"]["paracelsin"].ticks_between_player_effects = 1
        data.raw["planet"]["paracelsin"].player_effects = paracelsin_effects
    end
end