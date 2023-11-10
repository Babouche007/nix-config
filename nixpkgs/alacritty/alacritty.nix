{pkgs, ...}:

let
familly_font = "Deja Vu Sans Mono";
in
{
	enable = true;
	settings = {
		font = {
			normal = {
				family = familly_font;
				style = "Regular";
			};
			italic = {
				family = familly_font;
				style = "Italic";
			};
			bold = {
				family = familly_font;
				style = "Bold";
			};
			bold_italic = {
				family = familly_font;
				style = "Bold Italic";
			};
		};
		shell = {
			program = "${pkgs.zsh}/bin/zsh";
		};
	};
}

