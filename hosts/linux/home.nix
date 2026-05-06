
{ pkgs, ... }:

{
  imports = [
    ../../modules/ghostty.nix
	# maybe import zellij but I might go over to tmux who knows
  ];

  home.packages = with pkgs; [
    slack
  ];

}
