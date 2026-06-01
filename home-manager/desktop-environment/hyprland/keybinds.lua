local mainMod = "SUPER"
local terminal = "alacritty"

-------------------------------------------------------------------------------
-- utility programs
-------------------------------------------------------------------------------
hl.bind(
    mainMod .. " + B",
    hl.dsp.exec_cmd("firefox"),
    {
        description = "Open firefox",
    }
)

hl.bind(
    mainMod .. " + P",
    hl.dsp.exec_cmd("pkill hyprmon || kitty --class floating hyprmon"),
    {
        description = "Toggle hyprmon tui",
    }
)

hl.bind(
    mainMod .. " + N",
    hl.dsp.exec_cmd("pkill nmtui || kitty --class floating nmtui"),
    {
        description = "Toggle hyprmon tui",
    }
)

hl.bind(
    mainMod .. " + R",
    hl.dsp.exec_cmd("pkill hyprpanel -9; hyprpanel& systemctl --user restart hyprshell"),
    {
        description = "Restart Panel & Shell",
    }
)

hl.bind(
    mainMod .. " + T",
    hl.dsp.exec_cmd(terminal),
    {
        description = "Terminal",
    }
)

hl.bind(
    mainMod .. " + V",
    hl.dsp.exec_cmd("clipboard"),
    {
        description = "Clipboard",
    }
)

hl.bind(
    mainMod .. " + Space",
    hl.dsp.exec_cmd("hyprlauncher"),
    {
        description = "Launcher",
    }
)

hl.bind(
    "Print",
    hl.dsp.exec_cmd("screenshot"),
    {
        description = "Screenshot",
    }
)

-------------------------------------------------------------------------------
-- hyprland general
-------------------------------------------------------------------------------
hl.bind(
    mainMod .. " + F",
    hl.dsp.window.float(),
    {
        description = "Toggle floating",
    }
)

hl.bind(
    mainMod .. " + L",
    hl.dsp.exec_cmd("hyprlock"),
    {
        description = "Lock screen",
    }
)

hl.bind(
    mainMod .. " + Q",
    hl.dsp.exec_cmd("hyprshutdown"),
    {
        description = "Quit hyprland",
    }
)

hl.bind(
    mainMod .. " + Q",
    hl.dsp.exit(),
    {
        description = "Force quit hyprland",
        long_press = true,
    }
)

hl.bind(
    mainMod .. " + page_up",
    hl.dsp.window.fullscreen(),
    {
        description = "Toggle fullscreen",
    }
)

hl.bind(
    "ALT + F4",
    hl.dsp.window.close(),
    {
        description = "Close window",
    }
)

hl.bind(
    "ALT + F4",
    hl.dsp.window.kill(),
    {
        description = "Kill active window",
        long_press = true,
    }
)

-------------------------------------------------------------------------------
-- hyprland focus
-------------------------------------------------------------------------------
hl.bind(
    mainMod .. " + left",
    hl.dsp.focus({
        direction = "left"
    }),
    {
        description = "Move focus left",
    }
)

hl.bind(
    mainMod .. " + right",
    hl.dsp.focus({
        direction = "right"
    }),
    {
        description = "Move focus right",
    }
)

hl.bind(
    mainMod .. " + up",
    hl.dsp.focus({
        direction = "up"
    }),
    {
        description = "Move focus up",
    }
)

hl.bind(
    mainMod .. " + down",
    hl.dsp.focus({
        direction = "down"
    }),
    {
        description = "Move focus down",
    }
)

-------------------------------------------------------------------------------
-- hyprland workspace
-------------------------------------------------------------------------------
for i = 1, 10 do
    local key = i % 10
    hl.bind(
        mainMod .. " + " .. key,
        hl.dsp.focus({
            workspace = i
        }),
        {
            description = "Switch to workspace " .. i,
        }
    )

    hl.bind(
        mainMod .. " + SHIFT + " .. key,
        hl.dsp.window.move({
            workspace = i
        }),
        {
            description = "Move to workspace " .. i,
        }
    )
end

hl.bind(
    mainMod .. " + S",
    hl.dsp.workspace.toggle_special(),
    {
        description = "Toggle special workspace",
    }
)

hl.bind(
    mainMod .. " + SHIFT + S",
    hl.dsp.window.move({
        workspace = "special",
    }),
    {
        description = "Move to special workspace"
    }
)

hl.bind(
    mainMod .. " + SHIFT + right",
    hl.dsp.window.move({
        workspace = "+1",
    }),
    {
        description = "Move to next workspace",
    }
)

