{ pkgs, ... }:
{
  home.packages = [
    pkgs.luaPackages.tree-sitter-cli
  ];

  programs.nixvim.plugins.treesitter = {
    enable = true;
  };
}
