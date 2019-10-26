import Control.Monad
import Data.Monoid
import XMonad
import XMonad.Actions.DynamicProjects
import XMonad.Actions.Navigation2D
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Util.NamedActions
import XMonad.Util.Replace
import XMonad.Util.Run

-- ./lib/
import Bind.Master
import Bus.Events
import Bus.Hooks
import Config.Options
import Config.Projects
import Container.Layout
import Container.Navigation

-- Defaults
-------------------------------------------------------------------------------
defaults = def {
  -- simple stuff
  terminal           = term options,
  focusFollowsMouse  = ffm options,
  modMask            = mask options,
  workspaces         = spaces options,

  normalBorderColor  = unfocused theme,
  focusedBorderColor = focused theme,
  borderWidth        = border theme,

  -- key bindings
  -- keys               = keyBindings,
  mouseBindings      = mouseBindings',

  layoutHook         = layout,
  manageHook         = hooks,
  handleEventHook    = events options,
  logHook            = logHook',
  startupHook        = starts options
}

main :: IO ()
main = do
  -- xmproc0 <- spawnPipe "xmobar -x 0 $HOME/.config/xmobar/xmobarrc"
  -- xmproc1 <- spawnPipe "xmobar -x 1 $HOME/.config/xmobar/xmobarrc"
  -- xmproc2 <- spawnPipe "xmobar -x 2 $HOME/.config/xmobar/xmobarrc"
  replace

  forM_ [ "xmonad-ws"
        , "xmonad-layout"
        -- , "caffeine"
        ]
        $ \file -> safeSpawn "mkfifo" ["/tmp/"++file]

  xmonad
    . docks
    . addDescrKeys' ((mask options, xK_F1), showKeybindings) keyBindings
    . ewmh
    . navigate
    . dynamicProjects projects
    . withNavigation2DConfig nav2dConfig
    $ defaults
