{ config, pkgs, ... }: {

  programs.zoxide = {
    enable = true;
	enableZshIntegration = true;
  };

  programs.eza = {
    enable = true;
	enableZshIntegration = true;
  };
  
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "eza -l";
	  cd = "z";
	  ls = "eza";
      update = "sudo nixos-rebuild switch --flake ~/nixos-config#PC";
	  update-mac = "sudo darwin-rebuild switch --flake ~/.config/home-manager/#mactop %% cd -";
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



