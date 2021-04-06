set number


call plug#begin('~/.vim/plugged')

Plug 'c0r73x/colorizer'
Plug 'Shougo/deoplete.nvim'  " python completion only for neovim, VIM users DELETE THIS !!
Plug 'deoplete-plugins/deoplete-jedi' " python completion only for neovim, VIM users DELETE THIS !!
Plug 'flazz/vim-colorschemes'
Plug 'vim-syntastic/syntastic'
Plug 'mhinz/vim-startify'
Plug 'jiangmiao/auto-pairs'
Plug 'zhou13/vim-easyescape'
Plug 'takac/vim-hardtime'
Plug 'Igorjan94/codeforces.vim'
Plug 'kien/rainbow_parentheses.vim'

call plug#end()

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

colorscheme gruvbox
