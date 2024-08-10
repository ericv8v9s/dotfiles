for f in "$HOME/.bash_conf.d/functions.d/"*; do
	if [[ -f "$f" ]] && ! [[ "${f##*/}" == .* ]]; then
		source "$f"
	fi
done
