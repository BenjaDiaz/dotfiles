function! myspacevim#before() abort
endfunction

function! myspacevim#after() abort
  imap <C-k>     <Plug>(neosnippet_expand_or_jump)
  smap <C-k>     <Plug>(neosnippet_expand_or_jump)
  xmap <C-k>     <Plug>(neosnippet_expand_target)
  let g:auto_save = 1  " enable AutoSave on Vim startup
  let g:neomake_python_python_exe = 'python3'
  let g:loaded_python_provider = 0
endfunction
