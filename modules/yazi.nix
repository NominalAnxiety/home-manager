# yazi.nix
{ pkgs, ... }:
{
  programs.yazi = {
    enable = true;


    plugins = with pkgs; {
      full-border = yaziPlugins.full-border;
      relative-motions = yaziPlugins.relative-motions;
    };

    initLua = ''
	    require("full-border"):setup()
	    '';

    theme = {
      indicator.padding = { open = "▐"; close = "▌"; };
    };

  };

  catppuccin.yazi = {
    enable = true;
    flavor = "mocha";
  };
}
