" vim: set ft=vim:

"=============================================================================
" => Vim-Plug
"=============================================================================
let vimplug_path=expand(stdpath('data').'/site/autoload/plug.vim')

if !filereadable(vimplug_path)
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!curl -fLo " . shellescape(vimplug_path) . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

  autocmd VimEnter * PlugInstall
endif

call plug#begin(expand('~/.config/nvim/plugged'))

"=============================================================================
" => Basic
"=============================================================================
Plug 'junegunn/fzf'         " Fuzzy file search
Plug 'junegunn/fzf.vim'     " Fzf integration with Vim
Plug 'scrooloose/nerdtree'  " File explorer
Plug 'kassio/neoterm'       " Terminal emulator
Plug 'janko-m/vim-test'     " Test runner integration
Plug 'tomtom/tcomment_vim'  " Commenting/uncommenting code
Plug 'editorconfig/editorconfig-vim'  " EditorConfig integration
Plug 'wesQ3/vim-windowswap'  " Swap windows
Plug 'mattn/emmet-vim'      " Emmet abbreviation expansion
Plug 'lukas-reineke/indent-blankline.nvim'  " Indentation visualization
Plug 'pangloss/vim-javascript'  " JavaScript syntax highlighting and indentation

"Typescript
Plug 'leafgarland/typescript-vim'  " Typescript syntax highlighting and indentation
Plug 'neoclide/coc.nvim', {'branch': 'release'}  " Language server protocol integration (autocomplete, refactoring, etc.)

"=============================================================================
" => Themes
"=============================================================================
Plug 'rakr/vim-one'              " A beautiful and vibrant color scheme for Vim
Plug 'vim-airline/vim-airline'   " A lightweight statusline plugin for Vim
Plug 'vim-airline/vim-airline-themes'   " A collection of themes for the vim-airline plugin

"=============================================================================
" => Others
"=============================================================================
Plug 'vimwiki/vimwiki'                     " A personal wiki for Vim
Plug 'majutsushi/tagbar'                   " A tag list plugin for Vim
Plug 'octol/vim-cpp-enhanced-highlight'    " Enhanced syntax highlighting for C++
Plug 'vim-syntastic/syntastic'             " Syntax checking plugin for Vim
Plug 'mhinz/vim-mix-format'                " Elixir formatter for Vim
Plug 'airblade/vim-gitgutter'              " Shows git changes in the Vim gutter
Plug 'tpope/vim-fugitive'                  " A Git wrapper for Vim
Plug 'elixir-editors/vim-elixir'           " Elixir language support for Vim
Plug 'slashmili/alchemist.vim'             " Elixir tooling integration for Vim


" == CodeGPT ========================================
Plug 'nvim-lua/plenary.nvim' " Provides utility functions and lua APIs for nvim plugins
Plug 'MunifTanjim/nui.nvim' " A UI library for creating neat UIs in Neovim
Plug 'dpayne/CodeGPT.nvim' " A plugin for using OpenAI's GPT-3 model to generate code in Neovim
" == CodeGPT ========================================

"""""
call plug#end()
