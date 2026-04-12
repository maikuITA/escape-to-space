-- Load auxiliary functions
local IR2RB = require("code.functions")

local alternate_bases = (settings.startup["rail-style"].value == "ir3-alt")
local arrow_glow = settings.startup["arrow-glow"].value
local belt_glow = settings.startup["rail-glow"].value

-- Define each vanilla belt's parameters (tier color (as a hue), railing material, default arrows)
local belts = {
	["transport"] = { hue = 0.11, base = alternate_bases and "copper" or "steel", arrows = "arrow" },
	["fast-transport"] = { hue = 0, base = alternate_bases and "iron" or "steel", arrows = "arrow-doubled" },
	["express-transport"] = { hue = 0.54, base = "steel", arrows = "arrow-doubled" },
}

-- Add space age compatibility (turbo belts)
if mods["space-age"] or mods["TurboBelt"] then
   	belts["turbo-transport"] = { hue = 0.23, base = alternate_bases and "tungsten" or "steel", arrows = "arrow-quadrupled" }
end

-- Procedurally generate each belt's new animations
for belt,beltdata in pairs(belts) do

	-- Convert belt tint, define arrow type, retrieve belt prototype
	local tint = IR2RB.hsva2rgba(beltdata.hue, beltdata.sat or 0.8, beltdata.val or 1)
	local arrows = (arrow_style ~= "arrows") and arrow_style or beltdata.arrows
	local prototype = data.raw["transport-belt"][belt.."-belt"]

	-- Check if thicker turbo arrows is enabled and turns the arrows thick
	-- if settings.startup["thick-turbo-arrows"].value and arrows == "arrow-quadrupled" then
	-- 	arrows = arrows.."-thick" end

	if prototype then
		-- Change each belt entity's animations
		prototype.belt_animation_set.animation_set = IR2RB.get_belt_animation_set(tint, beltdata.base, arrows, arrow_glow, belt_glow)
		
		-- Turn on/off the animation offset, ensuring the turbo belt-style arrows are displayed properly
		if arrows == "arrow-quadrupled" or arrows == "arrow-quadrupled-thick" then
			prototype.belt_animation_set.alternate = true
		else
			prototype.belt_animation_set.alternate = false end

		-- Replace belt remnant with generic stuff
		prototype.corpse = "small-remnants"
		-- Change the belt icons
		IR2RB.replace_item_icon(belt.."-belt", "rubber-belt-"..beltdata.base)

		-- Add arrows/stripes to the belt icon if they're active
		if (settings.startup["arrow-style"].value == "line-thick") or (settings.startup["arrow-style"].value == "line-thin") or (settings.startup["arrow-style"].value == "line-side") then
			IR2RB.add_mask_to_item_icon(belt.."-belt", "rubber-belt-mask-"..(settings.startup["arrow-style"].value), tint, arrow_glow)
		elseif (settings.startup["arrow-style"].value ~= "no-arrows") then
			IR2RB.add_mask_to_item_icon(belt.."-belt", "rubber-belt-mask", tint, arrow_glow) end
		
		-- Add colored rails to the icon if colored rails is on
		if (settings.startup["rail-style"].value == "colored") then
			IR2RB.add_mask_to_item_icon(belt.."-belt", "rubber-rail-mask", tint, belt_glow) end
		-- Links each new belt's item icon to the belt's entity
		IR2RB.copy_item_icons_to_entity("transport-belt", belt.."-belt")
	end
end

-- Replace the "logistics" section's icon with a custom icon with black belts
local tab = data.raw["item-group"]["logistics"]
if tab then
	tab.icon = IR2RB.get_icon_path("logistics", "item-group")
	tab.icon_size = 256
	tab.icon_mipmaps = 4
	tab.icons = nil
end

-- Add extra sprites for the settings
require("code.settings-icons")

------------------------------------------------------------------------------------------------------------------------------------------------------