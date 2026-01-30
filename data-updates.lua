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
-- change particle appearance
local rubia_rain_lines = data.raw["trivial-smoke"]["rubia-rain-lines"]
rubia_rain_lines.color = {0.822, 0.700, 0.564, 1.0}
rubia_rain_lines.start_scale = 2.5
rubia_rain_lines.end_scale = 2.5
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


-- change speed of effect
local rubia_effects = table.deepcopy(data.raw["planet"]["rubia"].player_effects)

for _, effect in ipairs(rubia_effects) do
    effect.action_delivery.source_effects.speed_multiplier = 10
end

data.raw["planet"]["rubia"].player_effects = rubia_effects


-- add overlay fog
local rubia_fog = table.deepcopy(fog)
rubia_fog.color1 = {0.822, 0.700, 0.564, 0.5}
rubia_fog.color2 = {0.822, 0.700, 0.564, 0.5}
rubia_fog.tick_factor = 0.003
rubia_fog.detail_noise_texture.filename = "__celestial-weather__/graphics/entity/dense-clouds.png"

data.raw["planet"]["rubia"].surface_render_parameters["fog"] = rubia_fog










------ VESTA ------
local vesta_fog = table.deepcopy(fog)
vesta_fog.color1 = {0.682, 0.500, 0.635, 1.0}
vesta_fog.color2 = {0.682, 0.500, 0.635, 1.0}
vesta_fog.tick_factor = 0.00003
vesta_fog.detail_noise_texture.filename = "__celestial-weather__/graphics/entity/dense-clouds.png"

data.raw["planet"]["vesta"].surface_render_parameters["fog"] = vesta_fog
data.raw["planet"]["vesta"].surface_render_parameters["clouds"] = nil


-- note to self/whoever is reading this: since vesta didn't have existing player_effects, we can just add to player_effects like normal
local vesta_effects = {}

-- vesta thick clouds
local vesta_thick_clouds = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
vesta_thick_clouds.name = "vesta_thick_clouds"
vesta_thick_clouds.color = {0.843, 0.757, 0.824, 0.2}
vesta_thick_clouds.start_scale = 4.0
vesta_thick_clouds.end_scale = 4.0
vesta_thick_clouds.duration = 240
vesta_thick_clouds.fade_in_duration = 120
vesta_thick_clouds.fade_away_duration = 120
vesta_thick_clouds.animation.filename = "__celestial-weather-extensions__/graphics/vfx/diffuse-cloud.png"
vesta_thick_clouds.animation.frame_count = 1
vesta_thick_clouds.animation.size = 512
data:extend({vesta_thick_clouds})

local vesta_thick_clouds_white_a = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
vesta_thick_clouds_white_a.name = "vesta_clouds_white_a"
vesta_thick_clouds_white_a.color = {0.3, 0.3, 0.3, 0.1}
vesta_thick_clouds_white_a.start_scale = 3.0
vesta_thick_clouds_white_a.end_scale = 3.0
vesta_thick_clouds_white_a.duration = 240
vesta_thick_clouds_white_a.fade_in_duration = 120
vesta_thick_clouds_white_a.fade_away_duration = 120
vesta_thick_clouds_white_a.animation.filename = "__celestial-weather-extensions__/graphics/vfx/cloud-a.png"
vesta_thick_clouds_white_a.animation.frame_count = 1
vesta_thick_clouds_white_a.animation.size = 512
data:extend({vesta_thick_clouds_white_a})

local vesta_thick_clouds_white_b = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
vesta_thick_clouds_white_b.name = "vesta_clouds_white_b"
vesta_thick_clouds_white_b.color = {0.3, 0.3, 0.3, 0.1}
vesta_thick_clouds_white_b.start_scale = 3.0
vesta_thick_clouds_white_b.end_scale = 3.0
vesta_thick_clouds_white_b.duration = 240
vesta_thick_clouds_white_b.fade_in_duration = 120
vesta_thick_clouds_white_b.fade_away_duration = 120
vesta_thick_clouds_white_b.animation.filename = "__celestial-weather-extensions__/graphics/vfx/cloud-b.png"
vesta_thick_clouds_white_b.animation.frame_count = 1
vesta_thick_clouds_white_b.animation.size = 512
data:extend({vesta_thick_clouds_white_b})

local vesta_thick_clouds_white_c = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
vesta_thick_clouds_white_c.name = "vesta_clouds_white_c"
vesta_thick_clouds_white_c.color = {0.3, 0.3, 0.3, 0.1}
vesta_thick_clouds_white_c.start_scale = 3.0
vesta_thick_clouds_white_c.end_scale = 3.0
vesta_thick_clouds_white_c.duration = 240
vesta_thick_clouds_white_c.fade_in_duration = 120
vesta_thick_clouds_white_c.fade_away_duration = 120
vesta_thick_clouds_white_c.animation.filename = "__celestial-weather-extensions__/graphics/vfx/cloud-c.png"
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
vesta_weather_thick_clouds_white_a.action_delivery.source_effects.probability = 0.2
vesta_weather_thick_clouds_white_a.action_delivery.source_effects.movement_slow_down_factor = 0.0

