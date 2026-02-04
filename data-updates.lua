-- Most code here adapted from Celestial Weather mod by Varaxia!




------ Fog ------
local fog = {
    fog_type = "vulcanus",
    shape_noise_texture =
    {
        filename = "__core__/graphics/clouds-noise.png",
        size = 2048
    },
    detail_noise_texture =
    {
        filename = "__core__/graphics/clouds-detail-noise.png",
        size = 2048
    },
    color1 = {255, 217, 139, 1.0},
    color2 = {183, 255, 169, 1.0},
    tick_factor = 0.000001
}


------ Direct Particles ------
local direct_particles = {
    type = "direct",
    action_delivery = {
        type = "instant",
        source_effects = {
            type = "create-trivial-smoke",
            speed_multiplier_deviation = 0.2,
            starting_frame = 512,
            starting_frame_deviation = 1024,
            offset_deviation = {{-96, -48}, {96, 48}},
            speed_from_center = 0,
            speed_from_center_deviation = 0
        }
    }
}


------ Cluster Particles ------
local cluster_particles = {
    type = "cluster",
    distance = 8,
    distance_deviation = 8,
    cluster_count = 10,
    action_delivery = {
        type = "instant",
        source_effects = {
            type = "create-trivial-smoke",
            initial_height = 0.6,
            speed_multiplier_deviation = 0.2,
            starting_frame = 512,
            starting_frame_deviation = 1024,
            offset_deviation = {{-96, -48}, {96, 48}},
            speed_from_center = 0,
            speed_from_center_deviation = 0
        }
    }
}





------ RUBIA ------
if mods["rubia"] and settings.startup["shibadisaster-cwa-enable-rubia-changes"].value then
    -- change rubia's built-in weather effects
    local rubia_rain_lines = data.raw["trivial-smoke"]["rubia-rain-lines"]
    rubia_rain_lines.color = {0.822, 0.700, 0.564, 1.0}
    rubia_rain_lines.start_scale = 3.5
    rubia_rain_lines.end_scale = 3.5
    rubia_rain_lines.fade_in_duration = 10
    rubia_rain_lines.fade_away_duration = 10
    rubia_rain_lines.duration = 80

    local rubia_sand = data.raw["trivial-smoke"]["rubia-sand"]
    rubia_sand.color = {0.822, 0.700, 0.564, 1.0}
    rubia_sand.start_scale = 4.0
    rubia_sand.end_scale = 4.0
    rubia_sand.fade_in_duration = 10
    rubia_sand.fade_away_duration = 10
    rubia_sand.duration = 80

    -- change speed of built-in effects
    local rubia_effects = table.deepcopy(data.raw["planet"]["rubia"].player_effects) or {}

    for _, effect in ipairs(rubia_effects) do
        effect.action_delivery.source_effects.speed_multiplier = 10.0 * settings.startup["shibadisaster-cwa-rubia-particle-speed"].value
    end




    -- add overlay fog
    -- local rubia_fog = table.deepcopy(fog)
    -- rubia_fog.color1 = {0.822, 0.700, 0.564, 0.5}
    -- rubia_fog.color2 = {0.822, 0.700, 0.564, 0.5}
    -- rubia_fog.tick_factor = 0.003
    -- rubia_fog.detail_noise_texture.filename = "__celestial-weather__/graphics/entity/dense-clouds.png"

    -- data.raw["planet"]["rubia"].surface_render_parameters["fog"] = rubia_fog

    if settings.startup["shibadisaster-cwa-rubia-enable-clouds"].value then
        local rubia_clouds = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
        rubia_clouds.name = "rubia_clouds"
        rubia_clouds.color = {0.622, 0.500, 0.364, 0.5}
        rubia_clouds.start_scale = 4.0
        rubia_clouds.end_scale = 6.0
        rubia_clouds.duration = 60
        rubia_clouds.fade_in_duration = 30
        rubia_clouds.fade_away_duration = 30
        rubia_clouds.render_layer = "air-entity-info-icon"
        rubia_clouds.animation.filename = "__celestial-weather-additions__/graphics/vfx/diffuse-cloud.png"
        rubia_clouds.animation.frame_count = 1
        rubia_clouds.animation.size = 512
        data:extend({rubia_clouds})

        local rubia_weather_clouds = table.deepcopy(cluster_particles)
        rubia_weather_clouds.action_delivery.source_effects.smoke_name = "rubia_clouds"
        rubia_weather_clouds.action_delivery.source_effects.speed = {0.3, 0.0}
        rubia_weather_clouds.action_delivery.source_effects.speed_multiplier = 6.25 * settings.startup["shibadisaster-cwa-rubia-particle-speed"].value
        rubia_weather_clouds.action_delivery.source_effects.probability = 0.05
        rubia_weather_clouds.action_delivery.source_effects.offset_deviation = {{-160, -48}, {96, 48}}
        rubia_weather_clouds.action_delivery.source_effects.movement_slow_down_factor = 0.0

        table.insert(rubia_effects, rubia_weather_clouds)


        local rubia_clouds_b = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
        rubia_clouds_b.name = "rubia_clouds_b"
        rubia_clouds_b.color = {0.310, 0.250, 0.180, 0.25}
        rubia_clouds_b.start_scale = 5.0
        rubia_clouds_b.end_scale = 3.0
        rubia_clouds_b.duration = 60
        rubia_clouds_b.fade_in_duration = 30
        rubia_clouds_b.fade_away_duration = 30
        rubia_clouds_b.render_layer = "air-entity-info-icon"
        rubia_clouds_b.animation.filename = "__celestial-weather-additions__/graphics/vfx/cloud-c.png"
        rubia_clouds_b.animation.frame_count = 1
        rubia_clouds_b.animation.size = 512
        data:extend({rubia_clouds_b})

        local rubia_weather_clouds_b = table.deepcopy(cluster_particles)
        rubia_weather_clouds_b.action_delivery.source_effects.smoke_name = "rubia_clouds_b"
        rubia_weather_clouds_b.action_delivery.source_effects.speed = {0.3, 0.0}
        rubia_weather_clouds_b.action_delivery.source_effects.speed_multiplier = 7.8 * settings.startup["shibadisaster-cwa-rubia-particle-speed"].value
        rubia_weather_clouds_b.action_delivery.source_effects.probability = 0.01
        rubia_weather_clouds_b.action_delivery.source_effects.offset_deviation = {{-160, -48}, {96, 48}}
        rubia_weather_clouds_b.action_delivery.source_effects.movement_slow_down_factor = 0.0

        table.insert(rubia_effects, rubia_weather_clouds_b)
    end


    data.raw["planet"]["rubia"].player_effects = rubia_effects
end








