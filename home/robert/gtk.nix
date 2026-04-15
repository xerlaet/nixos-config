{
  gtk = {
    enable = true;
    gtk4.theme = null;
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };

  home.file = {
    ".config/gtk-3.0/gtk.css".text = ''
      @import url("matugen-colors.css");
    '';
    ".config/gtk-4.0/gtk.css".text = ''
      @import url("matugen-colors.css");
    '';
  };
}
