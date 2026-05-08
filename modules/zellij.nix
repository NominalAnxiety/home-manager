{ pkgs, lib, ... }:
let
  navigator = "vim-zellij-navigator";

  mkNavBind = key: dir: ''
    bind "Ctrl ${key}" { MessagePlugin "${navigator}" { message "${dir}"; }; }
  '';

  navBindings = lib.concatStrings [
    (mkNavBind "h" "move_left")
    (mkNavBind "j" "move_down")
    (mkNavBind "k" "move_up")
    (mkNavBind "l" "move_right")
  ];

  tabBindings = lib.concatMapStrings
    (n: ''bind "Alt ${toString n}" { GoToTab ${toString n}; }'' + "\n")
    (lib.range 1 9);

in
{
  # I can't use programs.zellij = enable because it will conflict with home.file for the same
  # config.kdl file. this will cause and error.
  home.packages = [ pkgs.zellij ]; 

  programs.zsh.initContent = ''
    eval "$(zellij setup --generate-auto-start zsh)"
  '';

  home.file.".config/zellij/config.kdl".text = ''
    default_shell "zsh"
    theme "catppuccin-mocha"
	show_startup_tips false

    plugins {
      ${navigator} location="https://github.com/hiasr/vim-zellij-navigator/releases/latest/download/vim-zellij-navigator.wasm"
    }

    keybinds {
      normal {
        ${navBindings}
        ${tabBindings}
      }
    }
  '';
}
