-- default
hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = 1,
    mirror = "eDP-1",
})

-- laptop monitor
local laptopMonitor = {
    output = "eDP-1",
    mode = "2256x1504@60",
    position = "0x0",
    scale = 1,
}

hl.monitor(laptopMonitor)

local function disableLaptopMonitor()
    hl.monitor({
        output = laptopMonitor.output,
        disabled = true,
    })
end

hl.bind(
    "switch:on:Lid Switch",
    disableLaptopMonitor,
    {
        description = "Disable laptop monitor",
        locked = true,
    }
)

local function enableLaptopMonitor()
    hl.monitor({
        output = laptopMonitor.output,
        mode = laptopMonitor.mode,
        position = laptopMonitor.position,
        scale = laptopMonitor.scale,
        disabled = false,
    })

    hl.exec_cmd("hyprctl reload") -- HACK: should not be required in 0.56
end

hl.bind(
    "switch:off:Lid Switch",
    function()
        hl.timer(
            enableLaptopMonitor,
            { timeout = 500, type = "oneshot" }
        )
    end,
    {
        description = "Enable laptop monitor",
        locked = true,
    }
)

-- drawing tablet
hl.monitor({
    output = "desc:Wacom Tech Wacom One 13T 5BQ01D1000268",
    mode = "1920x1080@60",
    position = "2256x0",
    scale = 1,
})

-- tv
hl.monitor({
    output = "desc:Sony SONY TV  *30 0x01010101",
    disabled = true,
})

-- right monitor
hl.monitor({
    output = "desc:LG Electronics LG ULTRAGEAR 306MAPN8HB88",
    mode = "2560x1440@144",
    position = "2560x-1440",
    scale = 1,
    supports_hdr = 0,
})

-- left monitor
hl.monitor({
    output = "desc:LG Electronics LG ULTRAGEAR 306MAVD8HB87",
    mode = "2560x1440@144",
    position = "0x-1440",
    scale = 1,
    supports_hdr = 0,
})
