local awful = require('awful')
local gears = require('gears')
local wibox = require('wibox')
local beautiful = require('beautiful')
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local clock_n_layout_holder = {}

clock_n_layout_holder.create = function (s)

    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox.forced_width = 6
    mytextclock = wibox.widget.textclock('<span font = "Roboto 15">%H %M</span>')

    s.clock_n_layout_holder = require('components/wibar_float').create(
        beautiful.cnlh_color,
        s.geometry.height * 0.17,
        s.geometry.height * 0.55
    )

    s.clock_n_layout_holder:setup {
         {
             mytextclock,
             layout = wibox.container.margin,
             top = dpi(15),
             left = dpi(7)
         },
         layout = wibox.layout.fixed.vertical,
         {
             s.mylayoutbox,
             layout = wibox.container.margin,
             top = dpi(17),
             left = dpi(4),
             right = dpi(4)
         },
         layout  = wibox.layout.fixed.vertical,
     }

end

return clock_n_layout_holder
