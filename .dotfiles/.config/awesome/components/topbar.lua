local gears = require('gears')
local wibox = require('wibox')
local awful = require('awful')
local beautiful = require('beautiful')
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local batteryarc = require('street.batteryarc-widget.batteryarc')

local TopBar = {}

TopBar.create = function(s)

    mydate = wibox.widget.textclock('<span font = "Roboto 11">%a, %d %b</span>')
    mybattery = batteryarc({
        size = 15,
        font = "MesloLGS NF"
    })
    
    bar_width = s.geometry.width * 99/100

    new_bar = require('components/wibar_float').create(
       '#1a1a1a', 22, 5, bar_width, s.geometry.width * 1/200,
       function (cr, width, height)
           gears.shape.rounded_rect(cr, width, height, 7)
       end
       )

       new_bar:setup{
           {
               layout = wibox.container.margin,
               mybattery,
               left = bar_width/2 - 50,
               right = dpi(25),
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
