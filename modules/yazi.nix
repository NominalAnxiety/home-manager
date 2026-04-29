# yazi.nix
{ pkgs, ... }:
{
  programs.yazi = {
    enable = true;
    shellWrapperName = "y";
    enableZshIntegration = true;

    plugins = {
      inherit (pkgs.yaziPlugins) full-border relative-motions;
    };

    initLua = ''
      require("full-border"):setup()
      require("relative-motions"):setup({ show_numbers = "relative", show_motion = true })
    '';
  };

  catppuccin.yazi = {
    enable = true;
    flavor = "mocha";
    accent = "blue";
  };
}
