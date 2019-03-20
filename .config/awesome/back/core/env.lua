-----------------------------------------------------------------------------------------------------------------------
-- Environment config
-----------------------------------------------------------------------------------------------------------------------

local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
local naughty = require("naughty")

local core = require("core.util")

-- Initialize tables and vars for module
-----------------------------------------------------------------------------------------------------------------------
local env = {}

-- Build hotkeys depended on config parameters
-----------------------------------------------------------------------------------------------------------------------
function env:init(args)
	-- init vars
	local args = args or {}
	local theme = args.theme or "skyfall"

	-- environment vars
	self.term = args.term or "urxvt"
	self.mod = args.mod or "Mod4"
	self.alt = args.alt or "Mod1"
	self.filemgr = args.filemgr or "nemo"
	self.home = os.getenv("HOME")
	self.themedir = awful.util.get_configuration_dir() .. "themes/" .. theme

	-- theme setup
	beautiful.init(env.themedir .. "/theme.lua")

	-- naughty setup
	naughty.config.padding = beautiful.useless_gap and 2 * beautiful.useless_gap or 0

	if beautiful.naughty then
		naughty.config.presets.normal   = util.table.merge(beautiful.naughty.base, beautiful.naughty.normal)
		naughty.config.presets.critical = util.table.merge(beautiful.naughty.base, beautiful.naughty.critical)
		naughty.config.presets.low      = util.table.merge(beautiful.naughty.base, beautiful.naughty.low)

		-- dirty fix to ignore forced geometry for critical preset
		-- For the sake of laziness I prefer fix some parameters after inherit than write pure table without inherit
		naughty.config.presets.critical.height, naughty.config.presets.critical.width = nil, nil
	end
end

-- Wallpaper setup
-----------------------------------------------------------------------------------------------------------------------

env.wallpaper = function(s)
	if beautiful.wallpaper then
		if awful.util.file_readable(beautiful.wallpaper) then
			gears.wallpaper.maximized(beautiful.wallpaper, s, true)
		else
			gears.wallpaper.set(beautiful.color.bg)
		end
	end
end

-- Panel widgets wrapper
--------------------------------------------------------------------------------
env.wrapper = function(widget, name, buttons)
	local margin = redflat.util.table.check(beautiful, "widget.wrapper") and beautiful.widget.wrapper[name]
	               and beautiful.widget.wrapper[name] or { 0, 0, 0, 0 }
	if buttons then
		widget:buttons(buttons)
	end

	return wibox.container.margin(widget, unpack(margin))
end

-- End
-----------------------------------------------------------------------------------------------------------------------
return env
