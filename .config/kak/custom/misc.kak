define-command lsbuf 'echo %val{buflist}'

map global normal <c-pageup> ': buffer-previous<ret>'
map global normal <c-pagedown> ': buffer-next<ret>'

hook global BufOpenFile .* editorconfig-load
hook global BufNewFile .* editorconfig-load

define-command dq 'delete-buffer; quit'
define-command -params .. -file-completion ne 'new edit %arg{@}'
