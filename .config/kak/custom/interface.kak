set-option current scrolloff 5,5

set-option -add current ui_options terminal_assistant=none
set-option -add current ui_options terminal_enable_mouse=false

add-highlighter global/ show-matching
add-highlighter global/ show-whitespaces -spc \  -tab │
add-highlighter global/ number-lines -min-digits 3
add-highlighter global/ column 81 default,bright-black

colorscheme default-soft

define-command wrap 'add-highlighter buffer/ wrap -word -indent'


# empty buffer on startup
set-option global startup_info_version -1
hook global BufCreate \Q*scratch*\E %{
	execute-keys '%' d
}
