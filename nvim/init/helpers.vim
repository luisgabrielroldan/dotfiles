" vim: set ft=vim:

"=============================================================================
" => Helper functions
"=============================================================================

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


"=============================================================================
" Sessions management commands
"
" Author: Gabriel Roldán & ChatGPT
" Original idea: https://www.abdus.net/blog/2020/session-management-in-vim/
"=============================================================================

let g:sessions_overwrite = 0
let g:sessions_directory = expand("~/.config/nvim/sessions/")

" Function to save the current session
fu! SessionSave()
  let session_file = g:sessions_directory . split(getcwd(), '/')[-1] . '.vim'
  if filereadable(session_file)
    if g:sessions_overwrite == 0
      let user_choice = confirm("Session file already exists. Overwrite?", "&Yes\n&No", 2)
      if user_choice == 2
        echo "Session not saved!"
        return
      endif
    endif
  endif

  execute 'mksession! ' . session_file
  let g:sessions_overwrite = 1
endfunction


" Function to restore a session if exists
fu! SessionRestore()
  let session_file = g:sessions_directory . split(getcwd(), '/')[-1] . '.vim'
  if filereadable(session_file)
    echo session_file

    execute 'source ' . session_file

    let g:sessions_overwrite = 1

    if bufexists(1)
      for l in range(1, bufnr('$'))
        if bufwinnr(l) == -1
          exec 'sbuffer ' . l
        endif
      endfor
    endif
  else
    let g:sessions_overwrite = 0
  endif
endfunction
