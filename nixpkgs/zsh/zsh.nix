{...}:

{
	enable = true;
	shellAliases = {
		".." = "cd ..";
		la = "ls -al";
	};
	oh-my-zsh = import ./oh-my-zsh.nix {};
	zplug = import ./zplug.nix {};
}

