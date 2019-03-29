local awful = require('awful')
local gears = require('gears')

local clientkeys = require('conf.keys.client')

awful.rules.rules = {
    -- All client will match this rule
    {
        rule = {},
        properties = {
            focus = awful.client.focus.filter,
            raise = true,
            keys = clientkeys,
            buttons = {},
            screen = awful.screen.preferred,
            placement = awful.placement.no_offscreen
        }
    },
    {
        rule_any = { type = { 'normal', 'dialog' } },
        properties = {
            titlebars_enabled = true
        }
    }
}
