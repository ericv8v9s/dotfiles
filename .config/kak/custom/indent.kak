set-option current tabstop 2
set-option current indentwidth 0

define-command et 'set-option buffer indentwidth %opt{tabstop}'
define-command noet 'set-option buffer indentwidth 0'


hook global WinSetOption filetype= %{
	require-module dumb-indent
	hook window InsertChar \n -group default-indent do-dumb-indent
	hook -once -always window WinSetOption filetype=.* %{
		remove-hooks window default-indent
	}
}

# default indentation that simply copies that of the previous line
provide-module dumb-indent %{
	define-command -hidden do-dumb-indent %{
		evaluate-commands -draft -itersel %{
			execute-keys -draft <semicolon> K <a-&>
		}
	}
}
