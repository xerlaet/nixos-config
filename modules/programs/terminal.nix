{
  imports = [
    ./neovim
  ];

  programs.kitty = {
    enable = true;
    settings = {
      font_family = "FiraCode Nerd Font Mono";
      font_size = 11;
      confirm_os_window_close = 0;
      enable_audio_bell = "no";
      allow_remote_control = "yes";
      window_padding_width = 8;
      include = "colors.conf";
    };
  };

  programs.zsh.enable = true;
  programs.starship.enable = true;
}
