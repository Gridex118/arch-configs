local gears = require('gears')
local wibox = require('wibox')
local beautiful = require('beautiful')
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local FloatingWibar = {}

FloatingWibar.create = function (bar_bg, bar_height, y_offset, bar_width, x_offset, bar_shape)

    bar_width = bar_width or 35
    x_offset = x_offset or 5
    bar_shape = bar_shape or gears.shape.rounded_bar

    local new_bar = wibox {
        width = dpi(bar_width),
        screen = s,
        expand = false,
        shape = bar_shape,
        bg = bar_bg, 
        visible = true,
        height = dpi(bar_height),
        x = dpi(x_offset),
        y = y_offset,
    }

    return new_bar

end

return FloatingWibar
