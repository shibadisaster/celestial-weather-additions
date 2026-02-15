local common_effects = require("common.common-effects")

------ CARNA ------
-- hi amhunter :3
if true then
    -- note for any person in the future trying to see how this was done: some planets list their effects as single player_effects so we have to enclose it in a table
    local carna_effects = table.deepcopy(data.raw["planet"]["carna"].player_effects) or {}

    
    -- if true then
    --     carna_effects[1].cluster_count = 50
    -- end


    if true then
        local carna_fog = table.deepcopy(common_effects.fog)
        carna_fog.color1 = {0.0/255.0, 255.0/255.0, 127.0/255.0}
        carna_fog.color2 = {0.0/255.0, 255.0/255.0, 127.0/255.0}
        carna_fog.tick_factor = 0.000005
        carna_fog.detail_noise_texture.filename = "__celestial-weather__/graphics/entity/dense-clouds.png"
        carna_fog.fog_type = "gleba"

        data.raw["planet"]["carna"].surface_render_parameters = data.raw["planet"]["carna"].surface_render_parameters or {}
        data.raw["planet"]["carna"].surface_render_parameters.fog = carna_fog

        data.raw["tile"]["carna-plasma"].lowland_fog = true
        data.raw["tile"]["carna-plasma-bright"].lowland_fog = true
    end


    if true then
        local carna_sparks = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
        carna_sparks.name = "carna_sparks"
        carna_sparks.color = {0.0/255.0, 255.0/255.0, 127.0/255.0}
        carna_sparks.start_scale = 1.0
        carna_sparks.end_scale = 2.0
        carna_sparks.duration = 180
        carna_sparks.fade_in_duration = 60
        carna_sparks.fade_away_duration = 60
        carna_sparks.render_layer = "smoke"
        carna_sparks.animation.filename = "__celestial-weather__/graphics/entity/fire-particles.png"
        carna_sparks.animation.blend_mode = "additive"
        data:extend({carna_sparks})

        local carna_weather_sparks = table.deepcopy(common_effects.cluster_particles)
        carna_weather_sparks.cluster_count = 10
        carna_weather_sparks.action_delivery.source_effects.smoke_name = "carna_sparks"
        carna_weather_sparks.action_delivery.source_effects.speed = {0.0, 0.1}
        carna_weather_sparks.action_delivery.source_effects.speed_multiplier = 1.0
        carna_weather_sparks.action_delivery.source_effects.repeat_count = 1
        carna_weather_sparks.action_delivery.source_effects.probability = 1.0

        table.insert(carna_effects, carna_weather_sparks)
    end


    if true then
        local carna_sparks_large = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
        carna_sparks_large.name = "carna_sparks_large"
        carna_sparks_large.color = {0.0/255.0, 255.0/255.0, 127.0/255.0}
        carna_sparks_large.start_scale = 1.5
        carna_sparks_large.end_scale = 3.0
        carna_sparks_large.duration = 180
        carna_sparks_large.fade_in_duration = 60
        carna_sparks_large.fade_away_duration = 60
        carna_sparks_large.render_layer = "smoke"
        carna_sparks_large.animation.filename = "__celestial-weather__/graphics/entity/fire-particles.png"
        carna_sparks_large.animation.blend_mode = "additive"
        data:extend({carna_sparks_large})

        local carna_weather_sparks_large = table.deepcopy(common_effects.cluster_particles)
        carna_weather_sparks_large.cluster_count = 10
        carna_weather_sparks_large.action_delivery.source_effects.smoke_name = "carna_sparks_large"
        carna_weather_sparks_large.action_delivery.source_effects.speed = {0.0, 0.07}
        carna_weather_sparks_large.action_delivery.source_effects.speed_multiplier = 1.0
        carna_weather_sparks_large.action_delivery.source_effects.repeat_count = 1
        carna_weather_sparks_large.action_delivery.source_effects.probability = 1.0

        table.insert(carna_effects, carna_weather_sparks_large)
    end


    if true then
        local carna_sparks_small = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
        carna_sparks_small.name = "carna_sparks_small"
        carna_sparks_small.color = {0.0/255.0, 255.0/255.0, 127.0/255.0}
        carna_sparks_small.start_scale = 0.5
        carna_sparks_small.end_scale = 1.0
        carna_sparks_small.duration = 180
        carna_sparks_small.fade_in_duration = 60
        carna_sparks_small.fade_away_duration = 60
        carna_sparks_small.render_layer = "smoke"
        carna_sparks_small.animation.filename = "__celestial-weather__/graphics/entity/fire-particles.png"
        carna_sparks_small.animation.blend_mode = "additive"
        data:extend({carna_sparks_small})

        local carna_weather_sparks_small = table.deepcopy(common_effects.cluster_particles)
        carna_weather_sparks_small.cluster_count = 10
        carna_weather_sparks_small.action_delivery.source_effects.smoke_name = "carna_sparks_small"
        carna_weather_sparks_small.action_delivery.source_effects.speed = {0.0, 0.13}
        carna_weather_sparks_small.action_delivery.source_effects.speed_multiplier = 1.0
        carna_weather_sparks_small.action_delivery.source_effects.repeat_count = 1
        carna_weather_sparks_small.action_delivery.source_effects.probability = 1.0

        table.insert(carna_effects, carna_weather_sparks_small)
    end

    if #carna_effects >= 1 then
        data.raw["planet"]["carna"].player_effects = carna_effects
    end
end