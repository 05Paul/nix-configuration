{ pkgs, lib, config, ... }:
let
  gitIdentity = pkgs.writeShellScriptBin "git-identity" (builtins.readFile ./git-identity);
  gitUsers =  config.customization.git.users;
in 
{
  home.packages = with pkgs; [
    gitIdentity
    fzf
    jc
    jq
  ];

  programs.git = {
    enable = true;

    settings = {
      init.defaultBranch = "main";
      commit.gpgsign = true;
      alias = {
        identity = "! git-identity";
        id = "! git-identity";
      };
      user = { 
        useConfigOnly = gitUsers.personal.enable;
      } // lib.optionalAttrs gitUsers.personal.enable {
        personal = {
          name = "Paul Skamrada";
          email = "pl.skamrada@gmail.com";
          signingKey = gitUsers.personal.signingKey;
        };
      } // lib.optionalAttrs gitUsers.uni.enable {
        uni = {
          name = "Paul Skamrada";
          email = "e12523107@student.tuwien.ac.at";
        };
      };
    };
  };
}
