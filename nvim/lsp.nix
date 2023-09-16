{pkgs, ...}: let
  nodePacks = with pkgs.nodePackages; [
    typescript-language-server
    vim-language-server
    yaml-language-server
    dockerfile-language-server-nodejs
  ];
  goPacks = with pkgs; [
    gopls
    delve
    gotools
  ];
  nixPacks = with pkgs; [
    nil
    nixpkgs-fmt
  ];
  otherPacks = with pkgs; [
    lua-language-server # Lua
    lua54Packages.fennel # Lua'sfennel
    taplo # TOML
    marksman # Markdown
    rust-analyzer # Rust
    texlab # LaTeX
    zls # Zig
    ols # Odin
    elixir_ls # Elixir
    sourcekit-lsp # Swift & Obj-C
    python311Packages.python-lsp-server # Python
    ocamlPackages.ocaml-lsp # OCaml
    haskellPackages.haskell-language-server # Haskell
  ];
  ccPacks = with pkgs; [
    lldb
    clang-tools
    cmake-language-server
  ];
in {
  environment.systemPackages = [
    goPacks
    nodePacks
    nixPacks
    ccPacks
    otherPacks
  ];
}
