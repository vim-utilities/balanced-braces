#!/usr/bin/env vim
" balanced-braces.vim - Attempts to balance parentheses and curly/square-braces
" Version: 0.0.1
" Maintainer: S0AndS0 <https://github.com/S0AndS0>
" License: AGPL-3.0


if exists('g:balanced_braces__loaded') || v:version < 700
  finish
endif
let g:balanced_braces__loaded = 1


""
" Type Definition: {dictionary} define__configurations_entry
" Property: {string} input - Character from keyboard input
" Property: {string} open - Opening brace/peren
" Property: {string} close - Closing brace/peren


""
" Type Definition: {dictionary} define__configurations
" [key: string]: define__configurations_entry


""
" Merged dictionaries without mutation
" Parameter: {dict} defaults - Dictionary of default key/value pares
" Parameter: {...dict[]} override - Up to 20 dictionaries to merge into return
" Return: {dict}
" See: {docs} :help type()
" See: {link} https://vi.stackexchange.com/questions/20842/how-can-i-merge-two-dictionaries-in-vim
function s:Dict_Merge(defaults, ...) abort
  let l:new = copy(a:defaults)
  if a:0 == 0
    return l:new
  endif

  for l:override in a:000
    for [l:key, l:value] in items(l:override)
      if type(l:value) == type({}) && type(get(l:new, l:key)) == type({})
        let l:new[l:key] = Dict_Merge(l:new[l:key], l:value)
      else
        let l:new[l:key] = l:value
      endif
    endfor
  endfor

  return l:new
endfunction


""
" Registers Insert mode re-mapping
" Parameter: {define__configurations_entry} configuration_entry
function! s:Register_Insert_Remapping(configuration_entry) abort
  for [l:name, l:config] in items(a:configuration_entry)
    if type(l:config) != type({})
      continue
    endif

    execute 'inoremap <expr>' l:config['open'] 'Balanced_Braces("'
          \ . l:config['open'] . '", "'
          \ . l:config['open'] . '", "'
          \ . l:config['close'] . '")'

    execute 'inoremap <expr>' l:config['close'] 'Balanced_Braces("'
          \ . l:config['close'] . '", "'
          \ . l:config['open'] . '", "'
          \ . l:config['close'] . '")'
  endfor
endfunction


""
" Parameter: {string} input
" Parameter: {string} open
" Parameter: {string} close
" @see {link} https://www.reddit.com/r/vim/comments/bsh7da/how_do_i_make_vim_automatically_complete/
function! Balanced_Braces(input, open, close) abort
  let l:current_word = expand('<cWORD>')
  let l:current_character = getline('.')[col('.') - 1]

  if a:input == a:close
    if l:current_character == a:close
      return repeat("\<right>", len(a:close))
    else
      return a:input
    endif
  else
    return a:open . a:close . repeat("\<left>", len(a:close))
  endif
endfunction


""
" Configurations that may be overwritten
" Type: define__configurations
let s:defaults = {
      \   'parentheses': { 'open': '(', 'close': ')' },
      \   'curly-brace': { 'open': '{', 'close': '}' },
      \   'square-bracket': { 'open': '[', 'close': ']' },
      \ }

""
" Merge customization with defaults
" See: {docs} :help fnamemodify()
" See: {docs} :help readfile()
" See: {docs} :help json_decode()
if exists('g:balanced_braces')
  if type(g:balanced_braces) == type('') && fnamemodify(g:balanced_braces, ':e') == 'json'
    let g:balanced_braces = json_decode(join(readfile(g:balanced_braces), ''))
  endif

  if type(g:balanced_braces) == type({})
    let g:balanced_braces = s:Dict_Merge(s:defaults, g:balanced_braces)
  else
    let g:balanced_braces = s:defaults
  endif
else
  let g:balanced_braces = s:defaults
endif


autocmd BufWinEnter * :call s:Register_Insert_Remapping(g:balanced_braces)

