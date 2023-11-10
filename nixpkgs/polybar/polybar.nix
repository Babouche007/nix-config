{pkgs, ...}:

{
  enable = true;
  package = pkgs.polybar.override {
    i3Support = true;
    alsaSupport = true;
    iwSupport = true;
    githubSupport = true;
  };
  script = ''
        polybar main &
  '';
  config = {
    "bar/top" = {
      enable-ipc = true;
      top = true;
      monitor = "\${env:MONITORS[0]:DP-1}";
      width = "100%";
      height = 24;
      dpi = 192;

      radius-left = "8.0";
      radius-right = "8.0";

      background = "#FF455578";
      foreground = "#eee";

      line-color = "\${bar/top.background}";
      line-size = 1;

      padding-left = 0;
      padding-right = 0;
      module-margin-left = 3;
      module-margin-right = 3;

      separator = "|";

      font-0 = "NotoSans-Regular:size=5;0";
      font-1 = "Material\\\\ Icons:size=7;2";
      font-2 = "xos4\\\\ Terminus:size=10;0";
      font-3 = "Siji:pixelsize=7;1";
      font-4 = "FontAwesome:size=7;0";

      modules-left = "i3";
      modules-right = "powermenu";  
      modules-center = "date";
      wm-restack = "i3";

      tray-position = "right"; 
      tray-scale = "1.0";
      tray-transparent = true;
      tray-background = "\${self.background}";

      overline-size = 10;
      overline-color = "\${self.background}";
      underline-size = 2;
      underline-color = "\${self.background}";
    };
    "module/date" = {
      type = "internal/date";
      date = "   %%{F#fff}%Y-%m-%d%%{F-} | %%{F#fff}%H:%M:%S%%{F-}";
      date-alt = "%%{F#fff}%A, %d %B %Y  %%{F#fff}%H:%M%%{F#666}:%%{F#fba922}%S%%{F-}";
    };
    "module/i3" = {
      type = "internal/i3";

      pin-workspaces = true;
      strip-wsnumbers = true;
      index-sort = true;

      fuzzy-match = true;

      ws-icon-0 = "1";
      ws-icon-1 = "2";
      ws-icon-2 = "3";
      ws-icon-3 = "4";
      ws-icon-4 = "5";

      label-dimmed-underline = "\${root.background}";

      format = "<label-state> <label-mode>";

# Available tokens:
#   %mode%
# Default: %mode%
      label-mode = "%mode%";
      label-mode-padding = 5;
      label-mode-background = "#e60053";

# Available tokens:
#   %name%
#   %icon%
#   %index%
#   %output%
# Default: %icon%  %name%
      label-focused = "%index%";
      label-focused-foreground = "#ffffff";
      label-focused-background = "#657598";
      label-focused-underline = "#fba922";
      label-focused-padding = 4;

      label-unfocused-padding = 4;
        };
        "module/powermenu" = {
          type = "custom/menu";

          format-padding = 5;

          label-open = "Menu";
          label-close = "Close";
          label-separator = "|";

          menu-0-0 = "Shutdown";
          menu-0-0-foreground = "#fba922";
          menu-0-0-exec = "shutdown now";

          menu-1-0 = "Cancel";
          menu-1-0-foreground = "#fba922";
          menu-1-0-exec = "menu_open-0";

        };
      };
    }

