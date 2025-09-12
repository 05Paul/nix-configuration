{ ... }:
{
  programs.starship = {
    enable = true;
    settings = { 
      "$schema" = "https://starship.rs/config-schema.json"; 
      c = { 
        format = "[[ $symbol( $version) ](fg:base01 bg:base14)]($style)";
        style = "bg:base14"; 
        symbol = " "; 
      }; 

      character = { 
        disabled = false;
        error_symbol = "[❯](bold fg:base08)";
        success_symbol = "[❯](bold fg:base14)";
        vimcmd_replace_one_symbol = "[❮](bold fg:base07)";
        vimcmd_replace_symbol = "[❮](bold fg:base07)";
        vimcmd_symbol = "[❮](bold fg:base14)";
        vimcmd_visual_symbol = "[❮](bold fg:base13)";
      };

      cmd_duration = { 
        disabled = false;
        format = " in $duration ";
        min_time_to_notify = 45000;
        show_milliseconds = true;
        show_notifications = false;
        style = "bg:base07";
      };

      conda = {
        format = "[$symbol$environment ]($style)";
        ignore_base = false;
        style = "fg:base01 bg:base16";
        symbol = "  ";
      };

      directory = {
        format = "[ $path ]($style)";
        style = "bg:base09 fg:base01";
        substitutions = { 
          Developer = "󰲋 ";
          Documents = "󰈙 ";
          Downloads = " ";
          Music = "󰝚 ";
          Pictures = " ";
        }; 
       truncation_length = 3;
       truncation_symbol = "…/";
      };

      docker_context = {
        format = "[[ $symbol( $context) ](fg:base01 bg:base16)]($style)";
        style = "bg:base16";
        symbol = ""; 
      };

      format = builtins.replaceStrings [ "\n" ] [ "" ] ''
        [](base08)
        $os
        $username
        [](bg:base09 fg:base08)
        $directory
        [](bg:base13 fg:base09)
        $git_branch
        $git_status
        [](fg:base13 bg:base14)
        $c
        $rust
        $golang
        $nodejs
        $php
        $java
        $kotlin
        $haskell
        $python
        [](fg:base14 bg:base16)
        $conda
        $docker_context
        $nix_shell
        [](fg:base16 bg:base07)
        $time
        [ ](fg:base07)
        $cmd_duration
        $line_break
        $character
      '';

      git_branch = { 
        format = "[[ $symbol $branch ](fg:base01 bg:base13)]($style)";
        style = "bg:base13"; 
        symbol = "";
      }; 

      git_status = {
        format = "[[($all_status$ahead_behind )](fg:base01 bg:base13)]($style)";
        style = "bg:base13";
      };

      golang = {
        format = "[[ $symbol( $version) ](fg:base01 bg:base14)]($style)";
        style = "bg:base14";
        symbol = ""; 
      };

      haskell = {
        format = "[[ $symbol( $version) ](fg:base01 bg:base14)]($style)";
        style = "bg:base14";
        symbol = ""; 
      };

      java = {
        format = "[[ $symbol( $version) ](fg:base01 bg:base14)]($style)";
        style = "bg:base14";
        symbol = " ";
      };

      kotlin = {
        format = "[[ $symbol( $version) ](fg:base01 bg:base14)]($style)";
        style = "bg:base14";
        symbol = "";
      };

      line_break = {
        disabled = true;
      };

      nodejs = { 
        format = "[[ $symbol( $version) ](fg:base01 bg:base14)]($style)";
        style = "bg:base14";
        symbol = "";
      };

      nix_shell = {
        disabled = false;
        format = "[  $state( \($name\))](fg:base01 bg:base16)";
      };

      os = { 
        disabled = false;
        style = "bg:base08 fg:base01";
        symbols = {
          Alpine = "";
          Amazon = "";
          Android = "";
          Arch = "󰣇";
          Artix = "󰣇";
          CentOS = "";
          Debian = "󰣚";
          Fedora = "󰣛";
          Gentoo = "󰣨";
          Linux = "󰌽";
          Macos = "󰀵";
          Manjaro = "";
          Mint = "󰣭";
          NixOS = "";
          Raspbian = "󰐿";
          RedHatEnterprise = "󱄛";
          Redhat = "󱄛";
          SUSE = "";
          Ubuntu = "󰕈";
          Windows = "";
        };
      };

      php = {
        format = "[[ $symbol( $version) ](fg:base01 bg:base14)]($style)";
        style = "bg:base14";
        symbol = "";
      };

      python = {
        format = "[[ $symbol( $version)(\\(#$virtualenv\\)) ](fg:base01 bg:base14)]($style)";
        style = "bg:base14";
        symbol = "";
      };

      rust = {
        format = "[[ $symbol( $version) ](fg:base01 bg:base14)]($style)";
        style = "bg:base14";
        symbol = "";
      };

      time = {
        disabled = false;
        format = "[[  $time ](fg:base01 bg:base07)]($style)";
        style = "bg:base07";
        time_format = "%R";
      };

      username = {
        format = "[ $user]($style)";
        show_always = true;
        style_root = "bg:base08 fg:base01";
        style_user = "bg:base08 fg:base01";
      };
    };
  }; 
}
