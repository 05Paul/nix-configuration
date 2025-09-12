{ ... }:
{
  programs.nixvim.plugins.which-key = {
    enable = true;
    settings = {
      spec = [
        # Groups
        {
          __unkeyed-1 = "<leader>f";
          group = "Telescope";
        }
        {
          __unkeyed-1 = "<leader>l";
          group = "LSP";
        }
        {
          __unkeyed-1 = "<leader>d";
          group = "Debug";
        }
        {
          __unkeyed-1 =  "<leader>b";
          group = "Bufferline";
        }

        # DAP
        {
          __unkeyed-1 = "<leader>dt";
          __unkeyed-2 = {
            __raw = ''
              function()
                require("dapui").toggle()
              end
            '';
          };
          desc = "Toggle DAP";
        }
        {
          __unkeyed-1 = "<leader>db";
          __unkeyed-2 = {
            __raw = ''
              function()
                require("dap").toggle_breakpoint()
              end
            '';
          };
          desc = "Toggle breakpoint";
        }
        
        # Bufferline
        {
          __unkeyed-1 = "<leader>bl";
          __unkeyed-2 = "<cmd>BufferLineMovePrev<CR>";
          desc = "Move left";
        }
        {
          __unkeyed-1 = "<leader>br";
          __unkeyed-2 = "<cmd>BufferLineMoveNext<CR>";
          desc = "Move right";
        }
        {
          __unkeyed-1 = "<leader>bn";
          __unkeyed-2 = "<cmd>BufferLineCycleNext<CR>";
          desc = "Cycle next";
        }
        {
          __unkeyed-1 = "<leader>bp";
          __unkeyed-2 = "<cmd>BufferLineCyclePrev<CR>";
          desc = "Cycle previous";
        }
        {
          __unkeyed-1 = "<leader>bq";
          __unkeyed-2 = "<cmd>BufferLinePickClose<CR>";
          desc = "Pick tab to close";
        }
        {
          __unkeyed-1 = "<leader>bs";
          __unkeyed-2 = "<cmd>BufferLinePick<CR>";
          desc = "Pick tab";
        }

      ];
    };
  };
}
