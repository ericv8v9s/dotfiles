function foreach {
	xargs -d \\n -I{} "$@"
}
