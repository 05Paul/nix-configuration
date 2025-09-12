{ pkgs, ... }:
let
  gitIdentity = pkgs.writeShellScriptBin "git-identity" (builtins.readFile ./git-identity);
in 
{
  home.packages = with pkgs; [
    gitIdentity
    fzf
  ];

  programs.git = {
    enable = true;

    aliases = {
      identity = "! git-identity";
      id = "! git-identity";
    };

    extraConfig = {
      init.defaultBranch = "main";
      user.useConfigOnly = true;
      commit.gpgsign = true;
    };
  };
}
