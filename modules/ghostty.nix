{ catppuccin, pkgs, ... }: {
  
  # Enable catppuccin (shouldn't be here probably)
  catppuccin.enable = true; 

  # Enable ghostty
  programs.ghostty = {
    enable = true;
    settings = {
      theme = "catppuccin-mocha";
      background-opacity = 0.80;
      background-blur = 20;
	  font-family = "Maple Mono NF";
	  font-size = 12;
    };
  };

}
