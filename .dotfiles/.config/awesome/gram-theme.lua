local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

-- define module table
local theme = {}


-- ===================================================================
-- Theme Variables
-- ===================================================================


theme.name = "gram"

-- Font
theme.font = "Roboto  9"
theme.title_font = "SF Pro Display Medium 10"

-- Background
theme.bg_normal = "#1f2430"
theme.bg_dark = "#000000"
theme.bg_focus = "#151821"
theme.bg_urgent = "#ed8274"
theme.bg_minimize = "#444444"

-- Foreground
theme.fg_normal = "#ffffff"
theme.fg_focus = "#e4e4e4"
theme.fg_urgent = "#ffffff"
theme.fg_minimize = "#ffffff"

-- Window Gap Distance
theme.useless_gap = dpi(5)

-- Show Gaps if Only One Client is Visible
theme.gap_single_client = true

-- Window Borders
theme.border_width = dpi(0)
theme.border_normal = theme.bg_normal
theme.border_focus = "#ff8a65"
theme.border_marked = theme.fg_urgent

-- Taglist Holder
theme.taglist_holder_color = '#1A1A1A'
theme.taglist_bg_focus = theme.taglist_holder_color 

-- Clock and Layout Holder
theme.cnlh_color = '#1A1A1A'
theme.layout_tile = "~/.config/awesome/icons/tiled.png"
theme.layout_floating = "~/.config/awesome/icons/floating.png"

-- Notification Sizing
theme.notification_max_width = dpi(350)

-- Titlebars
theme.titlebars_enabled = false

-- return theme
return theme
