
{ ... }:
{
  imports = [
    ./plugins/base-16
    ./plugins/bufferline
    ./plugins/cmp
    ./plugins/conform
    ./plugins/dap
    ./plugins/dashboard
    ./plugins/lsp
    ./plugins/lualine
    ./plugins/markview
    ./plugins/telescope
    ./plugins/transparent
    ./plugins/treesitter
    ./plugins/web-devicons
    ./plugins/which-key
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    luaLoader.enable = true;
    
    globals = {
      mapleader = " ";
      maplocalleader = "\\";
    };

    opts = {
      completeopt = [ 
        "menu"
        "menuone"
        "noselect"
      ];
      expandtab = true;
      number = true;
      signcolumn = "number";
      shiftwidth = 4;
      tabstop = 4;
    };

    diagnostic.settings = {
      virtual_lines = {
        current_line = true;
      };
      virtual_text = false;
    };

  };
}
