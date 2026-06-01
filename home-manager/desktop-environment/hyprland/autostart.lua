hl.on("hyprland.start", function()
    hl.exec_cmd("hyprlock")
    hl.exec_cmd("hyprpanel")
    hl.exec_cmd("wl-paste --type text --watch cliphist store")  -- stores only text data
    hl.exec_cmd("wl-paste --type image --watch cliphist store") -- stores only image data
    hl.exec_cmd("antimicrox --tray --profile ~/.config/antimicrox/default.gamecontroller.amgp")
end)