------ VESTA ------
if mods["skewer_planet_vesta"] and settings.startup["shibadisaster-cwa-enable-vesta-changes"].value then
    local vesta_fog = table.deepcopy(fog)
    vesta_fog.color1 = settings.startup["shibadisaster-cwa-vesta-fog-color"].value
    vesta_fog.color2 = settings.startup["shibadisaster-cwa-vesta-fog-color"].value
    vesta_fog.tick_factor = 0.00003
    vesta_fog.detail_noise_texture.filename = "__celestial-weather__/graphics/entity/dense-clouds.png"

    data.raw["planet"]["vesta"].surface_render_parameters["fog"] = vesta_fog
    data.raw["planet"]["vesta"].surface_render_parameters["clouds"] = nil


    -- note to self/whoever is reading this: since vesta didn't have existing player_effects, we can just add to player_effects like normal
    local vesta_effects = table.deepcopy(data.raw["planet"]["vesta"].player_effects) or {}

    -- note to self: okay! so i think i get colors now, by premultiplied alpha it means {r, g, b, a} should be {ar, ag, ab, a}
    -- vesta thick clouds
    local vesta_thick_clouds = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
    vesta_thick_clouds.name = "vesta_thick_clouds"
    vesta_thick_clouds.color = settings.startup["shibadisaster-cwa-vesta-thick-cloud-color"].value
    vesta_thick_clouds.start_scale = 4.0
    vesta_thick_clouds.end_scale = 4.0
    vesta_thick_clouds.duration = 240 * settings.startup["shibadisaster-cwa-vesta-cloud-duration-multiplier"].value
    vesta_thick_clouds.fade_in_duration = 120 * settings.startup["shibadisaster-cwa-vesta-cloud-duration-multiplier"].value
    vesta_thick_clouds.fade_away_duration = 120 * settings.startup["shibadisaster-cwa-vesta-cloud-duration-multiplier"].value
    vesta_thick_clouds.render_layer = "air-entity-info-icon"
    vesta_thick_clouds.animation.filename = "__celestial-weather-additions__/graphics/vfx/diffuse-cloud.png"
    vesta_thick_clouds.animation.frame_count = 1
    vesta_thick_clouds.animation.size = 512
    data:extend({vesta_thick_clouds})

    local vesta_thick_clouds_white_a = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
    vesta_thick_clouds_white_a.name = "vesta_clouds_white_a"
    vesta_thick_clouds_white_a.color = settings.startup["shibadisaster-cwa-vesta-cloud-color"].value
    vesta_thick_clouds_white_a.start_scale = 3.0
    vesta_thick_clouds_white_a.end_scale = 4.0
    vesta_thick_clouds_white_a.duration = 240 * settings.startup["shibadisaster-cwa-vesta-cloud-duration-multiplier"].value
    vesta_thick_clouds_white_a.fade_in_duration = 60 * settings.startup["shibadisaster-cwa-vesta-cloud-duration-multiplier"].value
    vesta_thick_clouds_white_a.fade_away_duration = 60 * settings.startup["shibadisaster-cwa-vesta-cloud-duration-multiplier"].value
    vesta_thick_clouds_white_a.render_layer = "floor"
    vesta_thick_clouds_white_a.animation.filename = "__celestial-weather-additions__/graphics/vfx/cloud-a.png"
    vesta_thick_clouds_white_a.animation.frame_count = 1
    vesta_thick_clouds_white_a.animation.size = 512
    data:extend({vesta_thick_clouds_white_a})

    local vesta_thick_clouds_white_b = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
    vesta_thick_clouds_white_b.name = "vesta_clouds_white_b"
    vesta_thick_clouds_white_b.color = settings.startup["shibadisaster-cwa-vesta-cloud-color"].value
    vesta_thick_clouds_white_b.start_scale = 3.0
    vesta_thick_clouds_white_b.end_scale = 4.0
    vesta_thick_clouds_white_b.duration = 240 * settings.startup["shibadisaster-cwa-vesta-cloud-duration-multiplier"].value
    vesta_thick_clouds_white_b.fade_in_duration = 60 * settings.startup["shibadisaster-cwa-vesta-cloud-duration-multiplier"].value
    vesta_thick_clouds_white_b.fade_away_duration = 60 * settings.startup["shibadisaster-cwa-vesta-cloud-duration-multiplier"].value
    vesta_thick_clouds_white_b.render_layer = "smoke"
    vesta_thick_clouds_white_b.animation.filename = "__celestial-weather-additions__/graphics/vfx/cloud-b.png"
    vesta_thick_clouds_white_b.animation.frame_count = 1
    vesta_thick_clouds_white_b.animation.size = 512
    data:extend({vesta_thick_clouds_white_b})

    local vesta_thick_clouds_white_c = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
    vesta_thick_clouds_white_c.name = "vesta_clouds_white_c"
    vesta_thick_clouds_white_c.color = settings.startup["shibadisaster-cwa-vesta-cloud-color"].value
    vesta_thick_clouds_white_c.start_scale = 3.0
    vesta_thick_clouds_white_c.end_scale = 4.0
    vesta_thick_clouds_white_c.duration = 240 * settings.startup["shibadisaster-cwa-vesta-cloud-duration-multiplier"].value
    vesta_thick_clouds_white_c.fade_in_duration = 60 * settings.startup["shibadisaster-cwa-vesta-cloud-duration-multiplier"].value
    vesta_thick_clouds_white_c.fade_away_duration = 60 * settings.startup["shibadisaster-cwa-vesta-cloud-duration-multiplier"].value
    vesta_thick_clouds_white_c.render_layer = "air-entity-info-icon"
    vesta_thick_clouds_white_c.animation.filename = "__celestial-weather-additions__/graphics/vfx/cloud-c.png"
    vesta_thick_clouds_white_c.animation.frame_count = 1
    vesta_thick_clouds_white_c.animation.size = 512
    data:extend({vesta_thick_clouds_white_c})


    local vesta_weather_thick_clouds = table.deepcopy(direct_particles)
    vesta_weather_thick_clouds.action_delivery.source_effects.smoke_name = "vesta_thick_clouds"
    vesta_weather_thick_clouds.action_delivery.source_effects.speed = {0.0, 0.0}
    vesta_weather_thick_clouds.action_delivery.source_effects.speed_multiplier = 0.0
    vesta_weather_thick_clouds.action_delivery.source_effects.probability = 0.4
    vesta_weather_thick_clouds.action_delivery.source_effects.movement_slow_down_factor = 0.0

    local vesta_weather_thick_clouds_white_a = table.deepcopy(direct_particles)
    vesta_weather_thick_clouds_white_a.action_delivery.source_effects.smoke_name = "vesta_clouds_white_a"
    vesta_weather_thick_clouds_white_a.action_delivery.source_effects.speed = {0.0, 0.0}
    vesta_weather_thick_clouds_white_a.action_delivery.source_effects.speed_multiplier = 0.0
    vesta_weather_thick_clouds_white_a.action_delivery.source_effects.probability = 0.0005
    vesta_weather_thick_clouds_white_a.action_delivery.source_effects.movement_slow_down_factor = 0.0

    local vesta_weather_thick_clouds_white_b = table.deepcopy(direct_particles)
    vesta_weather_thick_clouds_white_b.action_delivery.source_effects.smoke_name = "vesta_clouds_white_b"
    vesta_weather_thick_clouds_white_b.action_delivery.source_effects.speed = {0.0, 0.0}
    vesta_weather_thick_clouds_white_b.action_delivery.source_effects.speed_multiplier = 0.0
    vesta_weather_thick_clouds_white_b.action_delivery.source_effects.probability = 0.0005
    vesta_weather_thick_clouds_white_b.action_delivery.source_effects.movement_slow_down_factor = 0.0

    table.insert(vesta_effects, vesta_weather_thick_clouds)
    table.insert(vesta_effects, vesta_weather_thick_clouds_white_a)
    table.insert(vesta_effects, vesta_weather_thick_clouds_white_b)

    if not settings.startup["shibadisaster-cwa-vesta-reduce-cloud-cover"].value then
        local vesta_weather_thick_clouds_white_c = table.deepcopy(direct_particles)
        vesta_weather_thick_clouds_white_c.action_delivery.source_effects.smoke_name = "vesta_clouds_white_c"
        vesta_weather_thick_clouds_white_c.action_delivery.source_effects.speed = {0.0, 0.0}
        vesta_weather_thick_clouds_white_c.action_delivery.source_effects.speed_multiplier = 0.0
        vesta_weather_thick_clouds_white_c.action_delivery.source_effects.probability = 0.0005
        vesta_weather_thick_clouds_white_c.action_delivery.source_effects.movement_slow_down_factor = 0.0
        table.insert(vesta_effects, vesta_weather_thick_clouds_white_c)
    end
    

    data.raw["planet"]["vesta"].player_effects = vesta_effects
    data.raw["planet"]["vesta"].ticks_between_player_effects = 2
