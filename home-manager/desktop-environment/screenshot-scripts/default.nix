{ ... }:
{
  imports = [
    ../hyprshot
    ../satty
  ];

  home.file.".local/bin/screenshot" = {
    source = ./screenshot.sh;
    executable = true;
  };

  home.file.".local/share/screenshot/󰍹\ Active\ Monitor" = {
    source = ./active_output.sh;
    executable = true;
  };
  home.file.".local/share/screenshot/󱂬\ Active\ Window" = {
    source = ./active_window.sh;
    executable = true;
  };
  home.file.".local/share/screenshot/󱊅\ Select\ Window" = {
    source = ./select_window.sh;
    executable = true;
  };

}
