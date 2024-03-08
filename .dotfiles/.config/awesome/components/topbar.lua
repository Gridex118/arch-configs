local gears = require('gears')
local wibox = require('wibox')
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local batteryarc = require('awesome-wm-widgets.batteryarc-widget.batteryarc')

local TopBar = {}

TopBar.create = function(s)

    local mydate = wibox.widget.textclock('<span font = "Roboto 11">%a, %d %b</span>')
    local mybattery = batteryarc({
        size = 15,
        font = "MesloLGS NF"
    })

    local bar_width = s.geometry.width * 13/100

    local new_bar = require('components/wibar_float').create(
       '#1a1a1a', 25, 5, bar_width, s.geometry.width * 1/100,
       function (cr, width, height)
           gears.shape.rounded_rect(cr, width, height, 7)
       end
       )

       new_bar:setup{
           {
               layout = wibox.container.margin,
               mybattery,
               left = bar_width/2 - 65,
               right = dpi(22),
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
