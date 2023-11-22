{ config, lib, pkgs, ... }:
{
  environment.variables.EDITOR = "nvim";
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    configure = {
      customRC = ''
        set number
        set background=dark
        "colorscheme afterglow
        set smartindent
        set tabstop=4
        set shiftwidth=4
        set expandtab
        syntax enable
        set t_Co=256
        "set spell spelllang=en_us
        hi clear SpellBad
        hi SpellBad cterm=underline
        hi SpellBad ctermbg=NONE
        match ErrorMsg '\s\+$'

        " Theme
        let g:airline_powerline_fonts = 1
        "let g:airline_theme=
        set laststatus=2
    '';
    packages.myVimPackage = with pkgs.vimPlugins; {
      start = [ ctrlp vim-nix vim-airline vim-airline-themes vim-lastplace ];
      };
    };
  };
}
