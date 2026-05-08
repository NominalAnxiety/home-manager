
{ pkgs, ... }:

{
  imports = [
    ../../modules/ghostty.nix
	../../modules/zellij.nix
	# maybe import zellij but I might go over to tmux who knows
  ];

  home.packages = with pkgs; [
    slack
  ];

}
