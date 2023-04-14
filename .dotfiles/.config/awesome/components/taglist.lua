local awful = require("awful")
local gears = require("gears")
local gfs = gears.filesystem
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
------------------------------------

local tag_list = {}
tag_list.create = function(s)
	-- Taglist buttons

	----------------------------------------------------------------------

	----------------------------------------------------------------------

	-- Function to update the tags

	----------------------------------------------------------------------

	local icon_taglist = awful.widget.taglist {
		screen = s,
		filter = awful.widget.taglist.filter.all,
		layout = { spacing = 0, layout = wibox.layout.fixed.vertical },
		widget_template = {
			{
				{ id = 'icon_role', font = "JetBrainsMono Nerd Font 12", widget = wibox.widget.textbox },
				id = 'margin_role',
				top = dpi(0),
				bottom = dpi(0),
				left = dpi(2),
				right = dpi(2),
				widget = wibox.container.margin
			},
			id = 'background_role',
			widget = wibox.container.background,
			create_callback = function(self, c3, index, objects)
				update_tags(self, c3)
			end,

			update_callback = function(self, c3, index, objects)
				update_tags(self, c3)
			end
		},
		buttons = taglist_buttons
	}
	return icon_taglist
end

return tag_list
