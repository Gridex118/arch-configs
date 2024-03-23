local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

-- Define mod keys
local modkey = "Mod4"
local altkey = "Mod1"

-- define module table
local keys = {}

local scripts = gears.filesystem.get_configuration_dir() .. "scripts/"
local fullscreen = false
local last_delay_toggle = 0

-- ===================================================================
-- Movement Functions (Called by some keybinds)
-- ===================================================================


-- Move given client to given direction
local function move_client(c, direction)
    -- If client is floating, move to edge
    if c.floating or (awful.layout.get(mouse.screen) == awful.layout.suit.floating) then
        local workarea = awful.screen.focused().workarea
        if direction == "up" then
            c:geometry({nil, y = workarea.y + beautiful.useless_gap * 2, nil, nil})
        elseif direction == "down" then
            c:geometry({nil, y = workarea.height + workarea.y - c:geometry().height - beautiful.useless_gap * 2 - beautiful.border_width * 2, nil, nil})
        elseif direction == "left" then
            c:geometry({x = workarea.x + beautiful.useless_gap * 2, nil, nil, nil})
        elseif direction == "right" then
            c:geometry({x = workarea.width + workarea.x - c:geometry().width - beautiful.useless_gap * 2 - beautiful.border_width * 2, nil, nil, nil})
        end
        -- Otherwise swap the client in the tiled layout
    elseif awful.layout.get(mouse.screen) == awful.layout.suit.max then
        if direction == "up" or direction == "left" then
            awful.client.swap.byidx(-1, c)
        elseif direction == "down" or direction == "right" then
            awful.client.swap.byidx(1, c)
        end
    else
        awful.client.swap.bydirection(direction, c, nil)
    end
end


-- Resize client in given direction
local floating_resize_amount = dpi(20)
local tiling_resize_factor = 0.05

local function resize_client(c, direction)
    if awful.layout.get(mouse.screen) == awful.layout.suit.floating or (c and c.floating) then
        if direction == "up" then
            c:relative_move(0, 0, 0, -floating_resize_amount)
        elseif direction == "down" then
            c:relative_move(0, 0, 0, floating_resize_amount)
        elseif direction == "left" then
            c:relative_move(0, 0, -floating_resize_amount, 0)
        elseif direction == "right" then
            c:relative_move(0, 0, floating_resize_amount, 0)
        end
    else
        if direction == "up" then
            awful.client.incwfact(-tiling_resize_factor)
        elseif direction == "down" then
            awful.client.incwfact(tiling_resize_factor)
        elseif direction == "left" then
            awful.tag.incmwfact(-tiling_resize_factor)
        elseif direction == "right" then
            awful.tag.incmwfact(tiling_resize_factor)
        end
    end
end


-- raise focused client
local function raise_client()
    if client.focus then
        client.focus:raise()
    end
end

-- wrappers for awful.keys
local keybind = awful.key
local function keybind_no_fscr(leader, key, action)
    return keybind(leader, key, function(...)
        if not fullscreen then
            action(...)
        end
    end)
end

-- Watch repeat delay
local function no_turbo_repeat(action, ...)
    local current_time = os.time()
    if (current_time - last_delay_toggle) <= 1 then
        return
    end
    last_delay_toggle = current_time
    action(...)
end


-- ===================================================================
-- Desktop Key bindings
-- ===================================================================


