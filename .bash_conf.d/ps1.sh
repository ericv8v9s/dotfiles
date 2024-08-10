# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
	xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
	if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
	else
	color_prompt=
	fi
fi


# Reference ANSI escapes
# https://en.wikipedia.org/wiki/ANSI_escape_code#SGR_(Select_Graphic_Rendition)_parameters
# CSI is the Control Sequence Introducer, `ESC [`, written `\e[` below.
if [ "$color_prompt" = yes ]; then
	color_clear='\[\e[m\]'
	color_username='\[\e[32m\]'
	color_pwd='\[\e[34m\]'
	color_prompt_symbol='\[\e[33m\]'
	color_ssh_host='\[\e[;43m\]'
fi

PS1="${color_clear}${color_pwd}[\w]\n${color_username}\u"
if [[ "$SSH_CONNECTION" ]]; then
	PS1="${PS1}${color_ssh_host}@\H${color_clear}"
fi
PS1="${PS1}${color_prompt_symbol} >${color_clear} "
unset color_prompt force_color_prompt
