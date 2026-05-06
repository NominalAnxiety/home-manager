{ catppuccin, pkgs, lib, ... }: {
  catppuccin.enable = true;

  programs.ghostty = {
    enable = true;
    settings = {
      theme = "catppuccin-mocha";
      font-family = "Maple Mono NF";
      font-size = 12;
    };
  };
}
