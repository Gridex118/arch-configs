local awful = require('awful')
local gears = require('gears')
local wibox = require('wibox')
local beautiful = require('beautiful')
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi


local taglist_holder = {}

taglist_holder.create = function(s)

    s.mytaglist = require('widgets/taglist').create(s)
    s.taglist_holder = require('components/wibar_float').create(
        beautiful.taglist_holder_color,
        s.geometry.height * 0.25,
        s.geometry.height * 0.15
    )
     s.taglist_holder:setup {
         {
             s.mytaglist,
             layout = wibox.container.margin,
             top = dpi(21),
             left = dpi(10)
         },
         layout  = wibox.layout.fixed.vertical,
         expand = "none"
     }

end

return taglist_holder
