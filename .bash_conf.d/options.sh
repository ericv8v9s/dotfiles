# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# glob for hidden
shopt -q -s dotglob
shopt -q -s globstar
# don't execute when glob fails
shopt -q -s failglob

shopt -q -s autocd

# disable history expansion
set +H
# don't save history
unset HISTFILE
