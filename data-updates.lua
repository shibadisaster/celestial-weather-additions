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





------ Rubia ------
-- change particle appearance
local rubia_rain_lines = data.raw["trivial-smoke"]["rubia-rain-lines"]
rubia_rain_lines.color = {0.822, 0.700, 0.564, 1.0}
rubia_rain_lines.start_scale = 3.0
rubia_rain_lines.end_scale = 3.0
rubia_rain_lines.fade_in_duration = 10
rubia_rain_lines.fade_away_duration = 10
rubia_rain_lines.duration = 80

local rubia_sand = data.raw["trivial-smoke"]["rubia-sand"]
rubia_sand.color = {0.822, 0.700, 0.564, 1.0}
rubia_sand.start_scale = 5.0
rubia_sand.end_scale = 5.0
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










------ Vesta ------
local vesta_fog = table.deepcopy(fog)
vesta_fog.color1 = {0.682, 0.500, 0.635, 1.0}
vesta_fog.color2 = {0.682, 0.500, 0.635, 1.0}
vesta_fog.tick_factor = 0.00003
vesta_fog.detail_noise_texture.filename = "__celestial-weather__/graphics/entity/dense-clouds.png"

data.raw["planet"]["vesta"].surface_render_parameters["fog"] = vesta_fog
data.raw["planet"]["vesta"].surface_render_parameters["clouds"] = nil





------ Muria ------
local muria_fog = table.deepcopy(fog)
muria_fog.color1 = {0.790, 1.0, 0.0, 0.2}
muria_fog.color2 = {0.790, 1.0, 0.0, 0.2}
muria_fog.tick_factor = 0.0001
muria_fog.detail_noise_texture.filename = "__celestial-weather__/graphics/entity/dense-clouds.png"

data.raw["planet"]["muria"].surface_render_parameters["fog"] = muria_fog


local muria_effects = table.deepcopy(data.raw["planet"]["muria"].player_effects)

-- acid spores
local muria_acid = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
muria_acid.name = "muria_acid"
muria_acid.color = {0.83, 0.35, 0.52}
muria_acid.animation.filename = "__celestial-weather__/graphics/entity/fire-particles.png"
data:extend({muria_acid})

local muria_weather_acid = table.deepcopy(direct_particles)
muria_weather_acid.action_delivery.source_effects = {
    muria_weather_acid.action_delivery.source_effects
}
muria_weather_acid.action_delivery.source_effects[1].smoke_name = "muria_acid"
muria_weather_acid.action_delivery.source_effects[1].speed = {0.0, 0.0}
muria_weather_acid.action_delivery.source_effects[1].speed_multiplier = 1.0
muria_weather_acid.action_delivery.source_effects[1].repeat_count = 20

-- muria_weather_acid.action_delivery.source_effects.smoke_name = "muria_acid"
-- muria_weather_acid.action_delivery.source_effects.speed = {0.0, 0.0}
-- muria_weather_acid.action_delivery.source_effects.speed_multiplier = 1.0
-- muria_weather_acid.action_delivery.source_effects.repeat_count = 10

-- implement
data.raw["planet"]["muria"].ticks_between_player_effects = 1
table.insert(muria_effects, muria_weather_acid)

data.raw["planet"]["muria"].player_effects = muria_effects





------ Paracelsin ------
local paracelsin_snow = data.raw["trivial-smoke"]["pa_snow"]
paracelsin_snow.color = {0.188, 0.188, 0.188, 1.0}
paracelsin_snow.start_scale = 0.8
paracelsin_snow.end_scale = 0.8