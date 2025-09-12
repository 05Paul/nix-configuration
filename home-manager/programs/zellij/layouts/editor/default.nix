{ config, ... }:
let
  inherit (config.lib.stylix) colors;
in
{
  xdg.configFile."zellij/layouts/editor.kdl" = {
    text = ''
      layout {
          default_tab_template {
              children
              pane size=1 borderless=true {
                  plugin location="https://github.com/dj95/zjstatus/releases/latest/download/zjstatus.wasm" {
                      format_left   " {mode} {command_project}"
                      format_center "{tabs}"
                      format_right  "#[fg=#${colors.base07}]#[fg=#${colors.base05},bg=#${colors.base07}]{datetime}#[fg=#${colors.base07}]"
                      format_space  ""

                      hide_frame_for_single_pane "true"
                      command_project_command  "pwd"
                      command_project_interval "0"
                      command_project_format   "#[fg=#${colors.base04},bg=#${colors.base0D}]{stdout} #[fg=#${colors.base05},bg=#${colors.base04}]  "
                      
                      mode_normal      "#[fg=#${colors.base07}]#[fg=#${colors.base04},bg=#${colors.base07}]  #[fg=#${colors.base07}]"
                      mode_locked      "#[fg=#${colors.base07}]#[fg=#${colors.base04},bg=#${colors.base07}]  #[fg=#${colors.base07}]"
                      mode_resize      "#[fg=#${colors.base07}]#[fg=#${colors.base04},bg=#${colors.base07}] 󰩨 #[fg=#${colors.base07}]"
                      mode_pane        "#[fg=#${colors.base07}]#[fg=#${colors.base04},bg=#${colors.base07}]  #[fg=#${colors.base07}]"
                      mode_move        "#[fg=#${colors.base07}]#[fg=#${colors.base04},bg=#${colors.base07}]  #[fg=#${colors.base07}]"
                      mode_tab         "#[fg=#${colors.base07}]#[fg=#${colors.base04},bg=#${colors.base07}] 󰓩 #[fg=#${colors.base07}]"
                      mode_scroll      "#[fg=#${colors.base07}]#[fg=#${colors.base04},bg=#${colors.base07}] 󰹹 #[fg=#${colors.base07}]"
                      mode_search      "#[fg=#${colors.base07}]#[fg=#${colors.base04},bg=#${colors.base07}]  #[fg=#${colors.base07}]"
                      mode_entersearch "#[fg=#${colors.base07}]#[fg=#${colors.base04},bg=#${colors.base07}] 󰿄  #[fg=#${colors.base07}]"
                      mode_renametab   "#[fg=#${colors.base07}]#[fg=#${colors.base04},bg=#${colors.base07}] 󰑕  #[fg=#${colors.base07}]"
                      mode_renamepane  "#[fg=#${colors.base07}]#[fg=#${colors.base04},bg=#${colors.base07}] 󰑕 󰓩 #[fg=#${colors.base07}]"
                      mode_session     "#[fg=#${colors.base07}]#[fg=#${colors.base04},bg=#${colors.base07}]  #[fg=#${colors.base07}]"
                      mode_tmux        "#[fg=#${colors.base07}]#[fg=#${colors.base04},bg=#${colors.base07}]  #[fg=#${colors.base07}]"

                      tab_normal              "#[fg=#${colors.base05},bg=#${colors.base03}] {name} "
                      tab_normal_fullscreen   "#[fg=#${colors.base04},bg=#${colors.base05}] {name} [] "
                      tab_normal_sync         "#[fg=#${colors.base04},bg=#${colors.base05}] {name} <> "
                      tab_active              "#[fg=#${colors.base05},bg=#${colors.base04},bold,italic] {name} "
                      tab_active_fullscreen   "#[fg=#${colors.base0D},bg=#${colors.base05},bold,italic] {name} [] "
                      tab_active_sync         "#[fg=#${colors.base0D},bg=#${colors.base05},bold,italic] {name} <> "

                      datetime          "#[fg=#${colors.base04},bg=#${colors.base07},bold]{format}"
                      datetime_format   "%A, %d %b %Y %H:%M:%S"
                      datetime_timezone "Europe/Berlin"
                  }
              }
          }

          tab name="editor" {
              pane borderless=true focus=true {
                  name "neovim"
                  command "bash"
                  args "-c" "nvim"  
              }
          }

          tab name="terminal" {
              pane borderless=true focus=true {
                  command "bash"
              }
          }
      }

      keybinds {
          locked {
              bind "Insert" { GoToNextTab; }
          }

          shared_except "locked" {
              bind "Alt f" {
                  LaunchPlugin "filepicker" {
                      close_on_selection true
                  }
              }
          }
      }
'';
  };
}
