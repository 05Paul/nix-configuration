{ pkgs, config, ... }:
let
  inherit (config.customization) user;
in
{
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    image = ../../../styles/catppuccin-mocha/background.jpg;
    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };
    };

    opacity = {
      terminal = 0.75;
    };
  };

  home-manager.users."${user.name}" = {
    stylix.icons = {
      enable = true;
      package = pkgs.papirus-icon-theme;
      dark = "Papirus-Dark";
    };
  };
}
