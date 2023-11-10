{...}:

{
  enable = true;
  shellAliases = {
    ".." = "cd ..";
    la = "ls -al";
    cat = "bat";
  };
  zplug = import ./zplug.nix {};
  oh-my-zsh = import ./oh-my-zsh.nix {};
}

