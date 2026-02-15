local templates = {}

------ Fog ------
local t_fog = {
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

templates.fog = t_fog

------ Direct Particles ------
local t_direct_particles = {
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

templates.direct_particles = t_direct_particles


------ Cluster Particles ------
local t_cluster_particles = {
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

templates.cluster_particles = t_cluster_particles



return templates