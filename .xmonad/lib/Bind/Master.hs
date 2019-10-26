-- |
module Bind.Master where

import System.IO
import XMonad
import XMonad.Actions.CopyWindow
import XMonad.Actions.DynamicWorkspaces
import XMonad.Actions.MessageFeedback
import XMonad.Layout.ToggleLayouts
import XMonad.Operations
-- import XMonad.Layout.WindowNavigation
-- import XMonad.Layout.MultiToggle
-- import XMonad.Layout.MultiToggle.Instances
import XMonad.Util.EZConfig
import XMonad.Util.NamedActions
import XMonad.Util.Run
import System.Exit

import qualified XMonad.StackSet                   as W
import qualified Data.Map                          as M
import qualified XMonad.Actions.FlexibleManipulate as F
import qualified XMonad.Actions.Navigation2D       as Nav2d
import App.Alias
import Config.Options

nav2dConfig = def
  { Nav2d.defaultTiledNavigation = Nav2d.centerNavigation
  , Nav2d.floatNavigation = Nav2d.centerNavigation
  , Nav2d.screenNavigation = Nav2d.lineNavigation
  }

-- Keys --
-------------------------------------------------------------------------------
-- keys :: XConfig l -> M.Map (KeyMask, KeySym) (X ())
keyBindings conf = let
    subKeys str ks = subtitle str : mkNamedKeymap conf ks
    dirKeys = ["j", "k", "h", "l"]
    arrowKeys = ["<D>", "<U>", "<L>", "<R>"]
    dirs = [Nav2d.D, Nav2d.U, Nav2d.L, Nav2d.R]

    zipM  m nm ks as f = zipWith(\k d -> (m ++ k, addName nm $ f d)) ks as
    zipM' m nm ks as f b = zipWith(\k d -> (m ++ k, addName nm $ f d b)) ks as

    in

    subKeys "System"
    [ ("M-S-r", addName "Restart Xmonad" $ restartXMonad)
    , ("M-C-r", addName "Rebuild Xmonad" $ rebuildXMonad)
    , ("M-q"  , addName "Kill"           $ kill)
    , ("M-C-q", addName "Quit Xmonad"    $ quitXMonad)
    ] ^++^

    subKeys "Navigation"
    (
      zipM' "M-" "Navigate window" dirKeys dirs Nav2d.windowGo False
      ++ zipM' "M-S-" "Move window" dirKeys dirs Nav2d.windowSwap False
    ) ^++^

    -- [ ("M-k", addName "Focus window above"  $ Nav2d.windowGo Nav2d.U False)
    -- , ("M-j", addName "Focus window below"  $ Nav2d.windowGo Nav2d.D False)
    -- , ("M-h", addName "Focus window left"   $ Nav2d.windowGo Nav2d.L False)
    -- , ("M-l", addName "Focus window right"  $ Nav2d.windowGo Nav2d.R False)
    -- , ("M-S-k", addName "Swap window above" $ Nav2d.windowSwap Nav2d.U False)
    -- , ("M-S-j", addName "Swap window below" $ Nav2d.windowSwap Nav2d.D False)
    -- , ("M-S-h", addName "Swap window left"  $ Nav2d.windowSwap Nav2d.L False)
    -- , ("M-S-l", addName "Swap window right" $ Nav2d.windowSwap Nav2d.R False)
    -- , ("M-C-k", addName "Swap screen above" $ Nav2d.windowSwap Nav2d.U False >> Nav2d.screenGo Nav2d.U False)
    -- , ("M-C-j", addName "Swap screen below" $ Nav2d.windowSwap Nav2d.D False >> Nav2d.screenGo Nav2d.D False)
    -- , ("M-C-h", addName "Swap screen left"  $ Nav2d.windowSwap Nav2d.L False >> Nav2d.screenGo Nav2d.L False)
    -- , ("M-C-l", addName "Swap screen right" $ Nav2d.windowSwap Nav2d.R False >> Nav2d.screenGo Nav2d.R False)
    -- ] ^++^

    subKeys "Launcher"
    [ ("M-<Return>", addName "Terminal" $ spawn (term options))
    , ("M-o w",      addName "Browser"  $ spawn (browser))
    , ("M-o o",      addName "Rofi Rum" $ spawn ("rofi -show drun"))
    ] ^++^

    subKeys "Workspace"
    (
       zipM "M-" "View workspace" wsKeys [0..] (withNthWorkspace W.greedyView)
    ++ zipM "M-S-" "Move w to ws" wsKeys [0..] (withNthWorkspace W.shift)
    ++ zipM "M-S-C-" "Copy w to ws" wsKeys [0..] (withNthWorkspace copy)
    -- ++ zipM' "M-" "Focus window" dirKeys dirs Nav2d.windowGo True
    -- ++ zipM' "M-S-" "Move window" dirKeys dirs Nav2d.windowSwap True
    ) ^++^

    subKeys "Layout"
    [ ("M-y y", addName "Next Layout" $ sendMessage NextLayout)
    ]



    where
        wsKeys = map show $ [1..9] ++ [0]

        rebuildXMonad :: X ()
        rebuildXMonad = do
            spawn "xmonad --recompile && xmonad --restart"

        restartXMonad :: X ()
        restartXMonad = do
            spawn "xmonad --restart"

        quitXMonad :: X ()
        quitXMonad = io (exitWith ExitSuccess)


