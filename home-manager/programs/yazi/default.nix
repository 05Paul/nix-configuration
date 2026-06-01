{ ... }:
{
  programs.yazi = {
    enable = true;
    enableBashIntegration = true;
    shellWrapperName = "y";
  };

  xdg.desktopEntries = {
    yazi-window = {
      name = "Yazi (kitty)";
      icon = "yazi";
      comment = "Blazing fast terminal file manager written in Rust, based on Async I/O";
      terminal = true;
      exec = "kitty -e yazi";
    };
  };
}
