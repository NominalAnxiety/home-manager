{ catppuccin, pkgs, lib, ... }: {
  catppuccin.enable = lib.mkIf pkgs.stdenv.isLinux true;

  programs.ghostty = lib.mkIf pkgs.stdenv.isLinux {
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
