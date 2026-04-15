{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    ./init.lua.nix
    ./lua/core/options.lua.nix
    ./lua/core/keymaps.lua.nix
    ./lua/plugins
    ./lua/lsp
    ./lua/cmp
    ./lua/ui
    ./lua/utils
  ];

  home.packages = with pkgs; [
    ripgrep
    fd
    python3
    nodejs
    gnumake
    gcc
  ];

  programs.neovim.enable = true;
}
