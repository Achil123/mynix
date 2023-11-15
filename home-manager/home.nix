{ config, pkgs, ... }:

{
  # User
  home.username = "faaiq";
  home.homeDirectory = "/home/faaiq";
  home.stateVersion = "23.05";

  # Package
  home.packages = with pkgs; [
  ];

  # File
  home.file = {
  };

  # Env Variables
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Zsh
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    history = {
      ignoreAllDups = true;
      ignorePatterns = [ "rm *" "pkill *" "sudo rm *" ];
    };
    historySubstringSearch.enable = true;
    initExtra = ''
      unsetopt nomatch
      bindkey '^[[A' history-substring-search-up
      bindkey '^[[B' history-substring-search-down
      HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1
    '';
    shellAliases = {
      ll = "ls -l";
      update = "sudo nixos-rebuild switch";
      hg = "history|grep";
    };
    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-autosuggestions"; }
      ];
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "thefuck" ];
      theme = "jbergantine";
    };
  };

  programs.home-manager.enable = true;
  programs.fzf.enable = true;
}
