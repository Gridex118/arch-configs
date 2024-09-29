import XMonad
import XMonad.StackSet (swapMaster)
import System.Exit

import XMonad.Layout.Gaps
import XMonad.Layout.Spacing
import XMonad.Layout.SimpleFloat
import XMonad.Layout.PerWorkspace

import XMonad.Hooks.ManageHelpers (doCenterFloat)
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar

import XMonad.Util.EZConfig (additionalKeysP, removeKeysP)
import XMonad.Util.SpawnOnce

import XMonad.Actions.Submap (submap)

import Data.Map (fromList)
import XMonad.Actions.GridSelect (goToSelected)


myManageHook = composeAll
    [ className =? "pavucontrol" --> doCenterFloat
    , className =? "qemu" --> doCenterFloat
    , className =? "feh" --> doCenterFloat
    , stringProperty "WM_NAME" =? "Quit GIMP" --> doCenterFloat
    ]

myLayoutHook =
    onWorkspace "9" simpleFloat $
    tiled ||| Mirror tiled ||| Full
    where
        tiled = Tall nmaster delta ratio
        nmaster = 1
        ratio = 1/2
        delta = 3/100

-- XMobar workspaces; copied from the wiki, works fine, so will not bother modifying further
myXmobarPP :: PP
myXmobarPP = def
    { ppSep             = magenta " • "
    , ppTitleSanitize   = xmobarStrip
    , ppCurrent         = white . wrap " " "" . xmobarBorder "Top" "#8be9fd" 2
    , ppHidden          = white . wrap " " ""
    , ppHiddenNoWindows = lowWhite . wrap " " ""
    , ppOrder           = \(ws:_) -> [ws]
    , ppUrgent          = red . wrap (yellow "!") (yellow "!")
    }
    where
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
        , layoutHook = avoidStruts $ spacingWithEdge 4 $ gaps [(U, 5), (R, 3), (D, 3), (L, 3)] myLayoutHook
        , manageHook = myManageHook <+> manageHook def
        , startupHook = myStartupHook
        , terminal = "alacritty"
        , borderWidth = 0
        }
        `removeKeysP`
        [ "M-p"
        , "M-S-q"
        ]
        `additionalKeysP`
        [ ("M-S-d", spawn "~/.config/rofi/implements/launcher.sh")
        -- The Application submap
        , ("M-d", submap . fromList $
                [ ((0, xK_z), spawn "~/.config/rofi/implements/fzathura.sh")
                , ((shiftMask, xK_z), spawn "~/.config/rofi/implements/fzathura.sh --menu")
                , ((0, xK_g), spawn "gimp")
                , ((0, xK_v), spawn "pavucontrol")
                , ((0, xK_p), spawn "firefox --private-window")
                ])
        , ("M-q", kill)
        , ("M-<Return>", spawn "alacritty")
        , ("M-S-<Return>", spawn "firefox")
        , ("M-<Print>", spawn "flameshot gui")
        , ("M-S-p", spawn "if [ `pgrep picom` ]; then pkill picom; else picom -b; fi")
        , ("M-g", goToSelected def)
        , ("M-m", windows swapMaster)
        , ("M-S-<Escape>", io exitSuccess)
        ]
