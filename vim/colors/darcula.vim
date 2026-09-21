" Darcula-like colorscheme for terminal Vim (JetBrains-inspired).
" Based on common Darcula palette; works with termguicolors.

hi clear
if exists('syntax_on')
  syntax reset
endif
let g:colors_name = 'darcula'
set background=dark

hi Normal       guifg=#A9B7C6 guibg=#2B2B2B ctermfg=250 ctermbg=235
hi Comment      guifg=#808080 guibg=NONE   ctermfg=244 ctermbg=NONE
hi Constant     guifg=#6897BB guibg=NONE   ctermfg=67  ctermbg=NONE
hi String       guifg=#6A8759 guibg=NONE   ctermfg=71  ctermbg=NONE
hi Character    guifg=#6A8759 guibg=NONE   ctermfg=71  ctermbg=NONE
hi Number       guifg=#6897BB guibg=NONE   ctermfg=67  ctermbg=NONE
hi Boolean      guifg=#6897BB guibg=NONE   ctermfg=67  ctermbg=NONE
hi Identifier   guifg=#A9B7C6 guibg=NONE   ctermfg=250 ctermbg=NONE
hi Function     guifg=#FFC66D guibg=NONE   ctermfg=221 ctermbg=NONE
hi Statement    guifg=#CC7832 guibg=NONE   ctermfg=166 ctermbg=NONE
hi Conditional  guifg=#CC7832 guibg=NONE   ctermfg=166 ctermbg=NONE
hi Repeat       guifg=#CC7832 guibg=NONE   ctermfg=166 ctermbg=NONE
hi Label        guifg=#CC7832 guibg=NONE   ctermfg=166 ctermbg=NONE
hi Operator     guifg=#A9B7C6 guibg=NONE   ctermfg=250 ctermbg=NONE
hi Keyword      guifg=#CC7832 guibg=NONE   ctermfg=166 ctermbg=NONE
hi Exception    guifg=#CC7832 guibg=NONE   ctermfg=166 ctermbg=NONE
hi PreProc      guifg=#BBB529 guibg=NONE   ctermfg=185 ctermbg=NONE
hi Type         guifg=#A9B7C6 guibg=NONE   ctermfg=250 ctermbg=NONE
hi StorageClass guifg=#CC7832 guibg=NONE   ctermfg=166 ctermbg=NONE
hi Structure    guifg=#A9B7C6 guibg=NONE   ctermfg=250 ctermbg=NONE
hi Define       guifg=#BBB529 guibg=NONE   ctermfg=185 ctermbg=NONE
hi Special      guifg=#A9B7C6 guibg=NONE   ctermfg=250 ctermbg=NONE
hi SpecialChar  guifg=#6A8759 guibg=NONE   ctermfg=71  ctermbg=NONE
hi Tag          guifg=#E8BF6A guibg=NONE   ctermfg=179 ctermbg=NONE
hi Title        guifg=#FFFFFF guibg=NONE   ctermfg=15  ctermbg=NONE gui=bold cterm=bold
hi Underlined   guifg=#589DF6 guibg=NONE   ctermfg=68  ctermbg=NONE gui=underline cterm=underline
hi Ignore       guifg=bg      guibg=bg     ctermfg=NONE ctermbg=NONE
hi Error        guifg=#FFFFFF guibg=#9E2927 ctermfg=15  ctermbg=124
hi ErrorMsg     guifg=#FFFFFF guibg=#9E2927 ctermfg=15  ctermbg=124
hi WarningMsg   guifg=#FFC66D guibg=NONE   ctermfg=221 ctermbg=NONE
hi ModeMsg      guifg=#A9B7C6 guibg=NONE   ctermfg=250 ctermbg=NONE
hi MoreMsg      guifg=#6A8759 guibg=NONE   ctermfg=71  ctermbg=NONE
hi Question     guifg=#6A8759 guibg=NONE   ctermfg=71  ctermbg=NONE gui=bold cterm=bold
hi Cursor       guifg=#2B2B2B guibg=#BBBBBB ctermfg=235 ctermbg=250
hi CursorLine   guifg=NONE    guibg=#323232 ctermfg=NONE ctermbg=236
hi CursorLineNr guifg=#A9B7C6 guibg=#323232 ctermfg=250 ctermbg=236 gui=bold cterm=bold
hi LineNr       guifg=#606366 guibg=#313335 ctermfg=241 ctermbg=236
hi Visual       guifg=NONE    guibg=#214283 ctermfg=NONE ctermbg=24
hi Search       guifg=#2B2B2B guibg=#E8BF6A ctermfg=235 ctermbg=179
hi IncSearch     guifg=#2B2B2B guibg=#E8BF6A ctermfg=235 ctermbg=179
hi Pmenu        guifg=#A9B7C6 guibg=#3C3F41 ctermfg=250 ctermbg=237
hi PmenuSel     guifg=#FFFFFF guibg=#214283 ctermfg=15  ctermbg=24
hi StatusLine   guifg=#A9B7C6 guibg=#3C3F41 ctermfg=250 ctermbg=237
hi StatusLineNC guifg=#A9B7C6 guibg=#2B2B2B ctermfg=250 ctermbg=235
hi VertSplit    guifg=#515658 guibg=#2B2B2B ctermfg=240 ctermbg=235
hi Folded       guifg=#A9B7C6 guibg=#3C3F41 ctermfg=250 ctermbg=237
hi FoldColumn   guifg=#A9B7C6 guibg=#2B2B2B ctermfg=250 ctermbg=235
hi SignColumn   guifg=#A9B7C6 guibg=#2B2B2B ctermfg=250 ctermbg=235
hi MatchParen   guifg=#FFC66D guibg=#3C3F41 ctermfg=221 ctermbg=237 gui=bold cterm=bold
