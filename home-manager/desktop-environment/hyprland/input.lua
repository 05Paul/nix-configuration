-- input
hl.config({
    input = {
        kb_layout = "at",
        kb_options = "grp:alt_space_toggle",

        touchpad = {
            natural_scroll = true,
        },

        touchdevice = {
            output = "desc:Wacom Tech Wacom One 13T 5BQ01D1000268",
        },
    }
})

-- gestures
hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace",
})

hl.gesture({
    fingers = 4,
    direction = "up",
    action = function()
        hl.exec_cmd("toggle_osk")
    end
})

-- device
hl.device({
    name = "wacom-one-pen-display-13.3\"-with-touch-pen",
    output = "desc:Wacom Tech Wacom One 13T 5BQ01D1000268",
})
