-- default
hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = 1,
    mirror = "eDP-1",
})

-- laptop monitor
hl.monitor({
    output = "eDP-1",
    mode = "2256x1504@60",
    position = "0x0",
    scale = 1,
})

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
