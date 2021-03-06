local awful = require('awful')
local gears = require('gears')
require('awful.autofocus')
local beautiful = require('beautiful')
local hotkeys_popup = require('awful.hotkeys_popup').widget
local keychain = require('module.keychain')

local mod = 'Mod4'
local alt = 'Mod1'
local ctrl = 'Control'
local shift = 'Shift'

-- Emacs key sequences
---------------------------------------------------------------------------------------------------
local keyseq = { { mod }, 'c', {}, {} }

-- group
keyseq[3] = {
    { {}, 'm', {}, {} }, -- music group
}

-- Music sequence
keyseq[3][1][3] = {
    {
        {}, 'p', function()
            awful.spawn.with_shell('~/.script/wm/soundctl toggle')
        end, { description = 'Toggle play pause', group = '', keyset = { 'p' } }
    },
    {
        {}, 's', function()
            awful.spawn.with_shell('~/.script/wm/soundctl stop')
        end, { description = 'Stop music', group = '', keyset = { 's' } }
    },
    {
        {}, 'h', function()
            awful.spawn.with_shell('~/.script/wm/soundctl backward 10')
        end, { description = 'Backwards', group = '', keyset = { 'h' } }
    },
    {
        {}, 'l', function()
            awful.spawn.with_shell('~/.script/wm/soundctl forward 10')
        end, { description = 'Forward', group = '', keyset = { 'l' } }
    },
    {
        {}, 'j', function()
            awful.spawn.with_shell('~/.script/wm/soundctl prev')
        end, { description = 'Previous', group = '', keyset = { 'j' } }
    },
    {
        {}, 'k', function()
            awful.spawn.with_shell('~/.script/wm/soundctl next')
        end, { description = 'Next', group = '', keyset = { 'k' } }
    },
    {
        {}, 'r', function()
            awful.spawn.with_shell('~/.script/wm/soundctl restart')
        end, { description = 'Reset', group = '', keyset = { 'r' } }
    },
    {
        {}, 'm', function()
            awful.spawn.with_shell('~/.script/wm/soundctl mute')
        end, { description = 'Mute', group = '', keyset = { 'm' } }
    },
    {
        {}, 'n', function()
            awful.spawn("alacritty -e ncmpcpp")
        end, { description = 'Ncmpcpp', group = '', keyset = { 'n' } }
    }
}

