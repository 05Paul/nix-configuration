{ config, ... }:
  let user = config.customization.user;
in 
{
  imports = [
    ../../../options/user
  ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."${user.name}" = {
    isNormalUser = true;
    description = "${user.description}";
    extraGroups = [ 
      "networkmanager" 
      "wheel"
    ];
  };
}
