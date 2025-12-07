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

     settings = {
      init.defaultBranch = "main";
      user.useConfigOnly = true;
      commit.gpgsign = true;
      alias = {
        identity = "! git-identity";
        id = "! git-identity";
      };
    };
  };
}
