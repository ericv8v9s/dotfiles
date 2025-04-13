set-option current scrolloff 5,5

set-option -add current ui_options terminal_assistant=none
set-option -add current ui_options terminal_enable_mouse=false
set-option -add current ui_options terminal_status_on_top=true

add-highlighter global/ show-matching
add-highlighter global/ show-whitespaces -spc \  -tab │ -lf ↵
add-highlighter global/ number-lines -min-digits 3
add-highlighter global/ column 81 default,bright-black

colorscheme base16-custom

define-command wrap 'add-highlighter buffer/ wrap -word -indent'


# empty buffer on startup
set-option global startup_info_version -1
hook global BufCreate \Q*scratch*\E %{
	execute-keys '%' d
}
