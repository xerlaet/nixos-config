{ lib, ... }:

{
  security.sudo = {
    enable = true;
    extraConfig = ''
      # Passwordless sudo for robert
      robert ALL=(ALL) NOPASSWD: ALL
    '';
  };
}
