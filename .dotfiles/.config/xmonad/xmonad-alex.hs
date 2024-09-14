import XMonad

import XMonad.Layout.Gaps
import XMonad.Layout.Spacing

import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP

import XMonad.Util.EZConfig (additionalKeysP, removeKeysP)
import XMonad.Util.SpawnOnce
import XMonad.Util.Loggers

myLayout = tiled ||| Mirror tiled ||| Full
    where
        tiled = Tall nmaster delta ratio
        nmaster = 1
        ratio = 1/2
        delta = 3/100

myXmobarPP :: PP
myXmobarPP = def
    { ppSep             = magenta " • "
    , ppTitleSanitize   = xmobarStrip
    , ppCurrent         = wrap " " "" . xmobarBorder "Top" "#8be9fd" 2
    , ppHidden          = white . wrap " " ""
    , ppHiddenNoWindows = lowWhite . wrap " " ""
    , ppUrgent          = red . wrap (yellow "!") (yellow "!")
    , ppOrder           = \[ws, l, _, _] -> [ws, l]
    , ppExtras          = [logTitles formatFocused formatUnfocused]
    }
    where
        formatFocused   = wrap (white    "[") (white    "]") . magenta . ppWindow
        formatUnfocused = wrap (lowWhite "[") (lowWhite "]") . blue    . ppWindow
        ppWindow :: String -> String
        ppWindow = xmobarRaw . (\w -> if null w then "untitled" else w) . shorten 30
        blue, lowWhite, magenta, red, white, yellow :: String -> String
        magenta  = xmobarColor "#ff79c6" ""
        blue     = xmobarColor "#bd93f9" ""
        white    = xmobarColor "#f8f8f2" ""
        yellow   = xmobarColor "#f1fa8c" ""
        red      = xmobarColor "#ff5555" ""
        lowWhite = xmobarColor "#bbbbbb" ""

myStartupHook :: X ()
myStartupHook = do
    spawnOnce "xmobar"
    spawnOnce "picom -b"
    spawnOnce "conky"

main :: IO ()
main = xmonad
    . ewmh
    . docks
    . withEasySB (statusBarProp "xmobar" (pure myXmobarPP)) defToggleStrutsKey
    $ def
        { modMask = mod4Mask
        , layoutHook = avoidStruts $ spacingWithEdge 4 $ gaps [(U, 5), (R, 3), (D, 3), (L, 3)] myLayout
        , startupHook = myStartupHook
        , terminal = "alacritty"
        , borderWidth = 0
        }
        `removeKeysP`
        [ "M-S-c"
        ]
        `additionalKeysP`
        [ ("M-d", spawn "~/.config/rofi/launcher.sh")
        , ("M-q", kill)
        , ("M-<Return>", spawn "alacritty")
        , ("M-S-<Return>", spawn "firefox")
        ]
