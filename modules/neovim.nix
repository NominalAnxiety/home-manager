{ pkgs, ... }: {
  programs.neovim = {
    enable = true;

    plugins = with pkgs.vimPlugins; {
      nvim-lspconfig
      lualine-nvim
      telescope-nvim
      conform-nvim
      nvim-treesitter.withAllGrammars # installs all major and minor languages
      
           
  };
}