-- defaultKeys :: XConfig l -> M.Map (KeyMask, KeySym) (X ())
-- defaultKeys c = mkKeymap c $
--     [ ("M-<Return>", spawn (term options))
--     , ("M-C-r", spawn ("xmonad --recompile && xmonad --restart"))
--     , ("M-C-q", io exitSuccess)
--     , ("M-q", kill)

--     -- Navigation
--     , ("M-j", windows W.focusDown)
--     , ("M-k", windows W.focusUp)

--     -- Applications
--     , ("M-a k", kill)
--     , ("M-a w", spawn browser)
--     , ("M-a e", spawn code)

--     -- Session
--     , ("M-q l", spawn screensaver)
--     , ("M-q r", broadcastMessage ReleaseResources
--                 >> spawn ("xmonad --recompile && xmonad --restart"))
--     ]

defaultKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
-- origKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
    -- launch a terminal
    [ ((modm .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf)

    -- launch dmenu
    , ((modm,               xK_p     ), spawn "dmenu_run")

    -- launch gmrun
    , ((modm .|. shiftMask, xK_p     ), spawn "gmrun")

    -- close focused window
    , ((modm .|. shiftMask, xK_c     ), kill)

     -- Rotate through the available layout algorithms
    , ((modm,               xK_space ), sendMessage NextLayout)

    --  Reset the layouts on the current workspace to default
    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)

    -- Resize viewed windows to the correct size
    , ((modm,               xK_n     ), refresh)

    -- Move focus to the next window
    , ((modm,               xK_Tab   ), windows W.focusDown)

    -- Move focus to the next window
    , ((modm,               xK_j     ), windows W.focusDown)

    -- Move focus to the previous window
    , ((modm,               xK_k     ), windows W.focusUp  )

    -- Move focus to the master window
    , ((modm,               xK_m     ), windows W.focusMaster  )

    -- Swap the focused window and the master window
    , ((modm,               xK_Return), windows W.swapMaster)

    -- Swap the focused window with the next window
    , ((modm .|. shiftMask, xK_j     ), windows W.swapDown  )

    -- Swap the focused window with the previous window
    , ((modm .|. shiftMask, xK_k     ), windows W.swapUp    )

    -- Shrink the master area
    , ((modm,               xK_h     ), sendMessage Shrink)

    -- Expand the master area
    , ((modm,               xK_l     ), sendMessage Expand)

    -- Push window back into tiling
    , ((modm,               xK_t     ), withFocused $ windows . W.sink)

    -- Increment the number of windows in the master area
    , ((modm              , xK_comma ), sendMessage (IncMasterN 1))

    -- Deincrement the number of windows in the master area
    , ((modm              , xK_period), sendMessage (IncMasterN (-1)))

    -- Toggle the status bar gap
    -- Use this binding with avoidStruts from Hooks.ManageDocks.
    -- See also the statusBar function from Hooks.DynamicLog.
    --
    -- , ((modm              , xK_b     ), sendMessage ToggleStruts)

    -- Quit xmonad
    , ((modm .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))

    -- Restart xmonad
    , ((modm              , xK_q     ), spawn "xmonad --recompile; xmonad --restart")
    ]
    ++

    --
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    --
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++

    --
    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    --
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]

showKeybindings :: [((KeyMask, KeySym), NamedAction)] -> NamedAction
showKeybindings x = addName "Show Keybindings" $ io $ do
    h <- spawnPipe "zenity --text-info --font=terminus"
    hPutStr h (unlines $ showKm x)
    hClose h
    return ()

-- Mouse bindings: default actions bound to mouse events
mouseBindings' :: XConfig l -> M.Map (KeyMask, Button) (Window -> X ())
mouseBindings' XConfig {XMonad.modMask = modm} = M.fromList
    -- mod-button1, flexible linear scale
    [ ((mod4Mask, button1), \w -> focus w >> F.mouseWindow F.discrete w)
    -- mod-button2, Raise the window to the top of the stack
    , ((mod4Mask, button2), \w -> focus w >> windows W.shiftMaster)
    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((mod4Mask, button3), \w -> focus w >> mouseResizeWindow w
                                      >> windows W.shiftMaster)
    -- you may also bind events to the mouse scroll wheel (button4 and button5)
    ]
