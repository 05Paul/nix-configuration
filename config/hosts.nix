let
  users = import ./users.nix;
in
{
  vm = {
    hostname = "nixos";
    dir = "nixos-vm";
    arch = "x86_64-linux";
    user = users.personal;
    features = {
      battery = false;
      wifi = false;
      fingerprint = false;
    };
  };
  
  desktop = {
    hostname = "nixos-desktop";
    dir = "nixos-desktop";
    arch = "x86_64-linux";
    user = users.personal;
    features = {
      battery = false;
      wifi = false;
      fingerprint = false;
    };
  };

  laptop = {
    hostname = "nixos-laptop";
    dir = "nixos-laptop";
    arch = "x86_64-linux";
    user = users.personal;
    features = {
      battery = true;
      wifi = true;
      fingerprint = true;
    };

    git.users = {
      personal = {
        name = "Paul Skamrada"; # TODO make variable
        email = "pl.skamrada@gmail.com";
        signingKey = "";
      };
    };
  };
}
