" vim: set ft=vim:

"=============================================================================
" => NERDTree
"=============================================================================

map <silent><leader>nt :NERDTreeToggle<cr>
map <silent><leader>nn :NERDTreeFind<cr>
"
let g:NERDTreeCascadeSingleChildDir = 0

"=============================================================================
" => FZF
"=============================================================================

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

nnoremap <silent> <Leader>fw :Windows<CR>
nnoremap <silent> <Leader>bb :Buffers<CR>

nnoremap <silent> <Leader>ag :Ag<CR>
nnoremap <silent> <Leader>fp :Frg<CR>
nnoremap <silent> <Leader>ff :Frga<CR>
" nnoremap <silent> <Leader>flu :Locate ~<CR>
" nnoremap <silent> <Leader>flr :Locate /<CR>
nnoremap <silent> <Leader>fh :History<CR>
nnoremap <silent> <Leader>fT :Tags<CR>

nnoremap <silent> <Leader>gl :Commits<CR>
nnoremap <silent> <Leader>gb :BCommits<CR>
nnoremap <silent> <Leader>gs :GFiles?<CR>
nnoremap <silent> <Leader>gg :GGrep?<CR>
nnoremap <silent> <Leader>ft :Filetypes<CR>

nnoremap <silent> <Leader>; :Maps<CR>
nnoremap <silent> <Leader>: :Commands<CR>
nnoremap <silent> <Leader>h :Helptags<CR>
nnoremap <silent> <Leader>ll :Lines<CR>
nnoremap <silent> <Leader>lb :BLines<CR>


command -bang Frg
  \ call fzf#vim#files(<q-args>, {'source': 'rg --files -g ""'}, <bang>0)

command -bang Frga
  \ call fzf#vim#files(<q-args>, {'source': 'rg --files --hidden -g "!.git/*"'}, <bang>0)

command -bang -nargs=* Rg
  \ call fzf#vim#grep('rg --colors "match:bg:yellow" --colors "match:fg:black" --colors "match:style:nobold" --colors "path:fg:green" --colors "path:style:bold" --colors "line:fg:yellow" --colors "line:style:bold" --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 0, <bang>0)

command -bang -nargs=* Rga
  \ call fzf#vim#grep('rg --colors "match:bg:yellow" --colors "match:fg:black" --colors "match:style:nobold" --colors "path:fg:green" --colors "path:style:bold" --colors "line:fg:yellow" --colors "line:style:bold" --hidden --column --line-number --no-heading --color=always --smart-case -g "!.git/*" '.shellescape(<q-args>), 0, <bang>0)

command -bang -nargs=* GGrep
  \ call fzf#vim#grep('git grep --line-number '.shellescape(<q-args>), 0, <bang>0)

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang Colors
  \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'}, <bang>0)

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 '--ignore "node_modules"',
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

"=============================================================================
" => vim-test
"=============================================================================
" let test#strategy = "vimterminal"

nmap <silent> <leader>Tf :TestFile<CR>
nmap <silent> <leader>Tn :TestNearest<CR>
nmap <silent> <leader>Tl :TestLast<CR>

function! ElixirUmbrellaTransform(cmd) abort
  if match(a:cmd, 'apps/') != -1
    return substitute(a:cmd, 'mix test apps/\([^/]*\)/', 'mix cmd --app \1 mix test --color ', '')
  else
    return a:cmd
  end
endfunction

let g:test#custom_transformations = {'elixir_umbrella': function('ElixirUmbrellaTransform')}
let g:test#transformation = 'elixir_umbrella'

"=============================================================================
" => vim-mix-format
"=============================================================================

" let g:mix_format_elixir_bin_path = '~/.asdf/installs/elixir/1.6.0/bin'
let g:mix_format_options = '--check-equivalent'
let g:mix_format_silent_errors = 1

autocmd FileType elixir nnoremap <silent> <Leader>mf :MixFormat<CR>
autocmd FileType elixir nnoremap <silent> <Leader>mc :Mix compile<CR>

"=============================================================================
" => Syntastic
"=============================================================================

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

let g:syntastic_mode_map = { 'mode': 'passive' }
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
" Enable the elixir checker
let g:syntastic_elixir_checkers = ['elixir']
let g:syntastic_enable_elixir_checker = 1

" Enable the eslint checker
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_javascript_eslint_generic = 1
let g:syntastic_javascript_eslint_exec = '/bin/ls'
let g:syntastic_javascript_eslint_exe='$(npm bin)/eslint'
let g:syntastic_javascript_eslint_args='-f compact'

nnoremap <silent> <Leader>sc :SyntasticCheck<CR>
nnoremap <silent> <Leader>sr :SyntasticCheck<CR>

"=============================================================================
" => wesQ3/vim-windowswap
"=============================================================================
let g:windowswap_map_keys = 0

nnoremap <silent> <leader>WW :call WindowSwap#EasyWindowSwap()<CR>

"=============================================================================
" => Vim Wiki
"=============================================================================

let g:vimwiki_list = [{'path': '~/vimwiki/', 'auto_generate_links': 1, 'auto_toc': 1, 'auto_diary_index': 1}]

autocmd FileType vimwiki  nmap <leader>ws :VimwikiSearch<Space>
autocmd FileType vimwiki  nmap <leader>lo :lopen<CR>
autocmd FileType vimwiki  nmap <leader>lc :lclose<CR>
autocmd FileType vimwiki  nmap <leader>ln :lnext<CR>
autocmd FileType vimwiki  nmap <leader>lp :lprevious<CR>

"=============================================================================
" => CTags
"=============================================================================

let g:tagbar_use_cache = 0

let g:tagbar_type_elixir = {
    \ 'ctagstype' : 'elixir',
    \ 'kinds' : [
        \ 'p:protocols',
        \ 'm:modules',
        \ 'e:exceptions',
        \ 'y:types',
        \ 'd:delegates',
        \ 'f:functions',
        \ 'c:callbacks',
        \ 'a:macros',
        \ 't:tests',
        \ 'i:implementations',
        \ 'o:operators',
        \ 'r:records'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 'p' : 'protocol',
        \ 'm' : 'module'
    \ },
    \ 'scope2kind' : {
        \ 'protocol' : 'p',
        \ 'module' : 'm'
    \ },
    \ 'sort' : 0
\ }

set tags=./tags;$HOME

nmap <F8> :TagbarToggle<CR>


" =================================================
" CoC extensions
" =================================================
"
let g:coc_global_extensions = ['coc-tsserver', 'coc-css', 'coc-elixir', '@yaegassy/coc-volar']


" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"


function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nmap <leader>rn <Plug>(coc-rename)

" Copilot mappings
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")

let g:copilot_no_tab_map = v:true

" Disable copilot for certain filetypes
" let g:copilot_filetypes = {
"       \ 'xml': v:false,
"       \ }
"

