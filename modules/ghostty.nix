{ catppuccin, pkgs, lib, ... }: {
  catppuccin.enable = true;

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