end





------ MURIA ------
if mods["Muria"] and settings.startup["shibadisaster-cwa-enable-muria-changes"].value then
    if settings.startup["shibadisaster-cwa-muria-enable-fog"].value then
        local muria_fog = table.deepcopy(fog)
        muria_fog.color1 = {126.0/255.0 * 0.5, 31.0/255.0 * 0.5, 91.0/255.0 * 0.5, 1.0 * 0.5}
        muria_fog.color2 = {126.0/255.0 * 0.5, 31.0/255.0 * 0.5, 91.0/255.0 * 0.5, 1.0 * 0.5}
        muria_fog.tick_factor = 0.00003
        muria_fog.detail_noise_texture.filename = "__celestial-weather__/graphics/entity/dense-clouds.png"

        data.raw["planet"]["muria"].surface_render_parameters["fog"] = muria_fog
    end


    -- note to self/whoever is reading this: since muria already has an existing effect (rain), idk how to add my effect on top elegantly, if anyone knows how please leave something on the discussions page
    --     this was the first way i figured out to do this that worked, but refer to vesta effects to see a better way to do this
    local muria_effects_action_delivery = {table.deepcopy(data.raw["planet"]["muria"].player_effects.action_delivery)}
    local muria_effects = {table.deepcopy(data.raw["planet"]["muria"].player_effects)} or {}

    -- acid spores
    if settings.startup["shibadisaster-cwa-muria-enable-spores"].value then
        local muria_large_acid_spore = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
        muria_large_acid_spore.name = "muria_large_acid_spore"
        muria_large_acid_spore.color = settings.startup["shibadisaster-cwa-muria-spore-color"].value
        muria_large_acid_spore.animation.filename = "__celestial-weather__/graphics/entity/fire-particles.png"
        muria_large_acid_spore.start_scale = 0.0
        muria_large_acid_spore.end_scale = 2.0
        data:extend({muria_large_acid_spore})

        local muria_small_acid_spore = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
        muria_small_acid_spore.name = "muria_small_acid_spore"
        muria_small_acid_spore.color = settings.startup["shibadisaster-cwa-muria-spore-color"].value
        muria_small_acid_spore.animation.filename = "__celestial-weather__/graphics/entity/fire-particles.png"
        muria_small_acid_spore.start_scale = 0.0
        muria_small_acid_spore.end_scale = 1.0
        data:extend({muria_small_acid_spore})

        local muria_very_small_acid_spore = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
        muria_very_small_acid_spore.name = "muria_very_small_acid_spore"
        muria_very_small_acid_spore.color = settings.startup["shibadisaster-cwa-muria-spore-color"].value
        muria_very_small_acid_spore.animation.filename = "__celestial-weather__/graphics/entity/fire-particles.png"
        muria_very_small_acid_spore.start_scale = 0.0
        muria_very_small_acid_spore.end_scale = 0.3
        data:extend({muria_very_small_acid_spore})


        local muria_weather_large_acid = table.deepcopy(direct_particles)
        muria_weather_large_acid.action_delivery.source_effects.smoke_name = "muria_large_acid_spore"
        muria_weather_large_acid.action_delivery.source_effects.speed = {0.0, 0.0}
        muria_weather_large_acid.action_delivery.source_effects.speed_multiplier = 5.0
        muria_weather_large_acid.action_delivery.source_effects.repeat_count = 1
        muria_weather_large_acid.action_delivery.source_effects.probability = 0.4

        local muria_weather_small_acid = table.deepcopy(direct_particles)
        muria_weather_small_acid.action_delivery.source_effects.smoke_name = "muria_small_acid_spore"
        muria_weather_small_acid.action_delivery.source_effects.speed = {0.0, 0.0}
        muria_weather_small_acid.action_delivery.source_effects.speed_multiplier = 5.0
        muria_weather_small_acid.action_delivery.source_effects.repeat_count = 1
        muria_weather_small_acid.action_delivery.source_effects.probability = 0.4

        local muria_weather_very_small_acid = table.deepcopy(direct_particles)
        muria_weather_very_small_acid.action_delivery.source_effects.smoke_name = "muria_very_small_acid_spore"
        muria_weather_very_small_acid.action_delivery.source_effects.speed = {0.0, 0.0}
        muria_weather_very_small_acid.action_delivery.source_effects.speed_multiplier = 5.0
        muria_weather_very_small_acid.action_delivery.source_effects.repeat_count = 1
        muria_weather_very_small_acid.action_delivery.source_effects.probability = 0.4

        table.insert(muria_effects_action_delivery, muria_weather_large_acid.action_delivery)
        table.insert(muria_effects_action_delivery, muria_weather_small_acid.action_delivery)
        table.insert(muria_effects_action_delivery, muria_weather_very_small_acid.action_delivery)
    end


    if settings.startup["shibadisaster-cwa-muria-enable-clouds"].value then
        local muria_cloud = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
        muria_cloud.name = "muria_cloud"
        muria_cloud.color = {0.0375, 0.05, 0.0, 0.1}
        muria_cloud.animation.filename = "__celestial-weather-additions__/graphics/vfx/cloud-a.png"
        muria_cloud.animation.frame_count = 1
        muria_cloud.animation.size = 512
        muria_cloud.start_scale = 3.0
        muria_cloud.end_scale = 5.0
        muria_cloud.duration = 240
        muria_cloud.fade_in_duration = 60
        muria_cloud.fade_away_duration = 60
        data:extend({muria_cloud})

        local muria_weather_cloud = table.deepcopy(direct_particles)
        muria_weather_cloud.action_delivery.source_effects.smoke_name = "muria_cloud"
        muria_weather_cloud.action_delivery.source_effects.speed = {0.0, 0.0}
        muria_weather_cloud.action_delivery.source_effects.speed_multiplier = 1.0
        muria_weather_cloud.action_delivery.source_effects.repeat_count = 1
        muria_weather_cloud.action_delivery.source_effects.probability = 0.03

        table.insert(muria_effects_action_delivery, muria_weather_cloud.action_delivery)
    end

    data.raw["planet"]["muria"].ticks_between_player_effects = 1
    data.raw["planet"]["muria"].player_effects.action_delivery = muria_effects_action_delivery
