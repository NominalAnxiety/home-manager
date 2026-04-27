{ pkgs, ... }: {
  
  # enable ghostty
  programs.ghostty = {
    enable = true;
    settings = {
      background-opacity = 0.80;
      background-blur = 20;
    };
  };

}
