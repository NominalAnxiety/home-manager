{ config, pkgs, inputs, ... }: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    extraPackages = with pkgs; [
      lua-language-server

      tree-sitter
      gcc # apparently tree-sitter needs gcc


      # Nix
      alejandra # formatter
      nixd # lsp

      wl-clipboard
    ];

    plugins = with pkgs.vimPlugins; [ lazy-nvim ];
    initLua = ''require("config")'';

    withRuby = false;
    withPython3 = false;
  };
}
