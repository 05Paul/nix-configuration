{ ... }:
{
  programs.nixvim.plugins.dashboard = {
    enable = true;
    settings = {
      theme = "hyper";
      config = {
        mru = {
          cwd_only = true;
        };

        shortcut = [
          {
            action = "Telescope find_files";
            desc = "Files";
            group = "Label";
            icon = " ";
            icon_hl = "@variable";
            key = "f";
          }
          {
            action = {
              __raw = ''
                function()
                  require("telescope.builtin").find_files({
                    cwd = vim.fn.expand("~/configuration"),
                  })
                end
              '';
            };
            desc = " dotfiles";
            group = "Number";
            key = "d";
          }
        ];

        week_header = {
         enable = true;
        };
      };
    };
  };
}
