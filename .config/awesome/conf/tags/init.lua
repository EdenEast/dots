local awful = require('awful')
local gears = require('gears')
local beautiful = require('beautiful')

local tags = {
    {
        type = 'chrome',
        defaultApp = 'google-chrome-beta',
        screen = 1
    },
    {
        type = 'code',
        defaultApp = 'code',
        screen = 1
    },
    {
        type = 'social',
        defaultApp = 'station',
        screen = 1
    },
    {
        type = 'files',
        defaultApp = 'nautilus',
        screen = 1
    },
    {
        type = 'music',
        defaultApp = 'youtube-music',
        screen = 1
    },
    {
        type = 'game',
        defaultApp = '',
        screen = 1
    },
    {
        type = 'any',
        defaultApp = '',
        screen = 1
    }
}

awful.layout.layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.max
}

awful.screen.connect_for_each_screen(
    function(s)
        for i, tag in pairs(tags) do
        local new_tag =
            awful.tag.add(
                i,
                {
                    layout = awful.layout.suit.tile,
                    gap_single_client = false,
                    gap = beautiful.useless_gap,
                    screen = s,
                    defaultApp = tag.defaultApp,
                    selected = i == 1
                }
            )
        end
    end
)

-- tag.connect_signal(
--     'property::layout',
--     function(t)
--         local currentLayout = awful.tag.getproperty(t, 'layout')
--         if (currentLayout == awful.layout.suit.max) then
--             t.gap = 0
--         else
--             t.gap = 4
--         end
--     end
-- )
