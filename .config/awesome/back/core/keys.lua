-----------------------------------------------------------------------------------------------------------------------
-- Hotkeys and mouse button config
-----------------------------------------------------------------------------------------------------------------------

local awful = require("awful")
local gears = require("gears")
local util  = require("core.util")

local keys = {}

local shiftkey = "Shift"
local ctrlkey  = "Control"

function keys:init(args)
    local args = args
    local env = args.env

    keys.globalkeys = gears.table.join(
        -- Standard programs
        awful.key({ env.mod }, "Return",
            function()
                awful.spawn(env.term)
            end, { description = "open a terminal", group = "launcher" }
        ),
        awful.key({ env.mod, ctrlkey, shiftkey }, "q", awesome.quit,
            { description = "quit awesome", group = "awesome" }        ),
        awful.key({ env.mod, ctrlkey }, "r", awesome.restart,
            { description = "reload awesome", group = "awesome" }
        ),

        awful.key({ env.mod }, "space",
            function()
                awful.spawn.with_shell("rofi -show combi")
            end, { description = "launch runner" } 
        )
    )

    keys.clientkeys = gears.table.join(
        awful.key({ env.mod, }, "f",
            function (c)
                c.fullscreen = not c.fullscreen
                c:raise()
            end, {description = "toggle fullscreen", group = "client"}
        ),
        awful.key({ env.mod, env.alt }, "q",
            function (c)
                c:kill()
            end, {description = "kill client", group = "client"}
        ),
        -- awful.key({ env.mod, "Control" }, "space", 
        --     awful.client.floating.toggle,
        --     {description = "toggle floating", group = "client"}
        -- ),
        awful.key({ env.mod, "Control" }, "Return",
            function (c)
                c:swap(awful.client.getmaster())
            end, {description = "move to master", group = "client"}
        ),
        awful.key({ env.mod, }, "o", 
            function (c)
                c:move_to_screen()
            end, {description = "move to screen", group = "client"}
        ),
        awful.key({ env.mod, }, "t",
            function (c)
                c.ontop = not c.ontop
            end, {description = "toggle keep on top", group = "client"}
        ),
        awful.key({ env.mod, }, "n",
            function (c)
                -- The client currently has the input focus, so it cannot be
                -- minimized, since minimized clients can't have the focus.
                c.minimized = true
            end, {description = "minimize", group = "client"}
        ),
        awful.key({ env.mod, }, "m",
            function (c)
                c.maximized = not c.maximized
                c:raise()
            end, {description = "(un)maximize", group = "client"}
        ),
        awful.key({ env.mod, "Control" }, "m",
            function (c)
                c.maximized_vertical = not c.maximized_vertical
                c:raise()
            end, {description = "(un)maximize vertically", group = "client"}
        ),
        awful.key({ env.mod, "Shift" }, "m",
            function (c)
                c.maximized_horizontal = not c.maximized_horizontal
                c:raise()
            end, {description = "(un)maximize horizontally", group = "client"}
        )
    )

    local xf86keys = gears.table.join(
        awful.key({ }, "XF86MonBrightnessUp",
            function()
                awful.spawn.easy_async_with_shell("light -A 5",
                    function()
                        awesome.emit_signal("brightness_changed")
                    end
                )
            end, { description = "increase screen brightness", group = "brightness" } 
        ),
        awful.key({ }, "XF86MonBrightnessDown",
            function()
                awful.spawn.easy_async_with_shell("light -U 5",
                    function()
                        awesome.emit_signal("brightness_changed")
                    end
                )
            end, { description = "increase screen brightness", group = "brightness" } 
        )
    )

    -- Bind all key numbers to tags.
    -- Be careful: we use keycodes to make it work on any keyboard layout.
    -- This should map on the top row of your keyboard, usually 1 to 9.
    local tagkeys = {}
    local ntags = 10
    for i = 1, ntags do
        tagkeys = gears.table.join(tagkeys,
            -- View tag only.
            awful.key({ env.mod }, "#" .. i + 9,
                function ()
                    local screen = awful.screen.focused()
                    local tag = screen.tags[i]
                    local current_tag = screen.selected_tag
                    -- Tag back and forth:
                    -- If you try to focus the same tag you are at,
                    -- go back to the previous tag.
                    -- Useful for quick switching after for example
                    -- checking an incoming chat message at tag 2
                    -- and coming back to your work at tag 1
                    if tag then
                        if tag == current_tag then
                            awful.tag.history.restore()
                        else
                            tag:view_only()
                        end
                    end
                    -- Simple tag view
                    --if tag then
                        --tag:view_only()
                    --end
                end, {description = "view tag #"..i, group = "tag"}
            ),
            -- Toggle tag display.
            awful.key({ env.mod, ctrlkey }, "#" .. i + 9,
                function ()
                    local screen = awful.screen.focused()
                    local tag = screen.tags[i]
                    if tag then
                        awful.tag.viewtoggle(tag)
                    end
                end, {description = "toggle tag #" .. i, group = "tag"}
            ),
            -- Move client to tag.
            awful.key({ env.mod, shiftkey }, "#" .. i + 9,
                function ()
                    if client.focus then
                        local tag = client.focus.screen.tags[i]
                        if tag then
                            client.focus:move_to_tag(tag)
                        end
                    end
                end, {description = "move focused client to tag #"..i, group = "tag"}
            ),
            -- Move all visible clients to tag and focus that tag
            awful.key({ env.mod, env.alt }, "#" .. i + 9,
                function ()
                    local tag = client.focus.screen.tags[i]
                    local clients = awful.screen.focused().clients
                    if tag then
                        for _, c in pairs(clients) do
                            c:move_to_tag(tag)
                        end
                        tag:view_only()
                    end
                end, {description = "move all visible clients to tag #"..i, group = "tag"}
            ),
            -- Toggle tag on focused client.
            awful.key({ env.mod, ctrlkey, shiftkey }, "#" .. i + 9,
                function ()
                    if client.focus then
                        local tag = client.focus.screen.tags[i]
                        if tag then
                            client.focus:toggle_tag(tag)
                        end
                    end
                end, {description = "toggle focused client on tag #" .. i, group = "tag"}
            )
        )
    end

    keys.globalkeys = gears.table.join(keys.globalkeys, xf86keys)
    keys.globalkeys = gears.table.join(keys.globalkeys, tagkeys)
    root.keys(keys.globalkeys)
end

return keys