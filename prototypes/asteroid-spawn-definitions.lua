local asteroid_util = {}

local nauvis_prob = 0.0125
local axos_prob = 0.0250
local keria_prob = 0.0250

local function percentile (prob, perc)
    return (prob*perc)/100
end

asteroid_util.nauvis_axos = {
    probability_on_range_chunk = {
        {position = 0.1, probability = percentile(nauvis_prob, 1) , angle_when_stopped = 1.0},
        {position = 0.2, probability = percentile(nauvis_prob, 100), angle_when_stopped = 1.0},
        {position = 0.6, probability = percentile(axos_prob, 35), angle_when_stopped = 1.0},
        {position = 0.9, probability = percentile(axos_prob, 100), angle_when_stopped = 1.0}
    }
}
 
asteroid_util.nauvis_keria = {
    probability_on_range_chunk = {
        {position = 0.1, probability = percentile(nauvis_prob, 1) , angle_when_stopped = 1.0},
        {position = 0.2, probability = percentile(nauvis_prob, 100), angle_when_stopped = 1.0},
        {position = 0.6, probability = percentile(keria_prob, 35), angle_when_stopped = 1.0},
        {position = 0.9, probability = percentile(keria_prob, 100), angle_when_stopped = 1.0}
    }
}

asteroid_util.axos_keria = {
    probability_on_range_chunk = {
        {position = 0.1, probability = percentile(axos_prob, 1) , angle_when_stopped = 1.0},
        {position = 0.2, probability = percentile(axos_prob, 100), angle_when_stopped = 1.0},
        {position = 0.6, probability = percentile(keria_prob, 35), angle_when_stopped = 1.0},
        {position = 0.9, probability = percentile(keria_prob, 100), angle_when_stopped = 1.0}
    }
}

asteroid_util.nauvis_prob = nauvis_prob
asteroid_util.axos_prob = axos_prob
asteroid_util.keria_prob = keria_prob

return asteroid_util