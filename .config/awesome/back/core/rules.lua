
local awful = require("awful")
local beautiful = require("beautiful")

local rules = {}

rules.base_properties = {
	border_width     = beautiful.border_width,
	border_color     = beautiful.border_normal,
	focus            = awful.client.focus.filter,
	raise            = true,
	size_hints_honor = false,
	screen           = awful.screen.preferred,	
}

function rules:init(args)
	local args = args or {}
	self.base_properties.keys = args.keys.clientkeys

	self.rules = {
		{
			rule = {},
			properties = args.base_properties or self.base_properties
		},
		{
			rule_any = args.floating_any or self.floating_any,
			properties = { floating = true }
		}
		{
			rule_any = self.maximized,
			callback = function(c)
				c.maximized = true
				c.hight = c.screen.workarea.height - 2 * c.border_width
			end
		}
		-- {
		-- 	rule_any = { type = { "normal", "dialog" }},
		-- 	expect_any = 
		-- }
	}

	-- Set rules
	---------------------------------------------------------------------------
end

-- End
-----------------------------------------------------------------------------------------------------------------------
return rules