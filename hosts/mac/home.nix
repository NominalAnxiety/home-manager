{ username, ... }:

{
  imports = [ ];

  programs.zsh = {
    dotDir = "/Users/${username}/.config/zsh";
    initContent = ''
      eval "$(/opt/homebrew/bin/brew shellenv)"
    '';
  };

}