hl.bind(
    mainMod .. " + SHIFT + left",
    hl.dsp.window.move({
        workspace = "-1",
    }),
    {
        description = "Move to previous workspace",
    }
)

hl.bind(
    mainMod .. " + SHIFT + up",
    hl.dsp.window.move({
        monitor = "+1",
    }),
    {
        description = "Move to next monitor",
    }
)

hl.bind(
    mainMod .. " + SHIFT + down",
    hl.dsp.window.move({
        monitor = "-1",
    }),
    {
        description = "Move to previous monitor",
    }
)

-------------------------------------------------------------------------------
-- hyprland groups
-------------------------------------------------------------------------------
hl.bind(
    mainMod .. " + G",
    hl.dsp.group.toggle(),
    {
        description = "Toggle group",
    }
)

hl.bind(
    mainMod .. " + SHIFT + G",
    hl.dsp.window.move({
        out_of_group = true,
    }),
    {
        description = "Move out of group",
    }
)

hl.bind(
    mainMod .. " + TAB",
    hl.dsp.group.next(),
    {
        description = "Cycle to next window in group",
    }
)

hl.bind(
    mainMod .. " + SHIFT + TAB",
    hl.dsp.group.prev(),
    {
        description = "Cycle to previous window in group",
    }
)

hl.bind(
    mainMod .. " + SHIFT + CTRL + left",
    hl.dsp.window.move({
        into_group = "left",
    }),
    {
        description = "Move into group left",
    }
)

hl.bind(
    mainMod .. " + SHIFT + CTRL + right",
    hl.dsp.window.move({
        into_group = "right",
    }),
    {
        description = "Move into group right",
    }
)

hl.bind(
    mainMod .. " + SHIFT + CTRL + up",
    hl.dsp.window.move({
        into_group = "up",
    }),
    {
        description = "Move into group up",
    }
)

hl.bind(
    mainMod .. " + SHIFT + CTRL + down",
    hl.dsp.window.move({
        into_group = "down",
    }),
    {
        description = "Move into group down",
    }
)

-------------------------------------------------------------------------------
-- laptop lid switch actions
-------------------------------------------------------------------------------
hl.bind(
    "switch:on:Lid Switch",
    hl.dsp.exec_cmd("brightnessctl set 0%"),
    {
        description = "Set brightness to 0%",
        locked = true,
    }
)

hl.bind(
    "switch:off:Lid Switch",
    hl.dsp.exec_cmd("brightnessctl -r"),
    {
        description = "Set brightness to previous value",
        locked = true,
    }
)

-------------------------------------------------------------------------------
-- media control
-------------------------------------------------------------------------------
hl.bind(
    "XF86AudioPlay",
    hl.dsp.exec_cmd("playerctl play-pause"),
    {
        description = "Play/Pause",
        locked = true,
    }
)

hl.bind(
    "XF86AudioNext",
    hl.dsp.exec_cmd("playerctl position 5+"),
    {
        description = "Forward 5 seconds",
        locked = true,
    }
)

hl.bind(
    "XF86AudioPrev",
    hl.dsp.exec_cmd("playerctl position 5-"),
    {
        description = "Rewing 5 seconds",
        locked = true,
    }
)

hl.bind(
    "XF86AudioMute",
    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    {
        description = "Mute audio",
        locked = true,
    }
)

hl.bind(
    "XF86AudioRaiseVolume",
    hl.dsp.exec_cmd("wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+"),
    {
        description = "Increase audio volume by 5%",
        locked = true,
    }
)

hl.bind(
    "XF86AudioLowerVolume",
    hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    {
        description = "Decrease audio volume by 5%",
        locked = true,
    }
)

hl.bind(
    "XF86AudioNext",
    hl.dsp.exec_cmd("playerctl next"),
    {
        description = "Next song",
        locked = true,
        long_press = true,
    }
)

hl.bind(
    "XF86AudioPrev",
    hl.dsp.exec_cmd("playerctl previous"),
    {
        description = "Previous song",
        locked = true,
        long_press = true,
    }
)

-------------------------------------------------------------------------------
-- brightness control
-------------------------------------------------------------------------------
hl.bind(
    "XF86MonBrightnessUp",
    hl.dsp.exec_cmd("brightnessctl set +5%; brightnessctl -s"),
    {
        description = "Increase brightness by 5%",
        locked = true,
    }
)

hl.bind(
    "XF86MonBrightnessDown",
    hl.dsp.exec_cmd("brightnessctl set 5%-; brightnessctl -s"),
    {
        description = "Decrease brightness by 5%",
        locked = true,
    }
)
