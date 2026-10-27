local common_effects = require("common.common-effects")

mu_effects = {data.raw["planet"]["muluna"].player_effects} or {}

if settings.startup["shibadisaster-cwa-muluna-enable-dust"].value then
    local mu_dust = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
    mu_dust.name = "mu_dust"
    mu_dust.color = {0.670, 0.682, 0.674}
    mu_dust.animation.filename = "__celestial-weather-additions__/graphics/vfx/sand-particles.png"
    data:extend{(mu_dust)}
    
    mu_weather = table.deepcopy(common_effects.direct_particles)
    mu_weather.cluster_count = settings.startup["shibadisaster-cwa-muluna-dust-particle-amount"].value
    mu_weather.action_delivery.source_effects.smoke_name= "mu_dust"
    mu_weather.action_delivery.source_effects.speed = {-0.28, 0.36}
    mu_weather.action_delivery.source_effects.speed_multiplier = 0.2 * settings.startup["shibadisaster-cwa-muluna-dust-speed-multiplier"].value

    table.insert(mu_effects, mu_weather)
end


if #mu_effects >= 1 then
    data.raw["planet"]["muluna"].ticks_between_player_effects = 1
    data.raw["planet"]["muluna"].player_effects = mu_effects
end