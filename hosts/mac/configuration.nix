{ pkgs, ... }:
{
  system.stateVersion = 5;
  nixpkgs.hostPlatform = "aarch64-darwin";
  nixpkgs.config.allowUnfree = true;

  nix.enable = false;

  users.users.austinbowman = {  # replace this with your actual username (find using whoami)
    name = "austinbowman"; # replace this with your actual username (find using whoami)
    home = "/Users/austinbowman"; # replace this with your actual username (find using whoami)
  };

  nix.settings.experimental-features = [
    "flakes"
    "nix-command"
  ];

  # MacOS system settings
  system.primaryUser = "austinbowman";
  system.defaults = {
    NSGlobalDomain = {
      KeyRepeat = 1;
      InitialKeyRepeat = 10;
      ApplePressAndHoldEnabled = false;
    };
    dock = { # MacOS dock configuration
      autohide = true;
	};
  };

}
