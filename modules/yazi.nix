# yazi.nix
{ pkgs, ... }:
{
  programs.yazi = {
    enable = true;


    plugins = {
      full-border = pkgs.yaziPlugins.full-border;
    };

    initLua = ''
	    require("full-border"):setup()
	    '';
  };

  catppuccin.yazi = {
    enable = true;
    flavor = "mocha";
  };
}
