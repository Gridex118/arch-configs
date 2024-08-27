syntax match @variable.member /^[^=]\+/
syntax match @identifier /^\$[^=]\+/
syntax match VusualNC /=\&[^=]\+$/
syntax match Comment /\s*#.\+$/
syntax match @constructor /^[^{]\+ {\|\s*}/
syntax match Keyword /\s*\(bind.\?\|submap\|source\)\s*=/
