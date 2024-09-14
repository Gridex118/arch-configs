import XMonad

import XMonad.Layout.Gaps
import XMonad.Layout.Spacing

import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import XMonad.Util.EZConfig (additionalKeysP, removeKeysP)

import XMonad.Util.SpawnOnce

myLayout = tiled ||| Mirror tiled ||| Full
    where
        tiled = Tall nmaster delta ratio
        nmaster = 1
        ratio = 1/2
        delta = 3/100

myStartupHook :: X ()
myStartupHook = do
    spawnOnce "xmobar"
    spawnOnce "picom -b"
    spawnOnce "conky"

main :: IO ()
main = xmonad $ ewmh $ docks $ def
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
