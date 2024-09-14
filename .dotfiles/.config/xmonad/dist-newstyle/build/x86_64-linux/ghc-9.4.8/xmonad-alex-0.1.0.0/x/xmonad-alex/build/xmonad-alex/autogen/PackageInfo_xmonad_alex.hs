{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module PackageInfo_xmonad_alex (
    name,
    version,
    synopsis,
    copyright,
    homepage,
  ) where

import Data.Version (Version(..))
import Prelude

name :: String
name = "xmonad_alex"
version :: Version
version = Version [0,1,0,0] []

synopsis :: String
synopsis = "XMonad dots for ArchLinux"
copyright :: String
copyright = ""
homepage :: String
homepage = ""
