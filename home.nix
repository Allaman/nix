{ config, pkgs, ... }:

# https://nix-community.github.io/home-manager/options.xhtml
{
  imports = [
    ./mail.nix
  ];
  # Home Manager needs a bit of information about you and the paths it should manage.
  home.username = "michael";
  home.homeDirectory = "/home/michael";

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    pkgs.atuin # Shell history (from flake.nix)
    pkgs.flameshot # Screenshots
    pkgs.keepassxc # password manager
    pkgs.xautolock # automatic screen locking
    #java
    pkgs.age # key management
    pkgs.bat # cat alternative
    pkgs.cargo
    pkgs.chezmoi # dotfile management
    pkgs.clipmenu # clipboard manager
    pkgs.distrobox # Linux distribution as Podman/Docker
    pkgs.eza # ls alternative (from flake.nix)
    pkgs.fd # finder alternative
    pkgs.firefox # best browser
    pkgs.gitui # Git TUI
    pkgs.go
    pkgs.go-task # Makefile alternative written in Go
    pkgs.gopass # CLI password manager
    pkgs.lf # TUI file manager
    pkgs.localsend # AirDrop alternative
    pkgs.nodejs
    pkgs.obsidian # markdown based knowledge management
    pkgs.rofi # App launcher / dmenu replacement
    pkgs.ripgrep # grep alternative
    pkgs.rustc
    pkgs.tectonic # LaTex compiler
    pkgs.tig # GIT TUI
    pkgs.tmux # Terminal multiplexer
    pkgs.trash-cli # trash bin
    pkgs.ueberzugpp # ueberzug written in C++
    pkgs.xclip # clipboard tool
    pkgs.xdotool # simulate keyboard/mouse
    pkgs.yazi # TUI file manager
    pkgs.zoxide # Quickly jump to know folders
    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/michael/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

}
