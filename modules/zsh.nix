{ config, pkgs, ... }: {
  
  programs.zsh.dotDir = "${config.xdg.configHome}/zsh";
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -l";
      update = "sudo nixos-rebuild switch";
    };
    history.size = 10000;
    # maybe have more customization later
  };
  
  # Enable and configure starship
  programs.starship = {
    enable = true;
    # settings for starship settings
    presets = [ "nerd-font-symbols" ];
  };
    
}



