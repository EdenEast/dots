-----------------------------------------------------------------------------------------------------------------------
-- Hotkeys and mouse button configuration
-----------------------------------------------------------------------------------------------------------------------

local awful = require("awful")
local gears = require("gears")

-- Initalize tables and vars for modules
local keys = {}

altkey = "Mod1"
ctrlkey = "Control"
shiftkey = "Shift"

-- Key support functions
-----------------------------------------------------------------------------------------------------------------------


-- Build hotkeys
-----------------------------------------------------------------------------------------------------------------------
function keys:init(args)
	local args = args or {}
	local env = args.env or {}
	local appkeys = args.appkeys or {}

	-- Global keys
	-------------------------------------------------------------------------------
	keys.globalkeys = gears.table.join(
		awful.key( { env.mod }, "Return", 
			function()
				awful.spawn(env.term)
			end,
			{ description = "Open a terminal", group = "launcher" }
		),
		awful.key( { env.mod, shiftkey }, "q", 
			function()
				local clients = awful.screen.focused().clients
				for _, c in pairs(clients) do
					c:kill()
				end
			end,
			{ description = "Kill all visible clients for this current tag", group = "gaps" }
		),
		awful.key( { env.mod, ctrlkey }, "r",
			awesome.restart 
			{ description = "Restart awesome", group = "gaps" }
		)
	)

	-- Bind number keys to tags
	-------------------------------------------------------------------------------
	local ntags = 10
	for i = 1, ntags do
		keys.globalkeys = gears.table.join(keys.globalkeys,
			-- View tag
			awful.key( { env.mod }, "#" .. i + 9, 
				function()
					local screen = awful.screen.focused()
					local tag = screen.tags[i]
					local current_tag = screen.selected_tag

					if tag then
						if tag == current_tag then
							awful.tag.history.restore()
						else
							tag:view_only()
						end
					end
				end,
				{ description = "view tag #"..i, group = "tag" }
			),

			-- Toggle tag
			awful.key( { superkey, ctrlkey }, "#" .. i + 9, 
				function ()
					local screen = awful.screen.focused()
					local tag = screen.tags[i]
					if tag then
						awful.tag.viewtoggle(tag)
					end
				end,
				{ description = "toggle tag #" .. i, group = "tag" }
			),

			-- Move client to tag.
			awful.key( { superkey, shiftkey }, "#" .. i + 9, 
				function ()
					if client.focus then
						local tag = client.focus.screen.tags[i]
						if tag then
							client.focus:move_to_tag(tag)
						end
					end
				end,
				{ description = "move focused client to tag #"..i, group = "tag" }
			),
			
			-- Move all visible clients to tag and focus that tag
			awful.key({ superkey, altkey }, "#" .. i + 9, 
				function ()
                    local tag = client.focus.screen.tags[i]
                    local clients = awful.screen.focused().clients
                    if tag then
                        for _, c in pairs(clients) do
                           c:move_to_tag(tag)
                        end
                        tag:view_only()
                    end
				end,
				{ description = "move all visible clients to tag #"..i, group = "tag" }
			),
			-- Toggle tag on focused client.
			awful.key({ superkey, ctrlkey, shiftkey }, "#" .. i + 9,
				function ()
					if client.focus then
						local tag = client.focus.screen.tags[i]
						if tag then
							client.focus:toggle_tag(tag)
						end
					end
				end,
				{ description = "toggle focused client on tag #" .. i, group = "tag"}
			)
		)
	end

	root.keys(keys.globalkeys)
end

-- End
-----------------------------------------------------------------------------------------------------------------------
return keys
