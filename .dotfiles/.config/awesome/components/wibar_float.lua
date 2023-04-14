local gears = require('gears')
local wibox = require('wibox')
local beautiful = require('beautiful')
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local FloatingWibar = {}

FloatingWibar.create = function (bar_bg, bar_height, y_offset)

    local new_bar = wibox {
         width = dpi(35),
         screen = s,
         expand = false,
         shape = gears.shape.rounded_bar,
         bg = bar_bg, 
         visible = true,
         height = bar_height,
         x = 5,
         y = y_offset,
    }

    return new_bar

end

return FloatingWibar