keys.globalkeys = gears.table.join(
-- =========================================
-- SPAWN APPLICATION KEY BINDINGS
-- =========================================
-- Toggle Touchpad
keybind({modkey}, "m",
function()
    no_turbo_repeat(awful.spawn, scripts .. "mouse.sh")
end
),
-- Toggle repeat delay
keybind({modkey}, "t",
function()
    no_turbo_repeat(awful.spawn, scripts .. "key_delay.sh")
end
),
-- Toggle network
keybind({}, "F12",
function()
    awful.spawn(scripts .. "nettoggle.sh")
end
),
-- Sound control
keybind({}, "XF86AudioMute",
function()
    awful.spawn("amixer -D pulse set Master 1+ toggle")
end
),
keybind({}, "XF86AudioRaiseVolume",
function()
    awful.spawn("amixer -D pulse sset Master 5%+")
end
),
keybind({}, "XF86AudioLowerVolume",
function()
    awful.spawn("amixer -D pulse sset Master 5%-")
end
),
-- Music control
keybind({}, "XF86AudioNext",
function()
    awful.spawn("cmus-remote -C player-next")
end
),
keybind({}, "XF86AudioPrev",
function()
    awful.spawn("cmus-remote -C player-prev")
end
),
keybind({}, "XF86AudioPlay",
function()
    awful.spawn(scripts .. "music.sh")
end
),
keybind({}, "F10",
function()
    awful.spawn("alacritty -t cmus -e cmus")
end
),
-- Spawn terminal
keybind_no_fscr({altkey}, "Return",
function()
    awful.spawn(apps.terminal)
end
),
-- Spawn browser
keybind_no_fscr({altkey, "Shift"}, "Return",
function()
    awful.spawn(apps.browser)
end
),
-- Spawn pdf_viewer
keybind_no_fscr({altkey, "Control"}, "Return",
function()
    awful.spawn(scripts .. "fzathura.sh")
end
),
keybind_no_fscr({altkey, "Control", "Shift"}, "Return",
function()
    awful.spawn(scripts .. "fzathura.sh --menu")
end
),
-- Spawn Neovide
keybind_no_fscr({altkey, "Shift"}, "n",
function()
    awful.spawn("neovide")
end
),
-- launch rofi
keybind_no_fscr({altkey}, "d",
function()
    awful.spawn(apps.launcher)
end),
-- Screenshot on prtscn using flameshot 
keybind({modkey}, "Print",
function()
    awful.spawn.with_shell(apps.screenshot, false)
end
),

-- =========================================
-- RELOAD / QUIT AWESOME
-- =========================================

-- Reload Awesome
keybind({modkey, "Shift"}, "r",
awesome.restart),

-- Quit Awesome
keybind({modkey, "Shift"}, "Escape",
function()
    awesome.quit()
end),
-- Hibernate
keybind({modkey, "Shift", "Control"}, "Escape",
function()
    no_turbo_repeat(awful.spawn, scripts.."hibernate.sh")
end),

-- =========================================
-- CLIENT FOCUSING
-- =========================================

-- Focus client by direction (hjkl keys)
keybind_no_fscr({altkey}, "j",
function()
    awful.client.focus.bydirection("down")
    raise_client()
end),
keybind_no_fscr({altkey}, "k",
function()
    awful.client.focus.bydirection("up")
    raise_client()
end),
keybind_no_fscr({altkey}, "h",
function()
    awful.client.focus.bydirection("left")
    raise_client()
end),
keybind_no_fscr({altkey}, "l",
function()
    awful.client.focus.bydirection("right")
    raise_client()
end),

-- Focus client by index (cycle through clients)
keybind_no_fscr({altkey}, "Tab",
function()
    awful.client.focus.byidx(1)
end),
keybind_no_fscr({altkey, "Shift"}, "Tab",
function()
    awful.client.focus.byidx(-1)
end),

-- =========================================
-- SCREEN FOCUSING
-- =========================================

-- Focus screen by index (cycle through screens)
keybind_no_fscr({altkey}, "c",
function()
    awful.screen.focus_relative(1)
end
),

-- =========================================
-- CLIENT RESIZING
-- =========================================

keybind_no_fscr({modkey, "Control"}, "Down",
function(c)
    resize_client(client.focus, "down")
end
),
keybind_no_fscr({modkey, "Control"}, "Up",
function(c)
    resize_client(client.focus, "up")
end
),
keybind_no_fscr({modkey, "Control"}, "Left",
function(c)
    resize_client(client.focus, "left")
end
),
keybind_no_fscr({modkey, "Control"}, "Right",
function(c)
    resize_client(client.focus, "right")
end
),
keybind_no_fscr({modkey, "Control"}, "j",
function(c)
    resize_client(client.focus, "down")
end
),
keybind_no_fscr({ modkey, "Control" }, "k",
function(c)
    resize_client(client.focus, "up")
end
),
keybind_no_fscr({modkey, "Control"}, "h",
function(c)
    resize_client(client.focus, "left")
end
),
keybind_no_fscr({modkey, "Control"}, "l",
function(c)
    resize_client(client.focus, "right")
end
),

-- =========================================
-- NUMBER OF MASTER / COLUMN CLIENTS
-- =========================================

-- Number of master clients
keybind_no_fscr({modkey, altkey}, "h",
function()
    awful.tag.incnmaster( 1, nil, true)
end),
keybind_no_fscr({ modkey, altkey }, "l",
function()
    awful.tag.incnmaster(-1, nil, true)
end),
keybind_no_fscr({ modkey, altkey }, "Left",
function()
    awful.tag.incnmaster( 1, nil, true)
end),
keybind_no_fscr({ modkey, altkey }, "Right",
function()
    awful.tag.incnmaster(-1, nil, true)
end),

-- Number of columns
keybind_no_fscr({modkey, altkey}, "k",
function()
    awful.tag.incncol(1, nil, true)
end),
keybind_no_fscr({modkey, altkey}, "j",
function()
    awful.tag.incncol(-1, nil, true)
end),
keybind_no_fscr({modkey, altkey}, "Up",
function()
    awful.tag.incncol(1, nil, true)
end),
keybind_no_fscr({modkey, altkey}, "Down",
function()
    awful.tag.incncol(-1, nil, true)
end),

-- =========================================
-- GAP CONTROL
-- =========================================

-- Gap control
keybind_no_fscr({modkey, "Shift"}, "minus",
function()
    awful.tag.incgap(5, nil)
end),
keybind_no_fscr({modkey}, "minus",
function()
    awful.tag.incgap(-5, nil)
end),

-- =========================================
-- LAYOUT SELECTION
-- =========================================

-- select next layout
keybind_no_fscr({altkey}, "space",
function()
    awful.layout.inc(1)
end),
-- select previous layout
keybind_no_fscr({altkey, "Shift"}, "space",
function()
    awful.layout.inc(-1)
end)

)
-- ===================================================================
-- Client Key bindings
-- ===================================================================


