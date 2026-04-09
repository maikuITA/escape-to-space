-- technology.lua

-- Replacing vanilla science packs with custom ones that can be produced in space.

-- Gun turret
local gun_turret = data.raw["technology"]["gun-turret"]
if gun_turret then
    gun_turret.unit = {
        count = 10,
        ingredients = {
            {"earth-science-pack", 1}
        },
        time = 10,
    }
end

-- Lamp
local lamp = data.raw["technology"]["lamp"]
if lamp then
    lamp.unit = {
        count = 10,
        ingredients = {
            {"earth-science-pack", 1}
        },
        time = 15,
    }
end

-- Stone wall
local stone_wall = data.raw["technology"]["stone-wall"]
if stone_wall then
    stone_wall.unit = {
        count = 10,
        ingredients = {
            {"earth-science-pack", 1}
        },
        time = 10,
    }
end

-- Logistics
local logistics = data.raw["technology"]["logistics"]
if logistics then
    logistics.unit = {
        count = 20,
        ingredients = {
            {"earth-science-pack", 1}
        },
        time = 15,
    }
end

-- Radar
local radar = data.raw["technology"]["radar"]
if radar then
    radar.unit = {
        count = 10,
        ingredients = {
            {"earth-science-pack", 1}
        },
        time = 20,
    }
end

-- Repair pack
local repair_pack = data.raw["technology"]["repair-pack"]
if repair_pack then
    repair_pack.unit = {
        count = 25,
        ingredients = {
            {"earth-science-pack", 1}
        },
        time = 10,
    }
end

-- Fast inserter
local fast_inserter = data.raw["technology"]["fast-inserter"]
if fast_inserter then
    fast_inserter.unit = {
        count = 30,
        ingredients = {
            {"earth-science-pack", 1}
        },
        time = 15,
    }
end