-- technology.lua

-- Replacing vanilla science packs with custom ones that can be produced in space.

-- FACTORIO TECH TREE:
-- https://wiki.factorio.com/Technology
-- LEFT TO RIGHT, TOP TO BOTTOM

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