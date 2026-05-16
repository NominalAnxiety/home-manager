{ pkgs, ... }:
{
  system.stateVersion = 5;
  nixpkgs.hostPlatform = "aarch64-darwin";
  nixpkgs.config.allowUnfree = true;

  nix.enable = false;

  users.users.austinbowman = {
    # replace this with your actual username (find using whoami)
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
      KeyRepeat = 2;
      InitialKeyRepeat = 20;
      ApplePressAndHoldEnabled = false;
    };
    dock = {
      # MacOS dock configuration
      autohide = true;
    };
  };

  system.activationScripts.ensureHomebrew.text = ''
    	  if [ ! -x /opt/homebrew/bin/brew ] && [ ! -x /usr/local/bin/brew ]; then
    		echo "Homebrew not found. Installing..."

    		NONINTERACTIVE=1 /bin/bash -c \
    		  "$(${pkgs.curl}/bin/curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    	  fi
    	'';

}
