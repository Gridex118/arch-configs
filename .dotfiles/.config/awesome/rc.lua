-- Preliminaries
pcall(require, "luarocks.loader")
local awful = require('awful')
local gears = require('gears')
local naughty = require('naughty')
local beautiful = require('beautiful')

if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        if in_error then return end
        in_error = true
        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = tostring(err) })
        in_error = false
    end)
end


-- Apps
apps = {
    terminal = "alacritty",
    lock = "i3lock",
    screenshot = "flameshot full -p ~/Screenshots/",
    launcher = "dmenu_run"
}

-- Autostart
local autostart_apps = {
    "unclutter",
    "udiskie",
    "picom -b",
    "conky",
    "numlockx",
    "lxqt-policykit-agent"
}

for _, app in ipairs(autostart_apps) do
   local findme = app
   local firstspace = app:find(" ")
   if firstspace then
      findme = app:sub(0, firstspace - 1)
   end
   -- pipe commands to bash to allow command to be shell agnostic
   awful.spawn.with_shell(string.format("echo 'pgrep -u $USER -x %s > /dev/null || (%s)' | bash -", findme, app), false)
end


-- Theme
beautiful.init("~/.config/awesome/gram-theme.lua")
awful.screen.focused().padding = { top=27, bottom=3, left=40, right=3 }


-- Functionality
local keys = require('keys')
local buttons = require('buttons')

root.keys(keys.globalkeys)
root.buttons(buttons.desktopbuttons)

awful.layout.layouts = {
   awful.layout.suit.tile,
   awful.layout.suit.floating,
}

awful.screen.connect_for_each_screen(function(s)
    gears.wallpaper.maximized(gears.filesystem.get_configuration_dir() .. 'neon.png',s, true)
    awful.tag({"1", "2", "3", "4", "5", "6", "7"}, s, awful.layout.layouts[1]) 
    require('components/taglist_holder').create(s)
    require('components/clock_n_layout_holder').create(s)
    require('components/topbar').create(s)
end)

local screen_height = awful.screen.focused().geometry.height
local screen_width = awful.screen.focused().geometry.width

awful.rules.rules = {
    -- All clients match this
    {
         rule = {},
         properties = {
            titlebars_enabled = beautiful.titlebars_enabled,
            border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            focus = awful.client.focus.filter,
            raise = true,
            keys = keys.clientkeys,
            buttons = buttons.clientbuttons,
            screen = awful.screen.preferred,
            placement = awful.placement.centered
        }
    },
  --[[
  -- No Float for Firefox
    {
        rule = {class = "firefox"},
        properties = {maximized = false, floating = false}
    },
  --]]
  -- Floating clients.
    {
         rule_any = {
            instance = {
               "DTA", "copyq",
            },
            class = {
               "Nm-connection-editor", "Qemu-system-x86_64", "Citra"
            },
            name = {
               "Event Tester",
               "Steam Guard - Computer Authorization Required"
            },
            role = {
               "pop-up", "GtkFileChooserDialog"
            },
            type = {
               "dialog"
            }
         }, properties = {floating = true}
    },
    -- File-Choser
    {
         rule_any = {role = {"GtkFileChooserDialog"}},
         properties = {floating = true, width = screen_width * 0.55, height = screen_height * 0.65}
    },
    -- Pavucontrol & Bluetooth Devices
    {
         rule_any = {class = {"Pavucontrol"}, name = {"Bluetooth Devices"}},
         properties = {floating = true, width = screen_width * 0.55, height = screen_height * 0.45}
    },
}

-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
   -- Set the window as a slave (put it at the end of others instead of setting it as master)
   if not awesome.startup then
      awful.client.setslave(c)
   end

   if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
      -- Prevent clients from being unreachable after screen count changes.
      awful.placement.no_offscreen(c)
   end
end)

-- Autofocus a new client when previously focused one is closed
require("awful.autofocus")

-- Focus clients under mouse
client.connect_signal("mouse::enter", function(c)
   c:emit_signal("request::activate", "mouse_enter", {raise = false})
end)

-- Garbage collection
collectgarbage("setpause", 110)
collectgarbage("setstepmul", 1000)
