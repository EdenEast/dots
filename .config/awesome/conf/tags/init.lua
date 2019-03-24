local gears = require('gears')
local awful = require('awful')

local tags = {
    {
        type = 'main',
        defaultapp = '',
        screen = 1
    },
    {
        type = 'code',
        defaultapp = 'code',
        screen = 1
    },
    {
        type = 'brower',
        defaultapp = 'vivalid-stable',
        screen = 1
    },
    {
        type = 'files',
        defaultapp = 'thunar',
        screen = 1
    },
    {
        type = 'music',
        defaultapp = 'ncmpcpp',
        screen = 1
    },
    {
        type = 'game',
        defaultapp = '',
        screen = 1
    },
    {
        type = 'any',
        defaultapp = '',
        screen = 1
    },
    {
        type = 'any',
        defaultapp = '',
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
            local newtag = awful.tag.add(
                i, {
                    layout = awful.layout.suit.tile,
                    gap_single_client = false,
                    gaps = 4,
                    screen = s,
                    defualtApp = tag.defaultapp,
                    selected = i == 1
                }
            )
        end
    end
)

tag.connect_signal('property::layout',
    function(t)
        local current = awful.tag.getproperty(t, 'layout')
        if (current == awful.layout.suit.max) then
            t.gap = 0
        else
            t.gap = 4
        end
    end
)