end




------ PARACELSIN ------
if mods["Paracelsin"] and settings.startup["shibadisaster-cwa-enable-paracelsin-changes"].value then
    if settings.startup["shibadisaster-cwa-paracelsin-ash-snow"].value then
        local paracelsin_snow = data.raw["trivial-smoke"]["pa_snow"]
        paracelsin_snow.color = {0.188, 0.188, 0.188, 1.0}
        paracelsin_snow.start_scale = 0.8
        paracelsin_snow.end_scale = 1.2
    end
    
    -- what the hell happens with the lighting when i dont do this
    -- someone who knows please tell me
    -- OKAY note to whoever, the tint/lamp colors are based on the lookup at 0.0, so we can actually set custom lamp colors by changing 0.0
    if settings.startup["shibadisaster-cwa-paracelsin-always-dark"].value then
        data.raw["planet"]["paracelsin"].surface_render_parameters.day_night_cycle_color_lookup = {
            {0.00000000, "identity"},
            {0.00000001, "__celestial-weather-additions__/graphics/luts/cryovolcanic_paracelsin_night.png"},
            {0.99999999, "__celestial-weather-additions__/graphics/luts/cryovolcanic_paracelsin_night.png"}
        }
    end
end





------ RABBASCA ------
local rabbasca_effects = table.deepcopy(data.raw["planet"]["rabbasca"].player_effects) or {}

if true then
    local rabbasca_fog = table.deepcopy(fog)
    rabbasca_fog.color1 = {64.0/255.0 * 1.0, 31.0/255.0 * 1.0, 126.0/255.0 * 1.0, 1.0 * 1.0}
    rabbasca_fog.color2 = {64.0/255.0 * 1.0, 31.0/255.0 * 1.0, 126.0/255.0 * 1.0, 1.0 * 1.0}
    -- rabbasca_fog.color1 = {255.0/255.0 * 0.5, 255.0/255.0 * 0.5, 255.0/255.0 * 0.5, 1.0 * 0.5}
    -- rabbasca_fog.color2 = {255.0/255.0 * 0.5, 255.0/255.0 * 0.5, 255.0/255.0 * 0.5, 1.0 * 0.5}
    rabbasca_fog.tick_factor = 0.00003
    rabbasca_fog.detail_noise_texture.filename = "__celestial-weather__/graphics/entity/dense-clouds.png"

    data.raw["planet"]["rabbasca"].surface_render_parameters["fog"] = rabbasca_fog
end

if true then
    local rabbasca_cloud_a = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
    rabbasca_cloud_a.name = "rabbasca_cloud_a"
    -- rabbasca_cloud_a.color = {64.0/255.0 * 0.25, 31.0/255.0 * 0.25, 126.0/255.0 * 0.25, 1.0 * 0.25}
    rabbasca_cloud_a.color = {34.0/255.0 * 0.5, 25.0/255.0 * 0.5, 63.0/255.0 * 0.5, 1.0 * 0.5}
    rabbasca_cloud_a.animation.filename = "__celestial-weather-additions__/graphics/vfx/cloud-c.png"
    rabbasca_cloud_a.animation.frame_count = 1
    rabbasca_cloud_a.animation.size = 512
    rabbasca_cloud_a.animation.blend_mode = "additive"
    rabbasca_cloud_a.start_scale = 3.0
    rabbasca_cloud_a.end_scale = 5.0
    rabbasca_cloud_a.duration = 120
    rabbasca_cloud_a.fade_in_duration = 40
    rabbasca_cloud_a.fade_away_duration = 40
    data:extend({rabbasca_cloud_a})

    local rabbasca_weather_cloud_a = table.deepcopy(direct_particles)
    rabbasca_weather_cloud_a.action_delivery.source_effects.smoke_name = "rabbasca_cloud_a"
    rabbasca_weather_cloud_a.action_delivery.source_effects.speed = {-0.16, 0.04}
    rabbasca_weather_cloud_a.action_delivery.source_effects.speed_multiplier = 1.0
    rabbasca_weather_cloud_a.action_delivery.source_effects.repeat_count = 1
    rabbasca_weather_cloud_a.action_delivery.source_effects.probability = 0.1

    table.insert(rabbasca_effects, rabbasca_weather_cloud_a)

    local rabbasca_cloud_b = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
    rabbasca_cloud_b.name = "rabbasca_cloud_b"
    -- rabbasca_cloud_b.color = {41.0/255.0 * 0.25, 31.0/255.0 * 0.25, 126.0/255.0 * 0.25, 1.0 * 0.25}
    rabbasca_cloud_b.color = {57.0/255.0 * 0.5, 48.0/255.0 * 0.5, 63.0/255.0 * 0.5, 1.0 * 0.5}
    rabbasca_cloud_b.animation.filename = "__celestial-weather-additions__/graphics/vfx/cloud-a.png"
    rabbasca_cloud_b.animation.frame_count = 1
    rabbasca_cloud_b.animation.size = 512
    rabbasca_cloud_b.animation.blend_mode = "additive"
    rabbasca_cloud_b.start_scale = 3.0
    rabbasca_cloud_b.end_scale = 5.0
    rabbasca_cloud_b.duration = 120
    rabbasca_cloud_b.fade_in_duration = 40
    rabbasca_cloud_b.fade_away_duration = 40
    data:extend({rabbasca_cloud_b})

    local rabbasca_weather_cloud_b = table.deepcopy(direct_particles)
    rabbasca_weather_cloud_b.action_delivery.source_effects.smoke_name = "rabbasca_cloud_b"
    rabbasca_weather_cloud_b.action_delivery.source_effects.speed = {-0.21, -0.03}
    rabbasca_weather_cloud_b.action_delivery.source_effects.speed_multiplier = 1.0
    rabbasca_weather_cloud_b.action_delivery.source_effects.repeat_count = 1
    rabbasca_weather_cloud_b.action_delivery.source_effects.probability = 0.1

    table.insert(rabbasca_effects, rabbasca_weather_cloud_b)
