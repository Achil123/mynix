{ config, pkgs, ... }:

{
  # User
  home.username = "faaiq";
  home.homeDirectory = "/home/faaiq";
  home.stateVersion = "23.11";

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
      ignorePatterns = [ "rm *" "pkill *" "kill *" "killall *" "sudo rm *" "sudo pkill *" "sudo kill *" "sudo killall *" ];
    };
    historySubstringSearch.enable = true;
    initExtra = ''
      unsetopt nomatch
    '';
    localVariables = {
      HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE = 1;
      ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE = "fg=#663399,standout";
    };
    shellAliases = {
      l = "ls -alh";
      ll = "ls -l";
      ls = "ls --color=always";
      update = "sudo nixos-rebuild switch";
      upgrade = "sudo nixos-rebuild boot --upgrade";
      home-update = "home-manager switch";
      hg = "history|grep";
      del = "sudo nix-store --gc; sudo nix-collect-garbage -d";
      home-del = "home-manager expire-generations 5sec";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "thefuck" ];
      theme = "robbyrussell";
    };
  };

  # Git
  programs.git = {
    enable = true;
    userName = "Achil123";
    userEmail = "faaiqamarullah@gmail.com";
  };

  programs.home-manager.enable = true;
  programs.fzf.enable = true;
  programs.dircolors.enable = true;
}
