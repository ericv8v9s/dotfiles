# Generated from RVM install script and reorganized here manually.

function rvminit {
	export PATH

	# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
	PATH="$PATH:$HOME/.rvm/bin"

	# NPM stuff; configured to install without root; required by yarn by rails
	PATH="$PATH:$HOME/.npm/bin"

	# Load RVM into a shell session *as a function*
	[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" \
	&& export PS1="(\$(rvm-prompt)) $PS1"
}
