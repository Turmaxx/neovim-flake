{
  self,
  pkgs,
  ...
}: let
  nvimPlugins = with pkgs.vimPlugins; [
    aniseed

    # utilities
    telescope-nvim
    vim-easy-align
    vim-css-color
    which-key-nvim
    vim-cursorword

    # visual
    lualine-nvim
    lualine-lsp-progress
    nvim-web-devicons

    # buffer stuff
    bufferline-nvim

    # auto complete
    nvim-lspconfig
    lsp_signature-nvim
    cmp_luasnip
    luasnip
    cmp-nvim-lsp
    nvim-cmp
    lspkind-nvim

    nvim-treesitter-context
    auto-pairs

    # design stuff
    tokyonight-nvim
    indent-blankline-nvim
    fidget-nvim

    # Toy
    guess-indent-nvim
    copilot-vim

    # tree sitter
    (nvim-treesitter.withPlugins (_: pkgs.tree-sitter.allGrammars))
    nvim-ts-rainbow
  ];
in {
  imports = [./lsp.nix];
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    plugins = nvimPlugins;
  };

  xdg.configFile."nvim" = {
    source = "${self}/nvim";
    recursive = true;
  };
}
