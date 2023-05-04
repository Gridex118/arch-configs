local gears = require('gears')
local wibox = require('wibox')
local awful = require('awful')
local beautiful = require('beautiful')
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local TopBar = {}

TopBar.create = function(s)

    mydate = wibox.widget.textclock('<span font = "Roboto 11">%d-%m-%Y</span>')
    
    local new_bar = awful.wibar {
        height = 18,
        bg = '#000000',
    }

    new_bar:setup{
        {
            layout = wibox.container.margin,
            left = s.geometry.width/2 - 40
        },
        layout = wibox.layout.fixed.horizontal,
        {
            mydate,
            layout = wibox.container.margin,
        },
        layout = wibox.layout.fixed.horizontal,
    }

    return new_bar

end

return TopBar
