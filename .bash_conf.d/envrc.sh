# these variables, unlike ~/.environment,
# are sourced for every interactive shell

# gpg needs this
export GPG_TTY=$(tty)

# Haskell
source "$HOME/.ghcup/env"
