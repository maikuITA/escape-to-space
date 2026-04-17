------------------------------------------------------------------------------------------------------------------------------------------------------

-- FUNCTIONS for belt edits
-- Originally written by Deadlock989
-- Annotated and modified by Supershadow30

------------------------------------------------------------------------------------------------------------------------------------------------------
-- Compile the entirety of the code in a dictionnary of functions
local F = {}

F.graphics_path = "__escape-to-space__/prototypes/custom-belts/graphics"
F.icons_path = F.graphics_path .. "/icons/64"
F.sprites_path = F.graphics_path .. "/entities"
F.setting_icons_path = F.icons_path .. "/settings"

-- Find the file path of an icon in the graphics folder
function F.get_icon_path(name, dir)
	return string.format("%s/%s.png", F.graphics_path .. "/" .. (dir or "icons/64"), name)
end

-- Replaces old item icon (e.g. belt) with the new one (e.g. rubber belt)
function F.replace_item_icon(item_name, icon, entity_type, entity_name)
	if not icon then icon = item_name end
	local item = data.raw.item[item_name] or data.raw.fluid[item_name] or data.raw.tool[item_name] or data.raw.module[item_name]
	item.icon = F.get_icon_path(icon)
	item.icons = nil
	item.icon_size = 64
	item.icon_mipmaps = 4
	item.pictures = nil
end

-- Adds a mask to an item's icon (e.g. belt arrow, colored railing)
function F.add_mask_to_item_icon(item_name, icon, tint)
	local item = data.raw.item[item_name] or data.raw.fluid[item_name] or data.raw.tool[item_name] or data.raw.module[item_name]
	if item.icons == nil then
		item.icons = item.icon ~= nil and {{icon = item.icon, icon_size = item.icon_size, icon_mipmaps = item.icon_mipmaps }} or {}
	end
	table.insert(item.icons, 
		{ icon = F.get_icon_path(icon), icon_size = 64, icon_mipmaps = 4, tint = tint }
	)
end

-- Adds a new icon to an existing entity
function F.copy_item_icons_to_entity(entity_type, name)
	local entity = data.raw[entity_type][name]
	local item = data.raw.item[name]
	if entity and item then
		entity.icon = item.icon
		entity.icon_size = item.icon_size
		entity.icon_mipmaps = item.icon_mipmaps
		entity.icons = item.icons
	end
end

-- Make a single layer of belt animation from a spritesheet, based on its suffix ("base-[]", "arrow-[]", "rails") and frame count.
-- The sprite can be tinted (for arrows or colored railing).
function F.get_belt_animation(suffix,tint,frame_count,repeat_count, glow)
	frame_count = frame_count or 16
	return {
		filename = F.sprites_path.."/rubber-belt-"..suffix..".png",
		priority = "extra-high",
		width = 128,
		height = 128,
		frame_count = frame_count,
		repeat_count = repeat_count,
		direction_count = 20,
		scale = 0.5,
		tint = tint,
		draw_as_glow = glow,
	}
end

-- Make a belt's animation set from the associated tint, base and arrows used.
function F.get_belt_animation_set(tint, base, arrows, arrow_glow, rail_glow)
	local a = arrows
	local frame_arrows = {
		["arrow"] = 16,
		["arrow-doubled"] = 32,
		["arrow-quadrupled"] = 64,
		["arrow-quadrupled-thick"] = 64,
		["no-arrows"] = 16,
		["line-thick"] = 8,
		["line-thin"] = 8,
		["line-side"] = 8,
	}
	local f = frame_arrows[a] or 16

	local layers = {
		layers = {
			F.get_belt_animation("base-"..base, nil, 8, f/8),
		}
	}
	if settings.startup["arrow-style"].value ~= "no-arrows" then 
		table.insert(layers.layers, F.get_belt_animation(a, tint, f, nil, arrow_glow))
	end
	if settings.startup["rail-style"].value == "colored" then
		table.insert(layers.layers, F.get_belt_animation("rails", tint, 8, f/8, rail_glow))
	end
	return #layers.layers > 1 and layers or layers.layers[1]
end

-- Convert color formats from %HSVa to %RGBa
function F.hsva2rgba(h, s, v, a)
	if a == nil then a = 1 end
    local r, g, b
    local i = math.floor(h * 6);
    local f = h * 6 - i;
    local p = v * (1 - s);
    local q = v * (1 - f * s);
    local t = v * (1 - (1 - f) * s);
    i = i % 6
    if i == 0 then r, g, b = v, t, p
    elseif i == 1 then r, g, b = q, v, p
    elseif i == 2 then r, g, b = p, v, t
    elseif i == 3 then r, g, b = p, q, v
    elseif i == 4 then r, g, b = t, p, v
    elseif i == 5 then r, g, b = v, p, q
    end
    return { r = r, g = g, b = b, a = a }
end

return F