end


if true then
    local rabbasca_sparks = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
    rabbasca_sparks.name = "rabbasca_sparks"
    rabbasca_sparks.color = {1.0, 0.5, 1.0}
    rabbasca_sparks.start_scale = 0.25
    rabbasca_sparks.end_scale = 0.25
    rabbasca_sparks.duration = 60
    rabbasca_sparks.fade_in_duration = 30
    rabbasca_sparks.fade_away_duration = 30
    rabbasca_sparks.render_layer = "smoke"
    rabbasca_sparks.animation.filename = "__celestial-weather-additions__/graphics/vfx/pointy-spark-a.png"
    rabbasca_sparks.animation.frame_count = 100
    rabbasca_sparks.animation.line_length = 10
    rabbasca_sparks.animation.size = math.floor(2048 / 10)
    rabbasca_sparks.animation.animation_speed = 20.0
    rabbasca_sparks.animation.blend_mode = "additive"
    data:extend({rabbasca_sparks})

    local rabbasca_weather_sparks = table.deepcopy(direct_particles)
    rabbasca_weather_sparks.action_delivery.source_effects.smoke_name = "rabbasca_sparks"
    rabbasca_weather_sparks.action_delivery.source_effects.speed = {0.0, 0.0}
    rabbasca_weather_sparks.action_delivery.source_effects.speed_multiplier = 1.0
    rabbasca_weather_sparks.action_delivery.source_effects.repeat_count = 1
    rabbasca_weather_sparks.action_delivery.source_effects.probability = 0.15

    table.insert(rabbasca_effects, rabbasca_weather_sparks)
end


if true then
    local rabbasca_sparks_small = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
    rabbasca_sparks_small.name = "rabbasca_sparks_small"
    rabbasca_sparks_small.color = {1.0, 0.5, 1.0}
    rabbasca_sparks_small.start_scale = 0.1
    rabbasca_sparks_small.end_scale = 0.1
    rabbasca_sparks_small.duration = 60
    rabbasca_sparks_small.fade_in_duration = 30
    rabbasca_sparks_small.fade_away_duration = 30
    rabbasca_sparks_small.render_layer = "smoke"
    rabbasca_sparks_small.animation.filename = "__celestial-weather-additions__/graphics/vfx/pointy-spark-a.png"
    rabbasca_sparks_small.animation.frame_count = 100
    rabbasca_sparks_small.animation.line_length = 10
    rabbasca_sparks_small.animation.size = math.floor(2048 / 10)
    rabbasca_sparks_small.animation.animation_speed = 20.0
    rabbasca_sparks_small.animation.blend_mode = "additive"
    data:extend({rabbasca_sparks_small})

    local rabbasca_weather_sparks_small = table.deepcopy(direct_particles)
    rabbasca_weather_sparks_small.action_delivery.source_effects.smoke_name = "rabbasca_sparks_small"
    rabbasca_weather_sparks_small.action_delivery.source_effects.speed = {0.0, 0.0}
    rabbasca_weather_sparks_small.action_delivery.source_effects.speed_multiplier = 1.0
    rabbasca_weather_sparks_small.action_delivery.source_effects.repeat_count = 1
    rabbasca_weather_sparks_small.action_delivery.source_effects.probability = 0.3

    table.insert(rabbasca_effects, rabbasca_weather_sparks_small)
end


if true then
    local rabbasca_sparks_large = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
    rabbasca_sparks_large.name = "rabbasca_sparks_large"
    rabbasca_sparks_large.color = {1.0, 0.5, 1.0}
    rabbasca_sparks_large.start_scale = 0.5
    rabbasca_sparks_large.end_scale = 0.5
    rabbasca_sparks_large.duration = 30
    rabbasca_sparks_large.fade_in_duration = 15
    rabbasca_sparks_large.fade_away_duration = 15
    rabbasca_sparks_large.render_layer = "smoke"
    rabbasca_sparks_large.animation.filename = "__celestial-weather-additions__/graphics/vfx/pointy-spark-a.png"
    rabbasca_sparks_large.animation.frame_count = 100
    rabbasca_sparks_large.animation.line_length = 10
    rabbasca_sparks_large.animation.size = math.floor(2048 / 10)
    rabbasca_sparks_large.animation.animation_speed = 20.0
    rabbasca_sparks_large.animation.blend_mode = "additive"
    data:extend({rabbasca_sparks_large})

    local rabbasca_weather_sparks_large = table.deepcopy(direct_particles)
    rabbasca_weather_sparks_large.action_delivery.source_effects.smoke_name = "rabbasca_sparks_large"
    rabbasca_weather_sparks_large.action_delivery.source_effects.speed = {0.0, 0.0}
    rabbasca_weather_sparks_large.action_delivery.source_effects.speed_multiplier = 1.0
    rabbasca_weather_sparks_large.action_delivery.source_effects.repeat_count = 1
    rabbasca_weather_sparks_large.action_delivery.source_effects.probability = 0.15

    table.insert(rabbasca_effects, rabbasca_weather_sparks_large)
end


if true then
    local rabbasca_dust = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
    rabbasca_dust.name = "rabbasca_dust"
    rabbasca_dust.color = {1.0, 0.5, 1.0}
    rabbasca_dust.start_scale = 2.0
    rabbasca_dust.end_scale = 2.0
    rabbasca_dust.animation.filename = "__celestial-weather__/graphics/entity/sand-particles.png"
    data.extend({rabbasca_dust})

    local rabbasca_weather_dust = table.deepcopy(cluster_particles)
    rabbasca_weather_dust.cluster_count = 2
    rabbasca_weather_dust.action_delivery.source_effects.smoke_name= "rabbasca_dust"
    rabbasca_weather_dust.action_delivery.source_effects.speed = {-0.35, 0.0}
    rabbasca_weather_dust.action_delivery.source_effects.speed_multiplier = 1.0

    table.insert(rabbasca_effects, rabbasca_weather_dust)
end


data.raw["planet"]["rabbasca"].ticks_between_player_effects = 1
data.raw["planet"]["rabbasca"].player_effects = rabbasca_effects





------ CUBIUM ------
local cubium_effects = table.deepcopy(data.raw["planet"]["cubium"].player_effects) or {}

