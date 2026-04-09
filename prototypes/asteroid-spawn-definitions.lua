local asteroid_functions = {}

local nauvis_prob = 0.1
local axos_prob = 0.1
local keria_prob = 0.1

asteroid_functions.nauvis_axos = {
    probability_on_range_chunk = {
        {position = 0.1, probability = nauvis_prob , angle_when_stopped = 1.0},
        {position = 0.9, probability = axos_prob, angle_when_stopped = 1.0}
    }
}

asteroid_functions.nauvis_keria = {
    probability_on_range_chunk = {
        {position = 0.1, probability = nauvis_prob , angle_when_stopped = 1.0},
        {position = 0.9, probability = keria_prob, angle_when_stopped = 1.0}
    }
}

return asteroid_functions