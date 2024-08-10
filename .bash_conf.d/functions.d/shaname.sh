function shaname {
	for path in "$@"; do
		if [ ! -e "$path" ]; then
			continue
		fi
		file_dir="$( dirname "$path" )"
		file_base="$( basename "$path" )"

		# don't treat hidden files as extension
		# also keep dot prefix
		is_hidden=false
		if [ "${file_base#.}" != "$file_base" ]; then
			is_hidden=true
			file_base="${file_base#.}"
		fi

		sha_str="${file_base%%.*}"
		sha="$( echo -n "$sha_str" | sha1sum | head -c 7 )"

		target="${file_dir}"
		if $is_hidden; then
			target="${target}/.${sha}_${file_base}"
		else
			target="${target}/${sha}_${file_base}"
		fi
		mv -i "$path" "$target"
	done
}
