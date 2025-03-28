{ config, pkgs, ... }:

{

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
    thunderbird
    quickemu
    vlc
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

  programs.bash = {
    enable = true;
    enableCompletion = true;
    initExtra = ''
      eval "$(starship init bash)"
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
