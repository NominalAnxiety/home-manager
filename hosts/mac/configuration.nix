{ pkgs, ... }:
{
  system.stateVersion = 5;
  nixpkgs.hostPlatform = "aarch64-darwin";

  users.users.austinbowman = {  # replace this with your actual username (find using whoami)
    name = "austinbowman"; # replace this with your actual username (find using whoami)
    home = "/Users/austinbowman"; # replace this with your actual username (find using whoami)
  };

  nix.settings.experimental-features = [
    "nix-flakes"
    "nix-command"
  ];
}
