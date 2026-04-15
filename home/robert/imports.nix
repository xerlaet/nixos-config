{ inputs, ... }:

{
  imports = [
    ./calendar.nix
    ../../modules/desktop/hyprland.nix
    ../../modules/programs/common.nix
    ../../modules/programs/terminal.nix
  ];

  home.file = {
    ".thunderbird/is9u1ryz.default/user.js".text = ''
      user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
    '';
    ".config/mozilla/firefox/lm2ifqa5.default/user.js".text = ''
      user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
      user_pref("ui.systemUsesDarkTheme", 1);
      user_pref("userChrome.theme-material", true);
    '';
    ".config/mozilla/firefox/lm2ifqa5.default/chrome/userChrome.css".text = ''
      @import url("/home/robert/.config/matugen/firefox-colors.css");

      :root {
        --lwt-accent-color: var(--surface_container_low) !important;
        --lwt-text-color: var(--on_surface) !important;
        --toolbar-bgcolor: var(--surface_container_low) !important;
        --toolbar-color: var(--on_surface) !important;
        --toolbar-field-background-color: var(--surface_container) !important;
        --toolbar-field-color: var(--on_surface) !important;
        --toolbar-field-focus-background-color: var(--surface_container_high) !important;
        --toolbar-field-focus-color: var(--on_surface) !important;
        --toolbar-field-border-color: var(--outline) !important;
        --toolbar-field-focus-border-color: var(--primary) !important;
        --toolbarseparator-color: var(--outline) !important;
        --tab-bgcolor: var(--surface_container_low) !important;
        --tab-selected-bgcolor: var(--surface_container) !important;
        --lwt-sidebar-background-color: var(--surface_container_low) !important;
        --lwt-sidebar-text-color: var(--on_surface) !important;
      }

      @media (prefers-color-scheme: dark) {
        :root {
          --lwt-accent-color: var(--surface_container_low) !important;
          --lwt-text-color: var(--on_surface) !important;
          --toolbar-bgcolor: var(--surface_container_low) !important;
          --toolbar-color: var(--on_surface) !important;
          --toolbar-field-background-color: var(--surface_container) !important;
          --toolbar-field-color: var(--on_surface) !important;
          --toolbar-field-focus-background-color: var(--surface_container_high) !important;
          --toolbar-field-focus-color: var(--on_surface) !important;
          --toolbar-field-border-color: var(--outline) !important;
          --toolbar-field-focus-border-color: var(--primary) !important;
          --tab-bgcolor: var(--surface_container_low) !important;
          --tab-selected-bgcolor: var(--surface_container) !important;
        }
      }

      #navigator-toolbox {
        background-color: var(--surface_container_low) !important;
      }

      #urlbar-background {
        background-color: var(--surface_container) !important;
      }

      #urlbar[open] > #urlbar-input-container,
      #searchbar {
        background-color: var(--surface_container_high) !important;
      }

      .tab-background {
        background: var(--surface_container_low) !important;
      }

      .tab-background[selected="true"] {
        background: var(--surface_container) !important;
      }

      menupopup, panel, .menupopup-arrowscrollbox {
        --panel-background: var(--surface_container) !important;
        --panel-color: var(--on_surface) !important;
      }

      #sidebar-box {
        --lwt-sidebar-background-color: var(--surface_container_low) !important;
        background-color: var(--surface_container_low) !important;
      }
    '';
  };
}
