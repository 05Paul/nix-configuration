{ ... }:
{
  imports = [
    ./default.nix
  ];

  programs.ssh.settings."g0.complang.tuwien.ac.at" = {
      User = "gitolite3";
      IdentityFile = "~/.ssh/id_pp_2026";
      IdentitiesOnly = true;
  };
}
