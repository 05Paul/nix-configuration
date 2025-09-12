{ ... }: {
  programs.nixvim.plugins.cmp = {
    enable = true;
    autoEnableSources = true;

    settings.sources = [
      {
        name = "lazydev";
      }
      {
        name = "nvim_lsp";
      }
      {
        name = "path";
      }
      {
        name = "buffer";
      }
    ];

    settings.mapping = {
      "<C-b>" = "cmp.mapping.scroll_docs(-4)";
      "<C-f>" = "cmp.mapping.scroll_docs(4)";
      "<C-Space" = "cmp.mapping.complete()";
      "<C-e>" = "cmp.mapping.abort()";
      "<CR>" = "cmp.mapping.confirm({ select = true })";
      "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
      "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
    };

    cmdline = {
      ":" = {
        mapping = {
          __raw = "cmp.mapping.preset.cmdline()";
        };

        sources = [
          {
            name = "path";
          }
          {
            name = "cmdline";
          }
        ];
      };
    };
  };
}
