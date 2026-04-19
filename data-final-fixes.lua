-- data.final-fixes.lua

--------------------------------------------------------------------------
--- START BOB'S ADJUSTABLE INSERTERS

if
  (settings.startup["bobmods-inserters-long1"].value == true)
  or (
    settings.startup["bobmods-logistics-inserteroverhaul"]
    and settings.startup["bobmods-logistics-inserteroverhaul"].value == true
  )
then
    local bob_long_inserters_1 = data.raw.technology["bob-long-inserters-1"]
    if bob_long_inserters_1 then
        bob_long_inserters_1.prerequisites = {
            "fast-inserter",
        }
        bob_long_inserters_1.unit = {
            count = 100,
            ingredients = {
                {"basic-memory-card", 1},
            },
            time = 10,
        }
        bob_long_inserters_1.hidden = false
        bob_long_inserters_1.enabled = true
    end

    local bob_long_inserters_2 = data.raw.technology["bob-long-inserters-2"]
    if settings.startup["bobmods-inserters-long2"].value == true and bob_long_inserters_2 then
        bob_long_inserters_2.prerequisites = {
          "bob-long-inserters-1",
          "fast-inserter",
        }
        bob_long_inserters_2.unit = {
          count = 100,
            ingredients = {
                {"basic-memory-card", 1},
            },
            time = 10,
        }
        bob_long_inserters_2.hidden = false
        bob_long_inserters_2.enabled = true
    end

    local bob_near_inserters = data.raw.technology["bob-near-inserters"]
    if bob_near_inserters then
        bob_near_inserters.prerequisites = {
            "fast-inserter",
        }
        bob_near_inserters.unit = {
            count = 100,
            ingredients = {
                {"basic-memory-card", 1},
            },
            time = 10,
        }
        bob_near_inserters.hidden = false
        bob_near_inserters.enabled = true
    end

    local bob_more_inserters_1 = data.raw.technology["bob-more-inserters-1"]
    if bob_more_inserters_1 then
        bob_more_inserters_1.prerequisites = {
            "fast-inserter",
        }
        bob_more_inserters_1.unit = {
            count = 100,
            ingredients = {
                {"basic-memory-card", 1},
            },
            time = 10,
        }
        bob_more_inserters_1.hidden = false
        bob_more_inserters_1.enabled = true
    end

    local bob_more_inserters_2 = data.raw.technology["bob-more-inserters-2"]
    if settings.startup["bobmods-inserters-more2"].value == true and bob_more_inserters_2 then
        bob_more_inserters_2.prerequisites = {
            "bob-more-inserters-1",
            "fast-inserter",
        }
        bob_more_inserters_2.unit = {
            count = 100,
            ingredients = {
                {"basic-memory-card", 1},
            },
            time = 10,
        }
        bob_more_inserters_2.hidden = false
        bob_more_inserters_2.enabled = true
    end
end

-- END BOB'S ADJUSTABLE INSERTERS
--------------------------------------------------------------------------