syntax match @variable.member /^[^=]\+/
syntax match @identifier /^\$[^=]\+/
syntax match VusualNC /=\&[^=]\+$/
syntax match Comment /\s*#.\+$/
syntax match @constructor /^[^{]\+ {\|\s*}/
syntax match Keyword /\s*\(binde\|bindm\|bind\|submap\|source\)\s*=/
