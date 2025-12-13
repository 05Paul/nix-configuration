{ ... }:
{
  programs.bash = {
    enable = true;
    shellAliases = {
      ssh = "kitten ssh";
    };
  };

  programs.starship = {
    enableBashIntegration = true;
  };
}
