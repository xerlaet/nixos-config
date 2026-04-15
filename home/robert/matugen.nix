{ config, lib, ... }:

let
  home = config.home.homeDirectory;
  vault = "${home}/projects/insight";
in
{
  home.sessionVariables = {
    PATH = "${home}/.local/bin:/run/current-system/sw/bin:${home}/.local/share/spotify:$PATH";
  };

  home.file = {
    # --- Obsidian template ---
    ".config/matugen/templates/obsidian-colors.css".text = ''
      :root {
          --background: {{colors.surface_container_low.dark.hex}};
          --foreground: {{colors.on_surface.dark.hex}};
          --color0: {{colors.surface_container.dark.hex}};
          --color1: {{colors.error.dark.hex}};
          --color2: {{colors.primary.dark.hex}};
          --color3: {{colors.tertiary.dark.hex}};
          --color4: {{colors.secondary.dark.hex}};
          --color5: {{colors.primary_container.dark.hex}};
          --color6: {{colors.tertiary_container.dark.hex}};
          --color7: {{colors.on_surface_variant.dark.hex}};
          --color8: {{colors.outline.dark.hex}};
          --color9: {{colors.error_container.dark.hex}};
          --color10: {{colors.inverse_primary.dark.hex}};
          --color11: {{colors.secondary_container.dark.hex}};
          --color12: {{colors.primary_fixed.dark.hex}};
          --color13: {{colors.tertiary_fixed.dark.hex}};
          --color14: {{colors.primary_fixed_dim.dark.hex}};
          --color15: {{colors.secondary_fixed_dim.dark.hex}};

          --h1-color: {{colors.primary.dark.hex}};
      }

      /* Override Obsidian native background variables */
      body {
          --background-primary: {{colors.surface_container_low.dark.hex}};
          --background-primary-alt: {{colors.surface_container_low.dark.hex}};
          --background-secondary: {{colors.surface_container_low.dark.hex}};
          --background-secondary-alt: {{colors.surface_container_low.dark.hex}};
          --background-modifier-border: {{colors.outline.dark.hex}};
      }
    '';

    # --- Kitty terminal template ---
    ".config/matugen/templates/kitty-colors.conf".text = ''
      background {{colors.surface_container_low.dark.hex}}
      foreground {{colors.on_surface.dark.hex}}
      cursor {{colors.primary.dark.hex}}
      selection_background {{colors.primary_container.dark.hex}}
      selection_foreground {{colors.on_surface.dark.hex}}
      url_color {{colors.primary.dark.hex}}
      color0 {{colors.surface_container_low.dark.hex}}
      color1 {{colors.error.dark.hex}}
      color2 {{colors.primary.dark.hex}}
      color3 {{colors.tertiary.dark.hex}}
      color4 {{colors.secondary.dark.hex}}
      color5 {{colors.primary_container.dark.hex}}
      color6 {{colors.tertiary_container.dark.hex}}
      color7 {{colors.on_surface_variant.dark.hex}}
      color8 {{colors.outline.dark.hex}}
      color9 {{colors.error_container.dark.hex}}
      color10 {{colors.inverse_primary.dark.hex}}
      color11 {{colors.secondary_container.dark.hex}}
      color12 {{colors.primary_fixed.dark.hex}}
      color13 {{colors.tertiary_fixed.dark.hex}}
      color14 {{colors.primary_fixed_dim.dark.hex}}
      color15 {{colors.secondary_fixed_dim.dark.hex}}
      active_border_color {{colors.primary.dark.hex}}
      inactive_border_color {{colors.outline.dark.hex}}
      active_tab_background {{colors.primary_container.dark.hex}}
      active_tab_foreground {{colors.on_primary_container.dark.hex}}
      inactive_tab_background {{colors.surface_container_high.dark.hex}}
      inactive_tab_foreground {{colors.on_surface_variant.dark.hex}}
    '';

    # --- Vesktop (Midnight Discord) template ---
    ".config/matugen/templates/midnight-discord.css".text = ''
      @import url('https://refact0r.github.io/midnight-discord/build/midnight.css');

      :root {
          --font: 'figtree';
          --corner-text: 'Midnight';

          --online-indicator: {{colors.inverse_primary.default.hex}};
          --dnd-indicator: {{colors.error.default.hex}};
          --idle-indicator: {{colors.tertiary_container.default.hex}};
          --streaming-indicator: {{colors.on_primary.default.hex}};

          --accent-1: {{colors.tertiary.default.hex}};
          --accent-2: {{colors.primary.default.hex}};
          --accent-3: {{colors.primary.default.hex}};
          --accent-4: {{colors.surface_bright.default.hex}};
          --accent-5: {{colors.primary_fixed_dim.default.hex}};
          --mention: {{colors.surface.default.hex}};
          --mention-hover: {{colors.surface_bright.default.hex}};

          --text-0: {{colors.surface.default.hex}};
          --text-1: {{colors.on_surface.default.hex}};
          --text-2: {{colors.on_surface.default.hex}};
          --text-3: {{colors.on_surface_variant.default.hex}};
          --text-4: {{colors.on_surface_variant.default.hex}};
          --text-5: {{colors.outline.default.hex}};

          --bg-1: {{colors.surface_variant.default.hex}};
          --bg-2: {{colors.surface_container_highest.default.hex}};
          --bg-3: {{colors.surface_container.default.hex}};
          --bg-4: {{colors.surface.default.hex}};
          --hover: {{colors.surface_bright.default.hex}};
          --active: {{colors.surface_bright.default.hex}};
          --message-hover: {{colors.surface_bright.default.hex}};

          --spacing: 12px;
          --list-item-transition: 0.2s ease;
          --unread-bar-transition: 0.2s ease;
          --moon-spin-transition: 0.4s ease;
          --icon-spin-transition: 1s ease;

          --roundness-xl: 22px;
          --roundness-l: 20px;
          --roundness-m: 16px;
          --roundness-s: 12px;
          --roundness-xs: 10px;
          --roundness-xxs: 8px;

          --discord-icon: none;
          --moon-icon: block;
          --moon-icon-url: url('https://upload.wikimedia.org/wikipedia/commons/c/c4/Font_Awesome_5_solid_moon.svg');
          --moon-icon-size: auto;

          --login-bg-filter: saturate(0.3) hue-rotate(-15deg) brightness(0.4);
          --green-to-accent-3-filter: hue-rotate(56deg) saturate(1.43);
          --blurple-to-accent-3-filter: hue-rotate(304deg) saturate(0.84) brightness(1.2);
      }

      .selected_f5eb4b,
      .selected_f6f816 .link_d8bfb3 {
        color: var(--text-0) !important;
        background: var(--accent-3) !important;
      }

      .selected_f6f816 .link_d8bfb3 * {
        color: var(--text-0) !important;
        fill: var(--text-0) !important;
      }
    '';

    # --- GTK colors template ---
    ".config/matugen/templates/gtk-colors.css".text = ''
      @define-color accent_color {{colors.primary_fixed_dim.default.hex}};
      @define-color accent_fg_color {{colors.on_primary_fixed.default.hex}};
      @define-color accent_bg_color {{colors.primary_fixed_dim.default.hex}};
      @define-color window_bg_color {{colors.surface_container_low.default.hex}};
      @define-color window_fg_color {{colors.on_surface.default.hex}};
      @define-color headerbar_bg_color {{colors.surface_container_low.default.hex}};
      @define-color headerbar_fg_color {{colors.on_surface.default.hex}};
      @define-color popover_bg_color {{colors.surface_container_low.default.hex}};
      @define-color popover_fg_color {{colors.on_surface.default.hex}};
      @define-color view_bg_color {{colors.surface_container_low.default.hex}};
      @define-color view_fg_color {{colors.on_surface.default.hex}};
      @define-color card_bg_color {{colors.surface_container_low.default.hex}};
      @define-color card_fg_color {{colors.on_surface.default.hex}};
      @define-color sidebar_bg_color @window_bg_color;
      @define-color sidebar_fg_color @window_fg_color;
      @define-color sidebar_border_color @window_bg_color;
      @define-color sidebar_backdrop_color @window_bg_color;
      @define-color matugen_surface {{colors.surface_container_low.default.hex}};
      @define-color matugen_surface_container {{colors.surface_container.default.hex}};
      @define-color matugen_accent {{colors.primary.default.hex}};
    '';

    # --- Thunderbird colors template ---
    ".config/matugen/templates/thunderbird.css".text = ''
      /* Auto-generated by matugen - do not edit manually */
      /* Thunderbird userContent.css */
      
      :root {
        --matugen-surface: {{colors.surface_container_low.default.hex}};
        --matugen-surface-container: {{colors.surface_container.default.hex}};
        --matugen-on-surface: {{colors.on_surface.default.hex}};
        --matugen-accent: {{colors.primary.default.hex}};
        --matugen-outline: {{colors.outline.default.hex}};
        --matugen-primary-container: {{colors.primary_container.default.hex}};
      }
      
      /* Backgrounds */
      body, html, #threadPaneBox, #threadPane, .tree-scroller, 
      #messagePane, #messagePaned, #folderPane,
      .folderPaneHeader, .threadPaneHeader,
      #attachmentBucket, #attachmentList,
      scrollbar, .scrollbar {
        background-color: {{colors.surface_container_low.default.hex}} !important;
        color: {{colors.on_surface.default.hex}} !important;
      }
      
      /* Input fields */
      input, textarea, search-input {
        background-color: {{colors.surface_container.default.hex}} !important;
        color: {{colors.on_surface.default.hex}} !important;
        border-color: {{colors.outline.default.hex}} !important;
      }
      
      /* Buttons */
      button, .toolbarbutton-1 {
        background-color: {{colors.surface_container_high.default.hex}} !important;
        color: {{colors.on_surface.default.hex}} !important;
      }
      
      button:hover {
        background-color: {{colors.surface_bright.default.hex}} !important;
      }
      
      /* Selected items */
      treechildren::-moz-tree-row(selected), 
      treechildren::-moz-tree-row(selected) {
        background-color: {{colors.primary_container.default.hex}} !important;
      }
      
      /* Headers and toolbars */
      #folderPaneHeader, #threadPaneHeader,
      .menubar, .toolbar, .tabs-toolbar {
        background-color: {{colors.surface_container.default.hex}} !important;
      }
    '';

    # --- Zathura template ---
    ".config/matugen/templates/zathura-colors".text = ''
      # Zathura colors - generated by matugen
      # Background matches surface_container_low for consistency with other apps

      # Colors - NO HIGHLIGHTING
      set default-bg              "{{colors.surface_container_low.default.hex}}"
      set default-fg              "{{colors.on_surface.default.hex}}"

      set statusbar-bg            "{{colors.surface_container_low.default.hex}}"
      set statusbar-fg            "{{colors.on_surface_variant.default.hex}}"

      set inputbar-bg             "{{colors.surface_container.default.hex}}"
      set inputbar-fg             "{{colors.on_surface.default.hex}}"

      set notification-bg          "{{colors.surface_container_low.default.hex}}"
      set notification-fg         "{{colors.on_surface.default.hex}}"

      # DISABLED HIGHLIGHTING - transparent
      set highlight-color         "{{colors.surface_container_low.default.rgba | set_alpha: 0.0}}"
      set highlight-active-color  "{{colors.surface_container_low.default.rgba | set_alpha: 0.0}}"

      set completion-bg            "{{colors.surface_container_low.default.hex}}"
      set completion-fg           "{{colors.on_surface.default.hex}}"
      set completion-highlight-bg "{{colors.surface_container_low.default.hex}}"
      set completion-highlight-fg "{{colors.on_surface.default.hex}}"

      set index-bg                "{{colors.surface_container_low.default.hex}}"
      set index-fg                "{{colors.on_surface.default.hex}}"
      set index-active-bg         "{{colors.surface_container_low.default.hex}}"
      set index-active-fg         "{{colors.on_surface.default.hex}}"

      set render-loading-bg       "{{colors.surface_container_low.default.hex}}"
      set render-loading-fg       "{{colors.on_surface.default.hex}}"

      set notification-error-bg   "{{colors.surface_container_low.default.hex}}"
      set notification-error-fg   "{{colors.error.default.hex}}"
      set notification-warning-bg "{{colors.surface_container_low.default.hex}}"
      set notification-warning-fg "{{colors.tertiary.default.hex}}"

      set border-color            "{{colors.outline.default.hex}}"

      # Recolor for PDF text
      set recolor                 "true"
      set recolor-lightcolor      "{{colors.surface_container_low.default.hex}}"
      set recolor-darkcolor       "{{colors.on_surface.default.hex}}"
      set recolor-reverse-video   "false"
    '';

    # --- Hyprland colors template ---
    ".config/matugen/templates/hyprland-colors.conf".text = ''
      $matugen_primary = {{colors.primary.default.hex}}
      $matugen_secondary = {{colors.secondary.default.hex}}
      $matugen_tertiary = {{colors.tertiary.default.hex}}
      $matugen_error = {{colors.error.default.hex}}
      $matugen_surface = {{colors.surface_container_low.default.hex}}
      $matugen_on_surface = {{colors.on_surface.default.hex}}
      $matugen_on_surface_variant = {{colors.on_surface_variant.default.hex}}
      $matugen_surface_container = {{colors.surface_container.default.hex}}
      $matugen_surface_container_low = {{colors.surface_container.default.hex}}
      $matugen_surface_container_high = {{colors.surface_container_high.default.hex}}
      $matugen_surface_bright = {{colors.surface_bright.default.hex}}
      $matugen_outline = {{colors.outline.default.hex}}
      $matugen_primary_container = {{colors.primary_container.default.hex}}
      $matugen_on_primary_container = {{colors.on_primary_container.default.hex}}
      $matugen_inverse_primary = {{colors.inverse_primary.default.hex}}
    '';

    # --- Yazi theme template ---
    ".config/matugen/templates/yazi-theme.toml".text = ''
      [mgr]
      cwd = { fg = "{{colors.on_surface.default.hex}}" }

      find_keyword  = { fg = "{{colors.error.default.hex}}", bold = true }
      find_position = { fg = "{{colors.error.default.hex}}", bold = true }

      marker_copied   = { fg = "{{colors.tertiary_fixed.default.hex}}", bg = "{{colors.tertiary_fixed.default.hex}}" }
      marker_cut      = { fg = "{{colors.tertiary_fixed.default.hex}}", bg = "{{colors.tertiary_fixed.default.hex}}" }
      marker_marked   = { fg = "{{colors.error.default.hex}}", bg = "{{colors.error.default.hex}}" }
      marker_selected = { fg = "{{colors.tertiary.default.hex}}", bg = "{{colors.tertiary.default.hex}}" }

      count_copied   = { fg = "{{colors.on_tertiary_fixed.default.hex}}", bg = "{{colors.tertiary_fixed.default.hex}}" }
      count_cut      = { fg = "{{colors.on_tertiary_fixed.default.hex}}", bg = "{{colors.tertiary_fixed.default.hex}}" }
      count_selected = { fg = "{{colors.on_primary.default.hex}}", bg = "{{colors.tertiary.default.hex}}" }

      border_symbol = "│"
      border_style  = { fg = "{{colors.surface_tint.default.hex}}" }

      [indicator]
      padding = { open = "█", close = "█" }

      [tabs]
      active    = { fg = "{{colors.primary.default.hex}}", bold = true, bg = "{{colors.surface_container_low.default.hex}}" }
      inactive  = { fg = "{{colors.secondary.default.hex}}", bg = "{{colors.surface_container_low.default.hex}}" }
      sep_inner = { open = "[", close = "]" }

      [mode]
      normal_main = { bg = "{{colors.primary.default.hex}}", fg = "{{colors.on_primary.default.hex}}", bold = true }
      normal_alt  = { bg = "{{colors.surface_variant.default.hex}}", fg = "{{colors.on_surface_variant.default.hex}}" }
      select_main = { bg = "{{colors.secondary.default.hex}}", fg = "{{colors.on_secondary.default.hex}}", bold = true }
      select_alt  = { bg = "{{colors.surface_variant.default.hex}}", fg = "{{colors.on_surface_variant.default.hex}}" }
      unset_main  = { bg = "{{colors.tertiary.default.hex}}", fg = "{{colors.on_tertiary.default.hex}}", bold = true }
      unset_alt   = { bg = "{{colors.surface_variant.default.hex}}", fg = "{{colors.on_surface_variant.default.hex}}" }

      [status]
      sep_left  = { open = "🭁", close = "🭠" }
      sep_right = { open = "🭁", close = "🭠" }

      perm_type  = { fg = "{{colors.secondary.default.hex}}" }
      perm_write = { fg = "{{colors.tertiary.default.hex}}" }
      perm_read  = { fg = "{{colors.error.default.hex}}" }
      perm_exec  = { fg = "{{colors.tertiary_fixed.default.hex}}" }
      perm_sep   = { fg = "{{colors.primary_fixed.default.hex}}" }

      progress_label  = { bold = true }
      progress_normal = { fg = "{{colors.primary.default.hex}}", bg = "{{colors.surface_bright.default.hex}}" }
      progress_error  = { fg = "{{colors.error.default.hex}}", bg = "{{colors.surface_bright.default.hex}}" }

      [which]
      cols = 3
      mask = { bg = "{{colors.surface_bright.default.hex}}" }
      cand = { fg = "{{colors.primary.default.hex}}" }
      rest = { fg = "{{colors.on_primary.default.hex}}" }
      desc = { fg = "{{colors.on_surface.default.hex}}" }
      separator = " ▶ "
      separator_style = { fg = "{{colors.on_surface.default.hex}}" }

      [notify]
      title_info  = { fg = "{{colors.tertiary.default.hex}}" }
      title_warn  = { fg = "{{colors.primary.default.hex}}" }
      title_error = { fg = "{{colors.error.default.hex}}" }

      [pick]
      border = { fg = "{{colors.primary.default.hex}}" }
      active = { fg = "{{colors.tertiary.default.hex}}", bold = true }
      inactive = {}

      [input]
      border = { fg = "{{colors.primary.default.hex}}" }
      value  = { fg = "{{colors.on_surface.default.hex}}" }

      [cmp]
      border = { fg = "{{colors.primary.default.hex}}", bg = "{{colors.on_primary.default.hex}}" }

      [tasks]
      border  = { fg = "{{colors.primary.default.hex}}" }
      title   = {}
      hovered = { fg = "{{colors.tertiary_fixed.default.hex}}", underline = true }

      [help]
      on     = { fg = "{{colors.on_surface.default.hex}}" }
      run    = { fg = "{{colors.on_surface.default.hex}}" }
      footer = { fg = "{{colors.on_secondary.default.hex}}", bg = "{{colors.secondary.default.hex}}" }

      [filetype]
      rules = [
          { mime = "image/*", fg = "{{colors.tertiary.default.hex}}" },
          { mime = "{audio,video}/*", fg = "{{colors.primary.default.hex}}" },
          { mime = "application/{zip,rar,7z*,tar,gzip,xz,zstd,bzip*,lzma,compress,archive,cpio,arj,xar,ms-cab*}", fg = "{{colors.secondary.default.hex}}" },
          { mime = "application/{pdf,doc,rtf}", fg = "{{colors.primary.default.hex}}" },
          { name = "*", is = "orphan", bg = "{{colors.error_container.default.hex}}" },
          { name = "*", is = "exec", fg = "{{colors.on_error_container.default.hex}}" },
          { url = "*", fg = "{{colors.on_surface.default.hex}}" },
          { url = "*/", fg = "{{colors.surface_tint.default.hex}}" },
      ]
    '';

    # --- OpenCode theme template ---
    ".config/matugen/templates/opencode-colors.json".text = ''
      {
        "$schema": "https://opencode.ai/theme.json",
        "defs": {
          "primary": "{{colors.primary.default.hex}}",
          "on_primary": "{{colors.on_primary.default.hex}}",
          "secondary": "{{colors.secondary.default.hex}}",
          "on_secondary": "{{colors.on_secondary.default.hex}}",
          "surface": "{{colors.surface.default.hex}}",
          "on_surface": "{{colors.on_surface.default.hex}}",
          "surface_variant": "{{colors.surface_variant.default.hex}}",
          "on_surface_variant": "{{colors.on_surface_variant.default.hex}}",
          "surface_container": "{{colors.surface_container.default.hex}}",
          "background": "{{colors.surface_container_low.default.hex}}",
          "on_background": "{{colors.on_surface.default.hex}}",
          "error": "{{colors.error.default.hex}}",
          "on_error": "{{colors.on_error.default.hex}}",
          "outline": "{{colors.outline.default.hex}}",
          "outline_variant": "{{colors.outline_variant.default.hex}}"
        },
        "theme": {
          "primary": { "dark": "primary", "light": "primary" },
          "secondary": { "dark": "secondary", "light": "secondary" },
          "accent": { "dark": "primary", "light": "primary" },
          "error": { "dark": "error", "light": "error" },
          "warning": { "dark": "secondary", "light": "secondary" },
          "success": { "dark": "secondary", "light": "secondary" },
          "info": { "dark": "primary", "light": "primary" },
          "text": { "dark": "on_surface", "light": "on_surface" },
          "textMuted": { "dark": "on_surface_variant", "light": "on_surface_variant" },
          "background": { "dark": "background", "light": "background" },
          "backgroundPanel": { "dark": "surface_container", "light": "surface_container" },
          "backgroundElement": { "dark": "surface_container", "light": "surface_container" },
          "border": { "dark": "outline_variant", "light": "outline_variant" },
          "borderActive": { "dark": "outline", "light": "outline" },
          "borderSubtle": { "dark": "outline_variant", "light": "outline_variant" },
          "diffAdded": { "dark": "secondary", "light": "secondary" },
          "diffRemoved": { "dark": "error", "light": "error" },
          "diffContext": { "dark": "surface_container", "light": "surface_container" },
          "diffHunkHeader": { "dark": "surface_container", "light": "surface_container" },
          "diffHighlightAdded": { "dark": "secondary", "light": "secondary" },
          "diffHighlightRemoved": { "dark": "error", "light": "error" },
          "diffAddedBg": { "dark": "surface_container", "light": "surface_container" },
          "diffRemovedBg": { "dark": "surface_container", "light": "surface_container" },
          "diffContextBg": { "dark": "surface_container", "light": "surface_container" },
          "diffLineNumber": { "dark": "on_surface_variant", "light": "on_surface_variant" },
          "diffAddedLineNumberBg": { "dark": "surface_container", "light": "surface_container" },
          "diffRemovedLineNumberBg": { "dark": "surface_container", "light": "surface_container" },
          "markdownText": { "dark": "on_surface", "light": "on_surface" },
          "markdownHeading": { "dark": "primary", "light": "primary" },
          "markdownLink": { "dark": "primary", "light": "primary" },
          "markdownLinkText": { "dark": "secondary", "light": "secondary" },
          "markdownCode": { "dark": "secondary", "light": "secondary" },
          "markdownBlockQuote": { "dark": "surface_container", "light": "surface_container" },
          "markdownEmph": { "dark": "secondary", "light": "secondary" },
          "markdownStrong": { "dark": "primary", "light": "primary" },
          "markdownHorizontalRule": { "dark": "surface_container", "light": "surface_container" },
          "markdownListItem": { "dark": "primary", "light": "primary" },
          "markdownListEnumeration": { "dark": "secondary", "light": "secondary" },
          "markdownImage": { "dark": "primary", "light": "primary" },
          "markdownImageText": { "dark": "secondary", "light": "secondary" },
          "markdownCodeBlock": { "dark": "on_surface", "light": "on_surface" },
          "syntaxComment": { "dark": "on_surface_variant", "light": "on_surface_variant" },
          "syntaxKeyword": { "dark": "primary", "light": "primary" },
          "syntaxFunction": { "dark": "secondary", "light": "secondary" },
          "syntaxVariable": { "dark": "on_surface", "light": "on_surface" },
          "syntaxString": { "dark": "secondary", "light": "secondary" },
          "syntaxNumber": { "dark": "secondary", "light": "secondary" },
          "syntaxType": { "dark": "primary", "light": "primary" },
          "syntaxOperator": { "dark": "on_surface", "light": "on_surface" },
          "syntaxPunctuation": { "dark": "on_surface_variant", "light": "on_surface_variant" }
        }
      }
    '';

    # --- Firefox CSS variables template (disabled - matugen doesn't support iterating over all colors) ---
    # ".config/matugen/templates/firefox-colors.css".text = ''
    #   :root {
    #   {% for name, value in colors %}
    #       --{{name}}: {{value.default.hex}};
    #   {% endfor %}
    #   }
    # '';

    # --- Spicetify template ---
    ".config/matugen/templates/spicetify.ini".text = ''
      [matugen]
      main = {{colors.surface_container_low.dark.hex}}
      submain = {{colors.surface.dark.hex}}
      secondary = {{colors.surface_variant.dark.hex}}
      secondary2 = {{colors.outline.dark.hex}}
      text = {{colors.on_surface.dark.hex}}
      subtext = {{colors.on_surface_variant.dark.hex}}
      indicator = {{colors.primary.dark.hex}}
      cover-overlay = {{colors.primary_container.dark.hex}}
    '';

    # --- Matugen config ---
    ".config/matugen/config.toml".text = ''
      [config]
      mode = "dark"
      contrast = 0.3

      [templates.obsidian]
      input_path = '${home}/.config/matugen/templates/obsidian-colors.css'
      output_path = '${vault}/.obsidian/snippets/matugen-colors.css'

      [templates.kitty]
      input_path = '${home}/.config/matugen/templates/kitty-colors.conf'
      output_path = '${home}/.config/kitty/colors.conf'

      [templates.vesktop]
      input_path = '${home}/.config/matugen/templates/midnight-discord.css'
      output_path = '${home}/.config/vesktop/themes/midnight-discord.css'

      [templates.gtk3]
      input_path = '${home}/.config/matugen/templates/gtk-colors.css'
      output_path = '${home}/.config/gtk-3.0/matugen-colors.css'

      [templates.gtk4]
      input_path = '${home}/.config/matugen/templates/gtk-colors.css'
      output_path = '${home}/.config/gtk-4.0/matugen-colors.css'

      [templates.hyprland]
      input_path = '${home}/.config/matugen/templates/hyprland-colors.conf'
      output_path = '${home}/.config/hypr/matugen-colors.conf'

      [templates.yazi]
      input_path = '${home}/.config/matugen/templates/yazi-theme.toml'
      output_path = '${home}/.config/yazi/theme.toml'

      [templates.opencode]
      input_path = '${home}/.config/matugen/templates/opencode-colors.json'
      output_path = '${home}/.config/opencode/themes/matugen.json'

      # [templates.firefox]
      # input_path = '${home}/.config/matugen/templates/firefox-colors.css'
      # output_path = '${home}/.config/matugen/firefox-colors.css'

      [templates.thunderbird]
      input_path = '${home}/.config/matugen/templates/thunderbird.css'
      output_path = '${home}/.thunderbird/chrome/userContent.css'

      [templates.zathura]
      input_path = '${home}/.config/matugen/templates/zathura-colors'
      output_path = '${home}/.config/zathura/colors.conf'
    '';

    # --- Zathura base config (sources colors.conf) ---
    ".config/zathura/zathurarc".text = ''
      # Generated by matugen - source the colors
      include colors.conf

      # Base settings
      set window-title-basename true
      set selection-clipboard clipboard
      set search-hadjust true
      set incremental-search true
      set adjust-open width
    '';
  };
}
