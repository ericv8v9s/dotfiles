#!/usr/bin/python3

import os
#from glob import glob
from pathlib import Path


# list of iterables of item p,
# where str(p) is a path to a file to include
INCLUDES = [
	# default kak configs
	Path("/usr/share/kak/autoload/").glob("**/*.kak"),
	# custom configs
	Path(os.environ.get("XDG_CONFIG_HOME", "~/.config") + "/kak/")
		.expanduser().glob("**/*.kak")
]


EXCLUDES = {
	"/usr/share/kak/autoload/filetype/lisp.kak",
	"/usr/share/kak/autoload/filetype/markdown.kak"
}


for group in INCLUDES:
	for path in sorted(map(str, group)):
		if not path in EXCLUDES:
			print(f'source "{path}"')
