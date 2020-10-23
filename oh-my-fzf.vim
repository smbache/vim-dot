set rtp+=/usr/local/opt/fzf

let g:fzf_layout = { 'down': '50%' }

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)

command! -bang -nargs=* Files call fzf#vim#files(<q-args>, fzf#vim#with_preview({}), <bang>0)

function! GitZF(...)
  let committed = 'git diff-tree --relative --no-commit-id --name-status -r master.. | awk ''{ print $NF }'''
  let current = 'git status --short | awk ''{ print $NF }'''
  let dedup = 'awk ''!x[$1]++'''
  let cmd = 'echo "$(' . committed . ')\n$(' . current . ')" |' . dedup

  call fzf#run({
        \ 'source': cmd,
        \ 'sink': 'e',
        \ 'options': '--multi --preview "bat --style=numbers --color=always {} || highlight -O ansi -l {} || coderay {} || rougify {} || cat {}"'
        \ })
endfunction

command! GZF call GitZF()

nnoremap <Leader>g mA:GZF<CR>
nnoremap <Leader>/ mA:Ag<CR>
nnoremap <Leader><c-l> mA:call fzf#vim#buffer_lines(expand('<cword>'))<CR>
nnoremap <Leader><c-L> mA:call fzf#vim#lines(expand('<cword>'))<CR>
nnoremap <Leader>f mA:Files<CR>
nnoremap <Leader>b mA:Buffers<CR>
nnoremap <Leader>l mA:BLines<CR>
nnoremap <Leader>L mA:Lines<CR>
nnoremap <Leader>w mA:Windows<CR>
