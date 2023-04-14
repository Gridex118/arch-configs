local awful = require('awful')
local gears = require('gears')
local wibox = require('wibox')
local beautiful = require('beautiful')
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local left_bar = {}

local unfocus_icon = " "
local unfocus_color = "#585b70"

local empty_icon = " "
local empty_color = "#585b70"

local focus_icon = " "
local focus_color = "#b4befe"

local taglist_buttons = gears.table.join(
    awful.button({}, 1,
        function(t) t:view_only() end),
    awful.button({ modkey }, 1, function(t)
        if client.focus then client.focus:move_to_tag(t) end
    end), awful.button({}, 3, awful.tag.viewtoggle),
    awful.button({ modkey }, 3, function(t)
        if client.focus then client.focus:toggle_tag(t) end
    end), awful.button({}, 4, function(t)
        awful.tag.viewnext(t.screen)
    end), awful.button({}, 5, function(t)
        awful.tag.viewprev(t.screen)
    end))

local update_tags = function(self, c3)
    local tagicon = self:get_children_by_id('icon_role')[1]
    if c3.selected then
        tagicon.text = focus_icon
        self.fg = focus_color
    elseif #c3:clients() == 0 then
        tagicon.text = empty_icon
        self.fg = empty_color
    else
        tagicon.text = unfocus_icon
        self.fg = unfocus_color
    end
end

left_bar.create = function (s)

    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        bg = beautiful.bg_normal,
        shape = gears.shape.rounded_bar,
        layout = { spacing = 0, layout = wibox.layout.fixed.vertical },
        buttons = taglist_buttons,
    }
--[[
    s.wibox = awful.wibar({
        screen = s,
        width = dpi(35),
        height = s.geometry.height * 0.7,
        position = "left",
        opacity = 0.5,
        margins = 2
    })

    s.wibox:setup {
        layout = wibox.layout.align.vertical,
        widget = wibox.container.margin,
        {
            layout = wibox.layout.fixed.vertical,
            s.mytaglist
        }
    }
--]]
    ---[[ 
    s.wibox = wibox {
         width = dpi(35),
         --ontop = true,
         screen = s,
         expand = false,
         visible = true,
         bg = '#1e252c55',
         max_widget_size = 500,
         height = s.geometry.height * 0.6,
         x = 5,
         y = s.geometry.height * 0.2,
    }

     s.wibox:setup {
         {
             s.mytaglist,
             layout = wibox.container.margin,
             margins = 2
         },
         layout  = wibox.layout.fixed.vertical
     }
    --]]

end

return left_bar
