{ ... }:
{
  programs.firefox = {
    enable = true;
    profiles = {
      paul = {
      };
    };
  };

  stylix.targets.firefox.profileNames = [ "paul" ];
}
