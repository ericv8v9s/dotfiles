hook global BufCreate .*[.](rb) %{
	set-option buffer indentwidth %opt{tabstop}
}