if true then
    local cubium_cloud_a = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
    cubium_cloud_a.name = "cubium_cloud_a"
    cubium_cloud_a.color = {59.0/255.0 * 0.5, 36.0/255.0 * 0.5, 107.0/255.0 * 0.5, 1.0 * 0.5}
    cubium_cloud_a.animation.filename = "__celestial-weather-additions__/graphics/vfx/cloud-c.png"
    cubium_cloud_a.animation.frame_count = 1
    cubium_cloud_a.animation.size = 512
    cubium_cloud_a.animation.blend_mode = "additive"
    cubium_cloud_a.start_scale = 3.0
    cubium_cloud_a.end_scale = 5.0
    cubium_cloud_a.duration = 300
    cubium_cloud_a.fade_in_duration = 150
    cubium_cloud_a.fade_away_duration = 150
    data:extend({cubium_cloud_a})

    local cubium_weather_cloud_a = table.deepcopy(direct_particles)
    cubium_weather_cloud_a.action_delivery.source_effects.smoke_name = "cubium_cloud_a"
    cubium_weather_cloud_a.action_delivery.source_effects.speed = {0.08, 0.0}
    cubium_weather_cloud_a.action_delivery.source_effects.speed_multiplier = 1.0
    cubium_weather_cloud_a.action_delivery.source_effects.repeat_count = 1
    cubium_weather_cloud_a.action_delivery.source_effects.probability = 0.1

    table.insert(cubium_effects, cubium_weather_cloud_a)

    local cubium_cloud_b = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
    cubium_cloud_b.name = "cubium_cloud_b"
    cubium_cloud_b.color = {47.0/255.0 * 0.5, 63.0/255.0 * 0.5, 119.0/255.0 * 0.5, 1.0 * 0.5}
    cubium_cloud_b.animation.filename = "__celestial-weather-additions__/graphics/vfx/cloud-a.png"
    cubium_cloud_b.animation.frame_count = 1
    cubium_cloud_b.animation.size = 512
    cubium_cloud_b.animation.blend_mode = "additive"
    cubium_cloud_b.start_scale = 3.0
    cubium_cloud_b.end_scale = 5.0
    cubium_cloud_b.duration = 300
    cubium_cloud_b.fade_in_duration = 150
    cubium_cloud_b.fade_away_duration = 150
    data:extend({cubium_cloud_b})

    local cubium_weather_cloud_b = table.deepcopy(direct_particles)
    cubium_weather_cloud_b.action_delivery.source_effects.smoke_name = "cubium_cloud_b"
    cubium_weather_cloud_b.action_delivery.source_effects.speed = {0.11, 0.0}
    cubium_weather_cloud_b.action_delivery.source_effects.speed_multiplier = 1.0
    cubium_weather_cloud_b.action_delivery.source_effects.repeat_count = 1
    cubium_weather_cloud_b.action_delivery.source_effects.probability = 0.1

    table.insert(cubium_effects, cubium_weather_cloud_b)
end


if true then
    local cubium_sparks_small = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
    cubium_sparks_small.name = "cubium_sparks_small"
    cubium_sparks_small.color = {47.0/255.0 * 1.0, 63.0/255.0 * 1.0, 119.0/255.0 * 1.0, 1.0 * 1.0}
    cubium_sparks_small.start_scale = 0.2
    cubium_sparks_small.end_scale = 0.3
    cubium_sparks_small.duration = 120
    cubium_sparks_small.fade_in_duration = 40
    cubium_sparks_small.fade_away_duration = 40
    cubium_sparks_small.render_layer = "smoke"
    cubium_sparks_small.animation.filename = "__celestial-weather-additions__/graphics/vfx/pointy-spark-a.png"
    cubium_sparks_small.animation.frame_count = 100
    cubium_sparks_small.animation.line_length = 10
    cubium_sparks_small.animation.size = math.floor(2048 / 10)
    cubium_sparks_small.animation.animation_speed = 20.0
    cubium_sparks_small.animation.blend_mode = "additive"
    data:extend({cubium_sparks_small})

    local cubium_weather_sparks_small = table.deepcopy(direct_particles)
    cubium_weather_sparks_small.action_delivery.source_effects.smoke_name = "cubium_sparks_small"
    cubium_weather_sparks_small.action_delivery.source_effects.speed = {0.2, 0.0}
    cubium_weather_sparks_small.action_delivery.source_effects.speed_multiplier = 1.0
    cubium_weather_sparks_small.action_delivery.source_effects.repeat_count = 1
    cubium_weather_sparks_small.action_delivery.source_effects.probability = 1.0

    table.insert(cubium_effects, cubium_weather_sparks_small)
end


data.raw["planet"]["cubium"].ticks_between_player_effects = 1
data.raw["planet"]["cubium"].player_effects = cubium_effects





