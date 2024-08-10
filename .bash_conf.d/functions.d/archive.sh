STORAGE_DIR="$HOME/storage/"
ARCHIVE_DIR="$HOME/archive/"

function link_parents {
	local from="$1"
	local to="$2"

	if ! ( [[ -d "$from" ]] && [[ -d "$to" ]] ); then
		echo "$0 FROM_DIR TO_DIR TARGETS..."
		return 1
	fi

	local pwd="$PWD"
	cd "$from"

	local has_error=0

	for p in "${@:3}"; do
		local target="$( realpath -L --relative-base="$from" "$pwd/$p" )"
		if [[ $? -ne 0 ]] || [[ "$target" == /* ]]; then
			echo "bad path: $p"
			has_error=1
			continue
		fi

		# rsync treat target that ends with slash to mean content of directory,
		# without transfering the directory itself.
		# Thankfully, realpath never puts a slash to the last component.
		if ! rsync -aicR --link-dest="$from" "$target" "$to" ; then
			echo "Failed to copy path: $p"
			has_error=1
		fi
	done

	cd "$pwd"

	return $has_error
}


function archive {
	link_parents "$STORAGE_DIR" "$ARCHIVE_DIR" "$@" && rm -rf "$@"
}

function restore {
	link_parents "$ARCHIVE_DIR" "$STORAGE_DIR" "$@" && rm -rf "$@"
}
