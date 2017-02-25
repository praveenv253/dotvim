set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "print"

hi Normal                           ctermfg=000
hi Comment             cterm=italic ctermfg=247
hi String                           ctermfg=034
hi Number                           ctermfg=160
hi Constant                         ctermfg=166
hi Special                          ctermfg=118
hi Identifier            cterm=none ctermfg=003
hi Statement             cterm=bold ctermfg=208
hi PreProc                          ctermfg=128
hi Type                  cterm=bold ctermfg=214
hi Function                         ctermfg=026
hi Operator                         ctermfg=019
hi Ignore                           ctermfg=007
hi Error                            ctermfg=124
hi Todo                             ctermfg=000 ctermbg=011
hi MatchParen            cterm=bold ctermfg=160 ctermbg=none

" Common groups that link to default highlighting.
" You can specify other highlighting easily.
hi link String           String
hi link Character        String
hi link Number           Number
hi link Boolean          Constant
hi link Float            Number
hi link Conditional      Statement
hi link Repeat           Statement
hi link Label            Statement
hi link Keyword          Statement
hi link Exception        Statement
hi link Include          PreProc
hi link Define           PreProc
hi link Macro            PreProc
hi link PreCondit        PreProc
hi link StorageClass     Type
hi link Structure        Type
hi link Typedef          Type
hi link Tag              Special
hi link SpecialChar      Special
hi link Delimiter        Special
hi link SpecialComment   Special
hi link Debug            Special
hi link Operator         Operator

" C-specific
hi cCustomClass          ctermfg=030

" Python-specific
hi pythonExceptions      cterm=bold ctermfg=160

" Make-specific
hi link makeTarget       Statement
hi link makeIdent        Type
hi link makeCommands     String

" Tex-specific
hi link texSection       Statement
hi link texStatement     Type
hi link texTypeStyle     Type
hi link texDelimiter     Operator
hi link texRefZone       String
hi link texSectionName   String
hi link texInputFile     String
hi link texMathZoneA     String
hi link texMathZoneE     String
hi link texMathZoneX     String
hi link texMathZoneY     String
hi link texMathSymbol    Special
hi link texSubscript     Special
hi link texSuperscript   Special
hi link texZone          Function

" Vim-specific
hi link VimGroup         Identifier
hi link VimHiGroup       Identifier
hi link VimHiCterm       String
hi link VimHiCtermFgBg   String
hi link VimHiAttrib      Number
hi link VimOption        Identifier

" Miscellaneous
hi LineNr                ctermfg=251
hi ColorColumn                       ctermbg=255
hi SpecialKey            ctermfg=250
