{ ... }:
{
  programs.nixvim.plugins.lsp-format = {
    enable = true;
  };

  programs.nixvim.plugins.lsp = {
    enable = true;
    inlayHints = true;

    keymaps = {
      lspBuf = {
        K = {
          action = "hover";
          desc = "Hover";
        };

        gD = {
          action = "declaration";
          desc = "Go to declaration";
        };

        gr = {
          action = "references";
          desc = "References";
        };

        gs = {
          action = "signature_help";
          desc = "Signature help";
        };

        gi = {
          action = "implementation";
          desc = "Implementation";
        };

        gt = {
          action = "type_definition";
          desc = "Type definition";
        };

        "<leader>lh" = {
          action = "hover";
          desc = "Hover";
        };
    
        "<leader>ld" = {
          action = "document_symbol";
          desc = "Document symbol";
        };

        "<leader>lc" = {
          action = "code_action";
          desc = "Code action";
        };

        "<leader>lr" = {
          action = "rename";
          desc = "Rename";
        };

        "<leader>lf" = {
          action = "format";
          desc = "Format";
        };

        "<leader>li" = {
          action = "incoming_calls";
          desc = "Incoming calls";
        };

        "<leader>lo" = {
          action = "outgoing_calls";
          desc = "Outgoing calls";
        };
      };
    };

    servers = {
      ansiblels = {
        enable = true;
      };

      bashls = {
        enable = true;
      };

      cssls = {
        enable = true;
      };

      dockerls = {
        enable = true;
      };

      eslint = {
        enable = true;
      };

      gopls = {
        enable = true;
      };

      helm_ls = {
        enable = true;
      };

      html = {
        enable = true;
      };

      htmx = {
        enable = true;
      };

      java_language_server = {
        enable = true;
      };

      jsonls = {
        enable = true;
      };

      kotlin_language_server = {
        enable = true;
      };

      lua_ls = {
        enable = true;
      };

      nixd = {
        enable = true;
      };

      pylsp = {
        enable = true;
      };

      rust_analyzer = {
        enable = true;
        installCargo = false;
        installRustc = false;
      };

      sqls = {
        enable = true;
      };

      yamlls = {
        enable = true;
      };
    };
  };
}
