{ config, ... }:
  let user = config.customization.user;
in
{
  home = {
    username = "${user.name}";
    homeDirectory = "/home/${user.name}";
    stateVersion = "25.05";
  };
}
