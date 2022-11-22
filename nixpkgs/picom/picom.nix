{...}:

{
		enable = true;
		activeOpacity = "1.0";
		inactiveOpacity = "0.95";
		backend = "glx";
		fade = true;
		fadeDelta = 5;
		opacityRule = [ "100:name *= 'i3lock'"
			"99:fullscreen"
			"80:class_g = 'Alacritty' && focused"
			"80:class_g = 'Alacritty' && !focused"
			"100:class_g = 'Firefox' && focused"
			"100:class_g = 'Firefox' && !focused"
		];
		shadow = true;
		shadowOpacity = "0.90";
		extraOptions = ''
			xrender-sync-fence = true;
		mark-ovredir-focused = false;
		use-ewmh-active-win = true;
		'';
}

