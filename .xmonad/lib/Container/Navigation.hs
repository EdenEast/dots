-- | Window and workspace navigation

module Container.Navigation where

import XMonad.Actions.Navigation2D

navigate = navigation2DP def
                         ( "<Up>", "<Left>", "<Down>", "<Right>")
                         [ ("M-",   windowGo)
                         , ("M-S-", windowSwap)
                         , ("M-C-", screenGo)
                         ]
                         False