
{ pkgs, username, ... }:

{
  imports = [
    ../../modules/ghostty.nix
  ];

  home.packages = with pkgs; [
    slack
  ];
  programs.zsh.dotDir = "/home/${username}/.config/zsh";

}
