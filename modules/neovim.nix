{
  pkgs,
  lib,
  ...
}:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    plugins = with pkgs.vimPlugins; [
      lazy-nvim # nix manages lazy vim and lazyvim manages everything else
      # nix managers tree-sitter autoinstall
      (nvim-treesitter.withPlugins (p: [
        p.lua
        p.python
        p.c
        p.rust
        p.cpp
        p.nix
      ]))
    ];

    initLua = ''require("config")'';
    withRuby = false;
    withPython3 = false;
  };
  home.packages =
    with pkgs;
    [
      # LSPs
      lua-language-server
      rust-analyzer
      ruff
      clang-tools # clangd
      nixd
      marksman

      # Formatters
      stylua
      rustfmt
      isort
      black
      clang-tools # clang-format (same package as clangd)
      nixfmt # or nixfmt depending on your nixpkgs version
      prettier

      # Treesitter
      tree-sitter
      gcc

      # Telescope dependencies
      ripgrep
      fd
    ]
    ++ lib.optionals pkgs.stdenv.isLinux [ wl-clipboard ]; # adds wl-clipboard if on linux
}
