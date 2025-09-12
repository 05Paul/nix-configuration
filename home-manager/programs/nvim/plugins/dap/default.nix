{ ... }:
{
  programs.nixvim.plugins.dap = {
    enable = true;
    configurations = {};
  };
  programs.nixvim.plugins.dap-ui = {
    enable = true;
    settings = {
      mappings = {
        toggle = "<leader>dt";
      };
    };
  };
}
