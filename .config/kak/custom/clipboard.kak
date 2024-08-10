hook global NormalKey y|d|c %{ nop %sh{
	printf %s "$kak_main_reg_dquote" | xsel --input --clipboard
}}

# These are in user mode (i.e., type ',p' to paste from system clipboard)
# These would prevent pasting if we don't have X (e.g. through ssh)
#map global normal P '! xsel --output --clipboard<ret>'
#map global normal p '<a-!> xsel --output --clipboard<ret>'
#map global normal R '| xsel --output --clipboard<ret>'
