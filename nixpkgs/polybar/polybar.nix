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
			height = 20;
			dpi = 192;

			background = "#862626";
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
			modules-right = "cpu memory temperature filesystem xkeyboard date";        

			wm-restack = "i3";

			tray-position = "right"; 
			tray-scale = "1.0";
			tray-transparent = true;
			tray-background = "\${self.background}";
			tray-maxsize = 64;

			tray-offset-y = 0;

			scroll-up = "i3wm-wsnext";
			scroll-down = "i3wm-wsprev";

			overline-size = 10;
			overline-color = "\${self.background}";
			underline-size = 2;
			underline-color = "\${self.background}";
		};
		"bar/bottom" = {
			monitor = "\${env:MONITORS[1]:DP-1}";
			bottom = true;
			width = "100%";
			height = 40;
			dpi = 192;

			scroll-up = "i3wm-wsnext";
			scroll-down = "i3wm-wsprev";

			background = "\${bar/top.background}";
			foreground = "\${bar/top.foreground}";

			line-color = "\${bar/top.background}";
			line-size = 2;

			spacing = 3;
			padding-right = 4;
			module-margin-left = 0; 
			module-margin-right = 6;

			font-0 = "NotoSans-Regular:size=9;0";

			modules-left = "i3"; 
			modules-right = "cpu memory temperature xkeyboard date";        

			tray-position = "right"; 
			tray-scale = "1.0";
			tray-background = "\${self.background}";
			tray-maxsize = 64;

			tray-offset-y = 0;
		};
		"module/cpu" = {
			type = "internal/cpu";
			interval = "0.5";
			format = "<label> <ramp-coreload>";
			label = "CPU";
			ramp-coreload-0 = "▁";
			ramp-coreload-0-font = 2;
			ramp-coreload-0-foreground = "#aaff77";
			ramp-coreload-1 = "▂";
			ramp-coreload-1-font = 2;
			ramp-coreload-1-foreground = "#aaff77";
			ramp-coreload-2 = "▃";
			ramp-coreload-2-font = 2;
			ramp-coreload-2-foreground = "#aaff77";
			ramp-coreload-3 = "▄";
			ramp-coreload-3-font = 2;
			ramp-coreload-3-foreground = "#aaff77";
			ramp-coreload-4 = "▅";
			ramp-coreload-4-font = 2;
			ramp-coreload-4-foreground = "#fba922";
			ramp-coreload-5 = "▆";
			ramp-coreload-5-font = 2;
			ramp-coreload-5-foreground = "#fba922";
			ramp-coreload-6 = "▇";
			ramp-coreload-6-font = 2;
			ramp-coreload-6-foreground = "#ff5555";
			ramp-coreload-7 = "█";
			ramp-coreload-7-font = 2;
			ramp-coreload-7-foreground = "#ff5555";
		};
		"module/date" = {
			type = "internal/date";
			date = "   %%{F#999}%Y-%m-%d%%{F-}  %%{F#fff}%H:%M:%S%%{F-}";
			date-alt = "%%{F#fff}%A, %d %B %Y  %%{F#fff}%H:%M%%{F#666}:%%{F#fba922}%S%%{F-}";
		};
		"module/memory" = {
			type = "internal/memory";
			format = "<label> <bar-used>";
			label = "RAM";

			bar-used-width = 30;
			bar-used-foreground-0 = "#aaff77";
			bar-used-foreground-1 = "#aaff77";
			bar-used-foreground-2 = "#fba922";
			bar-used-foreground-3 = "#ff5555";
			bar-used-indicator = "|";
			bar-used-indicator-font = 6;
			bar-used-indicator-foreground = "#ff";
			bar-used-fill = "─";
			bar-used-fill-font = 6;
			bar-used-empty = "─";
			bar-used-empty-font = 6;
			bar-used-empty-foreground = "#444444";
		};
		"module/filesystem" = {
			type = "internal/fs";
			interval = 25;

			mount-0 = "/";

			label-mounted =  "%mountpoint%: %percentage_used%%";
			label-unmounted = "%mountpoint% not mounted";
			label-unmounted-foreground = "#66";

		};


		"module/powermenu" = {
			type = "custom/menu";

			format-padding = 5;

			label-open = "";
			label-close = "";
			label-separator = "|";

			menu-0-0 = "Shutdown";
			menu-0-0-foreground = "#fba922";
			menu-0-0-exec = "shutdown now";
			menu-0-1 = "Reboot";
			menu-0-1-foreground = "#fba922";
			menu-0-1-exec = "menu_open-1";
			menu-0-2 = "Power off";
			menu-0-2-foreground = "#fba922";
			menu-0-2-exec = "menu_open-2";

			menu-1-0 = "Cancel";
			menu-1-0-foreground = "#fba922";
			menu-1-0-exec = "menu_open-0";
			menu-1-1 = "Reboot";
			menu-1-1-foreground = "#fba922";
			menu-1-1-exec = "sudo reboot";

			menu-2-0 = "Power off";
			menu-2-0-foreground = "#fba922";
			menu-2-0-exec = "sudo poweroff";
			menu-2-1 = "Cancel";
			menu-2-1-foreground = "#fba922";
			menu-2-1-exec = "menu_open-0";
		};
		"module/clock" = {
			type = "internal/date";
			interval = 2;
			date = "%%{F#999}%Y-%m-%d%%{F-}  %%{F#fff}%H:%M%%{F-}";
		};


		"module/temperature" = {
			type = "internal/temperature";
			thermal-zone = 5;
			warn-temperature = 65;

			format = "<ramp> <label>";
			format-warn = "<ramp> <label-warn>";

			label = "%temperature-c%";
			label-warn = "HOT! %temperature-c%";
			label-warn-foreground = "#f00";

			ramp-0 = "";
			ramp-1 = "";
			ramp-2 = "";
			ramp-foreground = "#66";
		};


		"module/i3" = {
			type = "internal/i3";

			pin-workspaces = true;
			strip-wsnumbers = true;
			index-sort = true;

			fuzzy-match = true;

			ws-icon-0 = "1;♚";
			ws-icon-1 = "2;♛";
			ws-icon-2 = "3;♜";
			ws-icon-3 = "4;♝";
			ws-icon-4 = "5;♞";
			ws-icon-default = "♟";

			label-dimmed-underline = "\${root.background}";

			format = "<label-state> <label-mode>";

# Available tokens:
#   %mode%
# Default: %mode%
			label-mode = "%mode%";
			label-mode-padding = 0;
			label-mode-background = "#e60053";

# Available tokens:
#   %name%
#   %icon%
#   %index%
#   %output%
# Default: %icon%  %name%
			label-focused = "%index%";
			label-focused-foreground = "#ffffff";
			label-focused-background = "#8e3a28";
			label-focused-underline = "#fba922";
			label-focused-padding = 4;

			label-unfocused = "%index%";
			label-unfocused-padding = 4;

			label-visible = "%index%";
			label-visible-underline = "#555555";
			label-visible-padding = 4;

			label-urgent = "%index%";
			label-urgent-foreground = "#000000";
			label-urgent-background = "#bd2c40";
			label-urgent-padding = 4;

			label-separator = "|";
			label-separator-padding = 0;
			label-separator-foreground = "#ffb52a";
		};
	};
}

