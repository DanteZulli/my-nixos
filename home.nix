{
  config,
  pkgs,
  ...
}: {
  home.username = "dante";
  home.homeDirectory = "/home/dante";

  home.packages = with pkgs; [
    fortune
    (discord.override {
      withVencord = true;
    })
    prusa-slicer
    fastfetch
    protonup-qt
    bitwarden-desktop
    ferdium
    mangohud
    goverlay
    (heroic.override {
      extraPkgs = pkgs: [
        pkgs.gamescope
        pkgs.gamemode
      ];
    })
    cartridges
    git
    vscode
    warp-terminal
    wget
    vlc
    alejandra
    pokemon-colorscripts-mac
    libreoffice-qt
    localsend
    kdePackages.kolourpaint
  ];

  programs.git = {
    enable = true;
    userName = "Dante Zulli";
    userEmail = "dantezulli2004@gmail.com";
    extraConfig = {
      push = {
        autoSetupRemote = true;
      };
    };
  };

  programs.librewolf = {
    enable = true;
    # Enable WebGL, cookies and history
    settings = {
      "webgl.disabled" = false;
      "privacy.resistFingerprinting" = false;
      "privacy.clearOnShutdown.history" = false;
      "privacy.clearOnShutdown.cookies" = false;
      "network.cookie.lifetimePolicy" = 0;
    };
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
      command_timeout = 1300;
      scan_timeout = 50;
      format = "$all$nix_shell$nodejs$lua$golang$rust$php$git_branch$git_commit$git_state$git_status\n$username$hostname$directory";
    };
  };

  programs.alacritty = {
    enable = true;
    settings = {
      env.TERM = "xterm-256color";
      font = {
        size = 12;
      };
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
      window = {
        dimensions = {
          columns = 120;
          lines = 40;
        };
      };
      # Arc Dark Theme: https://gist.github.com/BobbyWibowo/8392af0c1bb3131c6e09b9395968b649
      colors = {
        primary = {
          background = "#383c4a";
          foreground = "#d3dae3";
        };
        cursor = {
          text = "#383c4a";
          cursor = "#d3dae3";
        };
        vi_mode_cursor = {
          text = "#383c4a";
          cursor = "#d3dae3";
        };
        selection = {
          text = "CellForeground";
          background = "#616981";
        };
        search = {
          matches = {
            foreground = "CellBackground";
            background = "#5294e2";
          };
        };
        normal = {
          black = "#4b5164";
          red = "#e14245";
          green = "#5ca75b";
          yellow = "#f6ab32";
          blue = "#4877b1";
          magenta = "#a660c3";
          cyan = "#5294e2";
          white = "#a9a9aa";
        };
        bright = {
          black = "#616981";
          red = "#e16f7e";
          green = "#add488";
          yellow = "#fdc35f";
          blue = "#8ca9bf";
          magenta = "#e2afec";
          cyan = "#73c5e2";
          white = "#fcfcfc";
        };
        dim = {
          black = "#2c2f3a";
          red = "#783228";
          green = "#4b7c16";
          yellow = "#b65619";
          blue = "#2b486b";
          magenta = "#614a73";
          cyan = "#1b668f";
          white = "#63686d";
        };
      };
    };
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    initExtra = ''
      eval "$(starship init bash)"
      pokemon-colorscripts -r
      fortune
    '';
  };

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