local vesta_weather_thick_clouds_white_b = table.deepcopy(direct_particles)
vesta_weather_thick_clouds_white_b.action_delivery.source_effects.smoke_name = "vesta_clouds_white_b"
vesta_weather_thick_clouds_white_b.action_delivery.source_effects.speed = {0.0, 0.0}
vesta_weather_thick_clouds_white_b.action_delivery.source_effects.speed_multiplier = 0.0
vesta_weather_thick_clouds_white_b.action_delivery.source_effects.probability = 0.2
vesta_weather_thick_clouds_white_b.action_delivery.source_effects.movement_slow_down_factor = 0.0

local vesta_weather_thick_clouds_white_c = table.deepcopy(direct_particles)
vesta_weather_thick_clouds_white_c.action_delivery.source_effects.smoke_name = "vesta_clouds_white_c"
vesta_weather_thick_clouds_white_c.action_delivery.source_effects.speed = {0.0, 0.0}
vesta_weather_thick_clouds_white_c.action_delivery.source_effects.speed_multiplier = 0.0
vesta_weather_thick_clouds_white_c.action_delivery.source_effects.probability = 0.2
vesta_weather_thick_clouds_white_c.action_delivery.source_effects.movement_slow_down_factor = 0.0

table.insert(vesta_effects, vesta_weather_thick_clouds)
table.insert(vesta_effects, vesta_weather_thick_clouds_white_a)
table.insert(vesta_effects, vesta_weather_thick_clouds_white_b)
table.insert(vesta_effects, vesta_weather_thick_clouds_white_c)

data.raw["planet"]["vesta"].player_effects = vesta_effects






------ MURIA ------
local muria_fog = table.deepcopy(fog)
muria_fog.color1 = {0.790, 1.0, 0.0, 0.4}
muria_fog.color2 = {0.790, 1.0, 0.0, 0.4}
muria_fog.tick_factor = 0.00003
muria_fog.detail_noise_texture.filename = "__celestial-weather__/graphics/entity/dense-clouds.png"

data.raw["planet"]["muria"].surface_render_parameters["fog"] = muria_fog


-- note to self/whoever is reading this: since muria already has an existing effect (rain), idk how to add my effect on top elegantly, if anyone knows how please leave something on the discussions page
--     this was the first way i figured out to do this that worked, but refer to vesta effects to see a better way to do this
local muria_effects = {table.deepcopy(data.raw["planet"]["muria"].player_effects.action_delivery)}


-- acid spores
local muria_large_acid_spore = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
muria_large_acid_spore.name = "muria_large_acid_spore"
muria_large_acid_spore.color = {0.83, 0.35, 0.52}
muria_large_acid_spore.animation.filename = "__celestial-weather__/graphics/entity/fire-particles.png"
muria_large_acid_spore.start_scale = 0.0
muria_large_acid_spore.end_scale = 2.0
data:extend({muria_large_acid_spore})

local muria_small_acid_spore = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
muria_small_acid_spore.name = "muria_small_acid_spore"
muria_small_acid_spore.color = {0.83, 0.35, 0.52}
muria_small_acid_spore.animation.filename = "__celestial-weather__/graphics/entity/fire-particles.png"
muria_small_acid_spore.start_scale = 0.0
muria_small_acid_spore.end_scale = 1.0
data:extend({muria_small_acid_spore})


local muria_weather_large_acid = table.deepcopy(direct_particles)
muria_weather_large_acid.action_delivery.source_effects.smoke_name = "muria_large_acid_spore"
muria_weather_large_acid.action_delivery.source_effects.speed = {0.0, 0.0}
muria_weather_large_acid.action_delivery.source_effects.speed_multiplier = 5.0
muria_weather_large_acid.action_delivery.source_effects.repeat_count = 1
muria_weather_large_acid.action_delivery.source_effects.probability = 0.5

local muria_weather_small_acid = table.deepcopy(direct_particles)
muria_weather_small_acid.action_delivery.source_effects.smoke_name = "muria_small_acid_spore"
muria_weather_small_acid.action_delivery.source_effects.speed = {0.0, 0.0}
muria_weather_small_acid.action_delivery.source_effects.speed_multiplier = 5.0
muria_weather_small_acid.action_delivery.source_effects.repeat_count = 1
muria_weather_small_acid.action_delivery.source_effects.probability = 0.5

table.insert(muria_effects, muria_weather_large_acid.action_delivery)
table.insert(muria_effects, muria_weather_small_acid.action_delivery)

data.raw["planet"]["muria"].ticks_between_player_effects = 1
data.raw["planet"]["muria"].player_effects.action_delivery = muria_effects





------ PARACELSIN ------
local paracelsin_snow = data.raw["trivial-smoke"]["pa_snow"]
paracelsin_snow.color = {0.188, 0.188, 0.188, 1.0}
paracelsin_snow.start_scale = 0.8
paracelsin_snow.end_scale = 0.8