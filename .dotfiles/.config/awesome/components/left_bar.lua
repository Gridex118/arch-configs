local awful = require('awful')
local gears = require('gears')
local wibox = require('wibox')
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local left_bar = {}

left_bar.create = function (s)
    awful.wibar({
        screen = s,
        width = dpi(35),
        height = s.geometry.height * 0.7,
        position = "left",
        opacity = 0
    })
end

return left_bar
