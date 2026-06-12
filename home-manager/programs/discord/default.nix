{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # discord
  ];

  programs.discord = {
    enable = true;
  };

/*
  xdg.configFile."applications/discord.desktop".text = ''
    [Desktop Entry]
    Hidden=true
  '';

  xdg.desktopEntries.discord = {
    name = "Discord";
    genericName = "Chat";
    exec = ''bash -lc "Discord"'';
    icon = "discord";
    terminal = false;
    categories = [
      "Network"
      "InstantMessaging"
    ];
  };
*/
}