------ IGRYS ------
if true then
    local igrys_effects = table.deepcopy(data.raw["planet"]["igrys"].player_effects) or {}


    if true then
        local igrys_cloud_a = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
        igrys_cloud_a.name = "igrys_cloud_a"
        igrys_cloud_a.color = {177.0/255.0 * 0.2, 99.0/255.0 * 0.2, 20.0/255.0 * 0.2, 1.0 * 0.2}
        igrys_cloud_a.animation.filename = "__celestial-weather-additions__/graphics/vfx/cloud-c.png"
        igrys_cloud_a.animation.frame_count = 1
        igrys_cloud_a.animation.size = 512
        igrys_cloud_a.animation.blend_mode = "additive"
        igrys_cloud_a.start_scale = 3.0
        igrys_cloud_a.end_scale = 5.0
        igrys_cloud_a.duration = 120
        igrys_cloud_a.fade_in_duration = 60
        igrys_cloud_a.fade_away_duration = 60
        data:extend({igrys_cloud_a})

        local igrys_weather_cloud_a = table.deepcopy(direct_particles)
        igrys_weather_cloud_a.action_delivery.source_effects.smoke_name = "igrys_cloud_a"
        igrys_weather_cloud_a.action_delivery.source_effects.speed = {0.42, 0.0}
        igrys_weather_cloud_a.action_delivery.source_effects.speed_multiplier = 1.0
        igrys_weather_cloud_a.action_delivery.source_effects.repeat_count = 1
        igrys_weather_cloud_a.action_delivery.source_effects.probability = 0.1

        table.insert(igrys_effects, igrys_weather_cloud_a)

        local igrys_cloud_b = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
        igrys_cloud_b.name = "igrys_cloud_b"
        igrys_cloud_b.color = {177.0/255.0 * 0.2, 138.0/255.0 * 0.2, 81.0/255.0 * 0.2, 1.0 * 0.2}
        igrys_cloud_b.animation.filename = "__celestial-weather-additions__/graphics/vfx/cloud-a.png"
        igrys_cloud_b.animation.frame_count = 1
        igrys_cloud_b.animation.size = 512
        igrys_cloud_b.animation.blend_mode = "additive"
        igrys_cloud_b.start_scale = 3.0
        igrys_cloud_b.end_scale = 5.0
        igrys_cloud_b.duration = 120
        igrys_cloud_b.fade_in_duration = 60
        igrys_cloud_b.fade_away_duration = 60
        data:extend({igrys_cloud_b})

        local igrys_weather_cloud_b = table.deepcopy(direct_particles)
        igrys_weather_cloud_b.action_delivery.source_effects.smoke_name = "igrys_cloud_b"
        igrys_weather_cloud_b.action_delivery.source_effects.speed = {0.68, 0.0}
        igrys_weather_cloud_b.action_delivery.source_effects.speed_multiplier = 1.0
        igrys_weather_cloud_b.action_delivery.source_effects.repeat_count = 1
        igrys_weather_cloud_b.action_delivery.source_effects.probability = 0.1

        table.insert(igrys_effects, igrys_weather_cloud_b)
    end


    if true then
        local igrys_sparks = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
        igrys_sparks.name = "igrys_sparks"
        igrys_sparks.color = {1.0, 0.75, 0.5}
        igrys_sparks.start_scale = 0.25
        igrys_sparks.end_scale = 0.25
        igrys_sparks.duration = 60
        igrys_sparks.fade_in_duration = 20
        igrys_sparks.fade_away_duration = 20
        igrys_sparks.render_layer = "smoke"
        igrys_sparks.animation.filename = "__celestial-weather-additions__/graphics/vfx/star-a.png"
        igrys_sparks.animation.frame_count = 1
        igrys_sparks.animation.line_length = 1
        igrys_sparks.animation.size = 512
        igrys_sparks.animation.blend_mode = "additive"
        data:extend({igrys_sparks})

        local igrys_weather_sparks = table.deepcopy(direct_particles)
        igrys_weather_sparks.action_delivery.source_effects.smoke_name = "igrys_sparks"
        igrys_weather_sparks.action_delivery.source_effects.speed = {0.0, 0.0}
        igrys_weather_sparks.action_delivery.source_effects.speed_multiplier = 1.0
        igrys_weather_sparks.action_delivery.source_effects.repeat_count = 1
        igrys_weather_sparks.action_delivery.source_effects.probability = 0.2

        table.insert(igrys_effects, igrys_weather_sparks)
    end


    if true then
        local igrys_sparks_small = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
        igrys_sparks_small.name = "igrys_sparks_small"
        igrys_sparks_small.color = {1.0, 0.85, 0.5}
        igrys_sparks_small.start_scale = 0.1
        igrys_sparks_small.end_scale = 0.1
        igrys_sparks_small.duration = 60
        igrys_sparks_small.fade_in_duration = 20
        igrys_sparks_small.fade_away_duration = 20
        igrys_sparks_small.render_layer = "smoke"
        igrys_sparks_small.animation.filename = "__celestial-weather-additions__/graphics/vfx/star-a.png"
        igrys_sparks_small.animation.frame_count = 1
        igrys_sparks_small.animation.line_length = 1
        igrys_sparks_small.animation.size = 512
        igrys_sparks_small.animation.blend_mode = "additive"
        data:extend({igrys_sparks_small})

        local igrys_weather_sparks_small = table.deepcopy(direct_particles)
        igrys_weather_sparks_small.action_delivery.source_effects.smoke_name = "igrys_sparks_small"
        igrys_weather_sparks_small.action_delivery.source_effects.speed = {0.0, 0.0}
        igrys_weather_sparks_small.action_delivery.source_effects.speed_multiplier = 1.0
        igrys_weather_sparks_small.action_delivery.source_effects.repeat_count = 1
        igrys_weather_sparks_small.action_delivery.source_effects.probability = 0.4

        table.insert(igrys_effects, igrys_weather_sparks_small)
    end


    if true then
        local igrys_sparks_large = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
        igrys_sparks_large.name = "igrys_sparks_large"
        igrys_sparks_large.color = {1.0, 0.65, 0.5}
        igrys_sparks_large.start_scale = 0.5
        igrys_sparks_large.end_scale = 0.5
        igrys_sparks_large.duration = 60
        igrys_sparks_large.fade_in_duration = 20
        igrys_sparks_large.fade_away_duration = 20
        igrys_sparks_large.render_layer = "smoke"
        igrys_sparks_large.animation.filename = "__celestial-weather-additions__/graphics/vfx/star-a.png"
        igrys_sparks_large.animation.frame_count = 1
        igrys_sparks_large.animation.line_length = 1
        igrys_sparks_large.animation.size = 512
        igrys_sparks_large.animation.blend_mode = "additive"
        data:extend({igrys_sparks_large})

        local igrys_weather_sparks_large = table.deepcopy(direct_particles)
        igrys_weather_sparks_large.action_delivery.source_effects.smoke_name = "igrys_sparks_large"
        igrys_weather_sparks_large.action_delivery.source_effects.speed = {0.0, 0.0}
        igrys_weather_sparks_large.action_delivery.source_effects.speed_multiplier = 1.0
        igrys_weather_sparks_large.action_delivery.source_effects.repeat_count = 1
        igrys_weather_sparks_large.action_delivery.source_effects.probability = 0.2

        table.insert(igrys_effects, igrys_weather_sparks_large)
    end


    if true then
        local igrys_dust = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
        igrys_dust.name = "igrys_dust"
        igrys_dust.color = {1.0, 0.875, 0.75}
        igrys_dust.start_scale = 2.0
        igrys_dust.end_scale = 2.0
        igrys_dust.animation.filename = "__celestial-weather__/graphics/entity/sand-particles.png"
        data.extend({igrys_dust})

        local igrys_weather_dust = table.deepcopy(cluster_particles)
        igrys_weather_dust.cluster_count = 2
        igrys_weather_dust.action_delivery.source_effects.smoke_name= "igrys_dust"
        igrys_weather_dust.action_delivery.source_effects.speed = {0.65, 0.0}
        igrys_weather_dust.action_delivery.source_effects.speed_multiplier = 1.0

        table.insert(igrys_effects, igrys_weather_dust)
    end


    data.raw["planet"]["igrys"].ticks_between_player_effects = 1
    data.raw["planet"]["igrys"].player_effects = igrys_effects
end