keys.clientkeys = gears.table.join(
-- Move to edge or swap by direction
keybind_no_fscr({altkey, "Shift"}, "j",
function(c)
    move_client(c, "down")
end
),
keybind_no_fscr({altkey, "Shift"}, "k",
function(c)
    move_client(c, "up")
end
),
keybind_no_fscr({altkey, "Shift"}, "h",
function(c)
    move_client(c, "left")
end
),
keybind_no_fscr({altkey, "Shift"}, "l",
function(c)
    move_client(c, "right")
end
),

-- toggle fullscreen
keybind({altkey}, "a",
function(c)
    c.fullscreen = not c.fullscreen
    fullscreen = c.fullscreen
    if c.fullscreen then
        awful.spawn.with_shell("killall picom")    -- remove transparency in fullscreen mode
    else
        awful.spawn.with_shell("picom -b &")
    end
end),

-- close client
keybind_no_fscr({altkey}, "q",
function(c)
    c:kill()
end)

)

-- Bind all key numbers to tags
for i = 1, 9 do
    keys.globalkeys = gears.table.join(keys.globalkeys,
    -- Switch to tag
    keybind_no_fscr({altkey}, "#" .. i + 9,
    function()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then    -- Do not switch tags if current application is in fullscreen
            tag:view_only()
        end
    end    ),
    -- Move client to tag
    keybind_no_fscr({altkey, "Shift"}, "#" .. i + 9,
    function()
        if client.focus then
            local tag = client.focus.screen.tags[i]
            if tag then
                client.focus:move_to_tag(tag)
            end
        end
    end    )
    )
end

return keys
