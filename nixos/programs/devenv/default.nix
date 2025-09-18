{ host, ... }: {
  nix.settings.trusted-users = [
    host.user
  ];

  home-manager.users."${host.user}" = {
    imports = [
      ../../../home-manager/programs/devenv
    ];
  };
}