------ PANGLIA ------
if true then
    local panglia_effects = table.deepcopy(data.raw["planet"]["panglia"].player_effects) or {}

    if true then
        local panglia_sparks = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
        panglia_sparks.name = "panglia_sparks"
        panglia_sparks.color = {126.0/255.0, 255.0/255.0, 236.0/255.0}
        panglia_sparks.start_scale = 0.5
        panglia_sparks.end_scale = 1.0
        panglia_sparks.duration = 180
        panglia_sparks.fade_in_duration = 60
        panglia_sparks.fade_away_duration = 60
        panglia_sparks.render_layer = "smoke"
        panglia_sparks.animation.filename = "__celestial-weather__/graphics/entity/fire-particles.png"
        -- panglia_sparks.animation.frame_count = 1
        -- panglia_sparks.animation.line_length = 1
        -- panglia_sparks.animation.size = 512
        panglia_sparks.animation.blend_mode = "additive"
        data:extend({panglia_sparks})

        local panglia_weather_sparks = table.deepcopy(cluster_particles)
        panglia_weather_sparks.action_delivery.source_effects.smoke_name = "panglia_sparks"
        panglia_weather_sparks.action_delivery.source_effects.speed = {0.0, -0.1}
        panglia_weather_sparks.action_delivery.source_effects.speed_multiplier = 1.0
        panglia_weather_sparks.action_delivery.source_effects.repeat_count = 1
        panglia_weather_sparks.action_delivery.source_effects.probability = 0.4

        table.insert(panglia_effects, panglia_weather_sparks)
    end


    if true then
        local panglia_sparks_small = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
        panglia_sparks_small.name = "panglia_sparks_small"
        panglia_sparks_small.color = {126.0/255.0, 255.0/255.0, 166.0/255.0}
        panglia_sparks_small.start_scale = 0.25
        panglia_sparks_small.end_scale = 0.5
        panglia_sparks_small.duration = 180
        panglia_sparks_small.fade_in_duration = 60
        panglia_sparks_small.fade_away_duration = 60
        panglia_sparks_small.render_layer = "smoke"
        panglia_sparks_small.animation.filename = "__celestial-weather__/graphics/entity/fire-particles.png"
        -- panglia_sparks_small.animation.frame_count = 1
        -- panglia_sparks_small.animation.line_length = 1
        -- panglia_sparks_small.animation.size = 512
        panglia_sparks_small.animation.blend_mode = "additive"
        data:extend({panglia_sparks_small})

        local panglia_weather_sparks_small = table.deepcopy(cluster_particles)
        panglia_weather_sparks_small.action_delivery.source_effects.smoke_name = "panglia_sparks_small"
        panglia_weather_sparks_small.action_delivery.source_effects.speed = {0.0, -0.15}
        panglia_weather_sparks_small.action_delivery.source_effects.speed_multiplier = 1.0
        panglia_weather_sparks_small.action_delivery.source_effects.repeat_count = 1
        panglia_weather_sparks_small.action_delivery.source_effects.probability = 0.8

        table.insert(panglia_effects, panglia_weather_sparks_small)
    end


    if true then
        local panglia_sparks_large = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
        panglia_sparks_large.name = "panglia_sparks_large"
        panglia_sparks_large.color = {126.0/255.0, 182.0/255.0, 255.0/255.0}
        panglia_sparks_large.start_scale = 1.0
        panglia_sparks_large.end_scale = 2.0
        panglia_sparks_large.duration = 180
        panglia_sparks_large.fade_in_duration = 60
        panglia_sparks_large.fade_away_duration = 60
        panglia_sparks_large.render_layer = "smoke"
        panglia_sparks_large.animation.filename = "__celestial-weather__/graphics/entity/fire-particles.png"
        -- panglia_sparks_large.animation.frame_count = 1
        -- panglia_sparks_large.animation.line_length = 1
        -- panglia_sparks_large.animation.size = 512
        panglia_sparks_large.animation.blend_mode = "additive"
        data:extend({panglia_sparks_large})

        local panglia_weather_sparks_large = table.deepcopy(cluster_particles)
        panglia_weather_sparks_large.action_delivery.source_effects.smoke_name = "panglia_sparks_large"
        panglia_weather_sparks_large.action_delivery.source_effects.speed = {0.0, -0.05}
        panglia_weather_sparks_large.action_delivery.source_effects.speed_multiplier = 1.0
        panglia_weather_sparks_large.action_delivery.source_effects.repeat_count = 1
        panglia_weather_sparks_large.action_delivery.source_effects.probability = 0.4

        table.insert(panglia_effects, panglia_weather_sparks_large)
    end


    if true then
        local panglia_cloud_a = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
        panglia_cloud_a.name = "panglia_cloud_a"
        panglia_cloud_a.color = {191.0/255.0 * 0.1, 255.0/255.0 * 0.1, 126.0/255.0 * 0.1, 1.0 * 0.1}
        panglia_cloud_a.animation.filename = "__celestial-weather-additions__/graphics/vfx/cloud-a.png"
        panglia_cloud_a.animation.frame_count = 1
        panglia_cloud_a.animation.size = 512
        panglia_cloud_a.animation.blend_mode = "additive"
        panglia_cloud_a.start_scale = 3.0
        panglia_cloud_a.end_scale = 5.0
        panglia_cloud_a.duration = 300
        panglia_cloud_a.fade_in_duration = 60
        panglia_cloud_a.fade_away_duration = 60
        data:extend({panglia_cloud_a})

        local panglia_weather_cloud_a = table.deepcopy(direct_particles)
        panglia_weather_cloud_a.action_delivery.source_effects.smoke_name = "panglia_cloud_a"
        panglia_weather_cloud_a.action_delivery.source_effects.speed = {0.0, -0.06}
        panglia_weather_cloud_a.action_delivery.source_effects.speed_multiplier = 1.0
        panglia_weather_cloud_a.action_delivery.source_effects.repeat_count = 1
        panglia_weather_cloud_a.action_delivery.source_effects.probability = 0.1

        table.insert(panglia_effects, panglia_weather_cloud_a)


        local panglia_cloud_b = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
        panglia_cloud_b.name = "panglia_cloud_b"
        panglia_cloud_b.color = {191.0/255.0 * 0.1, 255.0/255.0 * 0.1, 126.0/255.0 * 0.1, 1.0 * 0.1}
        panglia_cloud_b.animation.filename = "__celestial-weather-additions__/graphics/vfx/cloud-b.png"
        panglia_cloud_b.animation.frame_count = 1
        panglia_cloud_b.animation.size = 512
        panglia_cloud_b.animation.blend_mode = "additive"
        panglia_cloud_b.start_scale = 3.0
        panglia_cloud_b.end_scale = 5.0
        panglia_cloud_b.duration = 300
        panglia_cloud_b.fade_in_duration = 60
        panglia_cloud_b.fade_away_duration = 60
        data:extend({panglia_cloud_b})

        local panglia_weather_cloud_b = table.deepcopy(direct_particles)
        panglia_weather_cloud_b.action_delivery.source_effects.smoke_name = "panglia_cloud_b"
        panglia_weather_cloud_b.action_delivery.source_effects.speed = {0.0, -0.08}
        panglia_weather_cloud_b.action_delivery.source_effects.speed_multiplier = 1.0
        panglia_weather_cloud_b.action_delivery.source_effects.repeat_count = 1
        panglia_weather_cloud_b.action_delivery.source_effects.probability = 0.1

        table.insert(panglia_effects, panglia_weather_cloud_b)
    end

    
    if true then
        local panglia_dust = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
        panglia_dust.name = "panglia_dust"
        panglia_dust.color = {126.0/255.0, 255.0/255.0, 236.0/255.0}
        panglia_dust.animation.filename = "__celestial-weather__/graphics/entity/sand-particles.png"
        data.extend({panglia_dust})

        local panglia_weather_dust = table.deepcopy(cluster_particles)
        panglia_weather_dust.cluster_count = 2
        panglia_weather_dust.action_delivery.source_effects.smoke_name= "panglia_dust"
        panglia_weather_dust.action_delivery.source_effects.speed = {0.0, -0.32}
        panglia_weather_dust.action_delivery.source_effects.speed_multiplier = 1.0

        table.insert(panglia_effects, panglia_weather_dust)
    end


    data.raw["planet"]["panglia"].ticks_between_player_effects = 1
    data.raw["planet"]["panglia"].player_effects = panglia_effects
end
