
{ pkgs, ... }:

{
  imports = [
    ../../modules/ghostty.nix
  ];

  home.packages = with pkgs; [
    slack
  ];

}
