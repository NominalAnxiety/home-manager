{ config, pkgs, inputs, ... }: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    extraPackages = with pkgs; [
      # LSPs
      lua-language-server
      rust-analyzer
      pyright
      clang-tools  # clangd
      nixd
      marksman

      # Formatters
      stylua
      rustfmt
	  isort
      black
      clang-tools  # clang-format (same package as clangd)
      nixfmt-rfc-style  # or nixfmt depending on your nixpkgs version
      prettier

	  # Linters


      # Treesitter
      tree-sitter
      gcc

      # Telescope dependencies
      ripgrep
      fd

    ] ++ lib.optionals stdenv.isLinux [ wl-clipboard ]; # adds wl-clipboard if on linux

    plugins = with pkgs.vimPlugins; [ lazy-nvim ];
    initLua = ''require("config")'';
    withRuby = false;
    withPython3 = false;
  };
}
