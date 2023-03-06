function! SetHabamaxColors() abort
    highlight Normal ctermbg=none ctermfg=white
    highlight Type ctermfg=81
    highlight Statement ctermfg=140
    highlight PreProc ctermfg=204
    highlight cIncluded ctermfg=163
    highlight Number ctermfg=83
endfunction

augroup ColorSchemeOverride
	autocmd!
	autocmd ColorScheme habamax call SetHabamaxColors()
augroup end

colorscheme habamax

set tabstop=4 shiftwidth=4
set nowrap

syntax on
filetype plugin indent on

inoremap jj <esc>
noremap <S-Right> :tabn <Return>
noremap <S-left> :tabp <Return>
