
{ pkgs, username, ... }:

{
  imports = [
    ../../modules/ghostty.nix
  ];

  home.packages = with pkgs; [
    slack
	valgrind
	obsidian
  ];
  programs.zsh.dotDir = "/home/${username}/.config/zsh";

}
