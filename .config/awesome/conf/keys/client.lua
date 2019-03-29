local awful = require('awful')
local gears = require('gears')

local mod = 'Mod4'
local alt = 'Mod1'
local ctrl = 'Control'
local shift = 'Shift'

local clientkeys = gears.table.join(
    awful.key({ mod }, 'f',
        function(c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        { description = 'Toggle fullscreen', group = 'Client' }
    ),
    awful.key({ mod, ctrl }, 'f',
        awful.client.floating.toggle,
        { description = 'Toggle fullscreen', group = 'Client' }
    ),
    awful.key({ mod }, 'BackSpace',
        function(c)
            c:kill()
        end,
        { description = 'Close', group = 'Client' }
    ),
    awful.key({ mod }, 't',
        function(c)
            c.ontop = not c.ontop
        end,
        { description = 'Toggle keep on top', group = 'Client' }
    ),
    awful.key({ mod }, 'n',
        function(c)
            c.minimized = not c.minimized
        end,
        { description = 'Minimize', group = 'Client' }
    ),
    awful.key({ mod }, 'm',
        function(c)
            c.maximized = not c.maximized
            c:raise()
        end,
        { description = 'Maximize', group = 'Client' }
    )
)

return clientkeys