local globalkeys = awful.util.table.join(
    awful.key({ mod, }, 'F1',
        hotkeys_popup.show_help,
        { description = 'Show this hotkey help', group = 'Awesome' }
    ),
    awful.key({ mod, ctrl }, 'r',
        awesome.restart,
        { description = 'Restart awesome', group = 'Awesome' }
    ),
    -- awful.key({ mod, shift }, 'Escape',
    --     awesome.quit,
    --     { description = 'Quit awesome', group = 'Awesome' }
    -- ),
    awful.key({ mod }, 'Escape',
        function()
            exit_screen_show()
        end,
        { description = 'exit', group = Awesome }
    ),

    awful.key({ mod, }, 'Return',
        function()
            awful.spawn(user.terminal)
        end,
        { description = 'Launch terminal', group = 'Launcher' }
    ),
    awful.key({ mod, ctrl }, 'Return',
        function()
            awful.spawn('rofi -show combi')
        end,
        { description = 'Open rofi', group = "Launcher" }
    ),
    awful.key({ mod, }, 'c',
        function()
            keychain:activate(keyseq, 'user')
        end,
        { description = 'User key sequence', group = 'Main' }
    ),
    awful.key({ mod }, 'e',
        function ()
            awful.spawn.with_shell('$HOME/.script/rofi/edit-config.sh')
        end,
        { description = 'Edit config files', group = 'Launcher' }
    ),

    -- Movement
    -------------------------------------------------------
    awful.key({ mod, }, 'h',
        function()
            local current_layout = awful.layout.getname(awful.layout.get(awful.screen.focused()))
            if current_layout == 'max' then
                awful.client.focus.byidx(-1)
            else
                awful.client.focus.bydirection('left')
            end
            if client.focus then client.focus:raise() end
        end,
        { description = 'Move client focus to left', group = 'Client' }
    ),
    awful.key({ mod, }, 'j',
        function()
            awful.client.focus.bydirection('down')
            if client.focus then client.focus:raise() end
        end,
        { description = 'Move client focus to down', group = 'Client' }
    ),
    awful.key({ mod, }, 'k',
        function()
            awful.client.focus.bydirection('up')
            if client.focus then client.focus:raise() end
        end,
        { description = 'Move client focus to up', group = 'Client' }
    ),
    awful.key({ mod, }, 'l',
        function()
            local current_layout = awful.layout.getname(awful.layout.get(awful.screen.focused()))
            if current_layout == 'max' then
                awful.client.focus.byidx(1)
            else
                awful.client.focus.bydirection('right')
            end
            if client.focus then client.focus:raise() end
        end,
        { description = 'Move client focus to right', group = 'Client' }
    ),

    awful.key({ mod, shift }, 'h',
        function()
            awful.client.swap.bydirection('left')
        end,
        { description = 'Swap client with one to left', group = 'Client' }
    ),
    awful.key({ mod, shift }, 'j',
        function()
            awful.client.swap.bydirection('down')
        end,
        { description = 'Swap client with one to down', group = 'Client' }
    ),
    awful.key({ mod, shift }, 'k',
        function()
            awful.client.swap.bydirection('up')
        end,
        { description = 'Swap client with one to up', group = 'Client' }
    ),
    awful.key({ mod, shift }, 'l',
        function()
            awful.client.swap.bydirection('right')
        end,
        { description = 'Swap client with one to right', group = 'Client' }
    ),

    awful.key({ mod, ctrl }, 'Left',
        function()
            awful.screen.focus_relative(-1)
        end,
        { description = 'Focus next screen', group = 'Screen' }
    ),
    awful.key({ mod, ctrl }, 'Right',
        function()
            awful.screen.focus_relative(1)
        end,
        { description = 'Focus prev screen', group = 'Screen' }
    ),

    awful.key({ mod, alt }, 'h',
        function()
            awful.tag.incmwfact(-0.05)
        end,
        { description = 'Increase master width factor', group = 'Client' }
    ),
    awful.key({ mod, alt }, 'l',
        function()
            awful.tag.incmwfact(0.05)
        end,
        { description = 'Decrease master width factor', group = 'Client' }
    ),

    -- Jumps
    awful.key({ mod, }, 'u',
        function()
            uc = awful.client.urgent.get()
            -- If there is no urgent client, go back to teh last tag
            if uc == nil then
                awful.tag.history.restore()
            else
                awful.client.urgent.jumpto()
            end
        end,
        { description = 'jump to urgent client', group = 'Client' }
    ),
    awful.key({ mod, }, 'Tab',
        function()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        { description = 'Go back', group = 'Client' }
    ),

    -- Layout
    awful.key({ mod, }, 'y',
        function()
            awful.layout.inc(1)
        end,
        { description = 'Select next', group = 'Layout' }
    ),
    awful.key({ mod, shift }, 'y',
        function()
            awful.layout.inc(-1)
        end,
        { description = 'Select previous', group = 'Layout' }
    ),

    -- Layout
    awful.key({ mod, shift }, 'n',
        function()
            local c = awful.client.restore()
            if c then
                c:emit_signal(
                    'request::activate', 'key.unminimize', { raise = true }
                )
            end
        end
    ),
    awful.key({ mod }, 'b',
        function()
            myscreen = awful.screen.focused()
            myscreen.mywibox.visible = not myscreen.mywibox.visible
        end,
        { description = 'Toggle panel', group = 'Layout' }
    ),

    -- XF86
    -------------------------------------------------------
    awful.key({}, 'XF86AudioForward',
        function()
            awful.spawn.with_shell('~/.script/wm/soundctl forward')
        end, {}
    ),
    awful.key({}, 'XF86AudioLowerVolume',
        function()
            awful.spawn.with_shell('~/.script/wm/soundctl down')
        end, {}
    ),
    awful.key({}, 'XF86AudioMedia',
        function()
            -- awful.spawn.with_shell('~/.script/wm/soundctl forward')
        end, {}
    ),
    awful.key({}, 'XF86AudioMicMute',
        function()
            -- awful.spawn.with_shell('~/.script/wm/soundctl forward')
        end, {}
    ),
    awful.key({}, 'XF86AudioMute',
        function()
            awful.spawn.with_shell('~/.script/wm/soundctl mute')
        end, {}
    ),
    awful.key({}, 'XF86AudioNext',
        function()
            awful.spawn.with_shell('~/.script/wm/soundctl next')
        end, {}
    ),
    awful.key({}, 'XF86AudioPlay',
        function()
            awful.spawn.with_shell('~/.script/wm/soundctl toggle')
        end, {}
    ),
    awful.key({}, 'XF86AudioPrev',
        function()
            awful.spawn.with_shell('~/.script/wm/soundctl prev')
        end, {}
    ),
    awful.key({}, 'XF86AudioRaiseVolume',
        function()
            awful.spawn.with_shell('~/.script/wm/soundctl up')
        end, {}
    ),
    awful.key({}, 'XF86AudioRecord',
        function()
            -- awful.spawn.with_shell('~/.script/wm/soundctl forward')
        end, {}
    ),
    awful.key({}, 'XF86AudioRewind',
        function()
            awful.spawn.with_shell('~/.script/wm/soundctl backward')
        end, {}
    ),
    awful.key({}, 'XF86AudioStop',
        function()
            awful.spawn.with_shell('~/.script/wm/soundctl stop')
        end, {}
    ),
    awful.key({}, 'XF86Close',
        function()
        end, {}
    ),
    awful.key({}, 'XF86Display',
        function()
            awful.spawn.with_shell('arandr')
        end, {}
    ),
    awful.key({}, 'XF86Explorer',
        function()
        end, {}
    ),
    awful.key({}, 'XF86HomePage',
        function()
        end, {}
    ),
    awful.key({}, 'XF86KbdBrightnessDown',
        function()
        end, {}
    ),
    awful.key({}, 'XF86KbdBrightnessUp',
        function()
        end, {}
    ),
    awful.key({}, 'XF86KbdLightOnOff',
        function()
        end, {}
    ),
    awful.key({}, 'XF86MonBrightnessDown',
        function()
            awful.spawn.with_shell('light -U 5')
        end, {}
    ),
    awful.key({}, 'XF86MonBrightnessUp',
        function()
            awful.spawn.with_shell('light -A 5')
        end, {}
    ),
    awful.key({}, 'XF86MyComputer',
        function()
        end, {}
    ),
    awful.key({}, 'XF86PowerOff',
        function()
            awful.spawn.with_shell('~/.scripts/lockscreen.sh')
        end, {}
    ),
    awful.key({}, 'XF86Reload',
        awesome.restart, {}
    ),
    awful.key({}, 'XF86ScreenSaver',
        function()
        end, {}
    ),
    awful.key({}, 'XF86Sleep',
        function()
            awful.spawn.with_shell('~/.scripts/lockscreen.sh')
        end, {}
    ),
    awful.key({}, 'XF86Suspend',
        function()
            awful.spawn.with_shell('~/.scripts/lockscreen.sh')
        end, {}
    )
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,
        -- View tag only.
        awful.key({ mod }, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  {description = "view tag #"..i, group = "tag"}),
        -- Toggle tag display.
        awful.key({ mod, ctrl }, "#" .. i + 9,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end,
                  {description = "toggle tag #" .. i, group = "tag"}),
        -- Move client to tag.
        awful.key({ mod, shift }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  {description = "move focused client to tag #"..i, group = "tag"}),
        -- Toggle tag on focused client.
        awful.key({ mod, ctrl, shift }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:toggle_tag(tag)
                          end
                      end
                  end,
                  {description = "toggle focused client on tag #" .. i, group = "tag"})
    )
end

return globalkeys
