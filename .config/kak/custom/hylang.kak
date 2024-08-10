# https://hylang.org/
# Modified from lisp.kak (to my personal taste, probably with errors).

# Detection
# ‾‾‾‾‾‾‾‾‾

hook global BufCreate .*[.](hy) %{
    set-option buffer filetype hylang
    #set-option buffer indentwidth 2
}

# Initialization
# ‾‾‾‾‾‾‾‾‾‾‾‾‾‾

hook global WinSetOption filetype=hylang %{
    require-module dumb-indent
    hook window InsertChar \n -group hylang-indent do-dumb-indent

    require-module hylang

    hook window ModeChange pop:insert:.* -group hylang-trim-indent hylang-trim-indent
    #hook window InsertChar \n -group hylang-indent hylang-indent-on-new-line
    set-option buffer extra_word_chars '_' '+' '-' '*' '/' '@' '$' '%' '^' '&' '_' '=' '<' '>' '~' '.'

    hook -once -always window WinSetOption filetype=.* %{ remove-hooks window hylang-.+ }
}

hook -group hylang-highlight global WinSetOption filetype=hylang %{
    add-highlighter window/hylang ref hylang
    hook -once -always window WinSetOption filetype=.* %{ remove-highlighter window/hylang }
}

provide-module hylang %{

# Highlighters
# ‾‾‾‾‾‾‾‾‾‾‾‾

add-highlighter shared/hylang regions
add-highlighter shared/hylang/code default-region group
add-highlighter shared/hylang/string  region '"' (?<!\\)(\\\\)*" fill string
add-highlighter shared/hylang/bracket-string  region '#\[[^\[\]]*\[' (?<!\\)(\\\\)*\][^\[\]]*\] fill string
add-highlighter shared/hylang/comment region ';' '$'             fill comment

#add-highlighter shared/hylang/code/ regex (#?(['`:]|,@?))?\b[a-zA-Z][\w!$%&*+./:<=>?@^_~-]* 0:variable
add-highlighter shared/hylang/code/ regex \*[a-zA-Z][\w!$%&*+./:<=>?@^_~-]*\* 0:variable

# Integer formats
add-highlighter shared/hylang/code/ regex '(?i)\b0b[01]+l?\b' 0:value
add-highlighter shared/hylang/code/ regex '(?i)\b0x[\da-f]+l?\b' 0:value
add-highlighter shared/hylang/code/ regex '(?i)\b(0o)?\d+l?\b' 0:value
# Float formats
add-highlighter shared/hylang/code/ regex '\b\d+[eE][+-]?\d+\b' 0:value
add-highlighter shared/hylang/code/ regex '(\b\d+)?\.\d+\b' 0:value
add-highlighter shared/hylang/code/ regex '\b\d+\.' 0:value
# Imaginary formats
add-highlighter shared/hylang/code/ regex '\b\d+\+\d+[jJ]\b' 0:value

add-highlighter shared/hylang/code/ regex (<|>|<=|=|>=|!=) 0:operator
add-highlighter shared/hylang/code/ regex \b(None|True|False|self)\b 0:value
# Python(-ish) keywords
add-highlighter shared/hylang/code/ regex \b(not|is|in|and|or|if|else|async|await|break|continue|match|while|with|yield|del|assert|global|nonlocal|import|return|raise|try|except|finally)\b 0:keyword
# Lispy keywords
add-highlighter shared/hylang/code/ regex \b(def[a-z]+|pragma|fn|for)\b 0:keyword
add-highlighter shared/hylang/code/ regex \b(when|cond|do|lfor|dfor|gfor|sfor|let|setv|setx|quasiquote|quote|unquote|require|cut)\b 0:builtin

# Commands
# ‾‾‾‾‾‾‾‾

define-command -hidden hylang-trim-indent %{
    # remove trailing white spaces
    try %{ execute-keys -draft -itersel x s \h+$ <ret> d }
}

#declare-option \
#    -docstring 'regex matching the head of forms which have options *and* indented bodies' \
#    regex lisp_special_indent_forms \
#    '(?:def.*|if(-.*|)|let.*|lambda|with-.*|when(-.*|))'

define-command -hidden hylang-indent-on-new-line %{
    # registers: i = best align point so far; w = start of first word of form
    evaluate-commands -draft -save-regs '/"|^@iw' -itersel %{
        execute-keys -draft 'gk"iZ'
        try %{
            execute-keys -draft '[bl"i<a-Z><gt>"wZ'

            #try %{
            #    # If a special form, indent another (indentwidth - 1) spaces
            #    execute-keys -draft '"wze<a-k>\A' %opt{lisp_special_indent_forms} '\z<ret>'
            #    execute-keys -draft '"wze<a-L>s.{' %sh{printf $(( kak_opt_indentwidth - 1 ))} '}\K.*<ret><a-;>;"i<a-Z><gt>'
            #} catch %{
                # If not "special" form and parameter appears on line 1, indent to parameter
                execute-keys -draft '"wz<a-K>[()\[\]{}]<ret>e<a-l>s\h\K[^\s].*<ret><a-;>;"i<a-Z><gt>'
            #}
        }
        try %{ execute-keys -draft '[rl"i<a-Z><gt>' }
        try %{ execute-keys -draft '[Bl"i<a-Z><gt>' }
        execute-keys -draft ';"i<a-z>a&,'
    }
}

}
