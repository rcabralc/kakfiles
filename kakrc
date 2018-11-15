source "%val{config}/plugins/plug.kak/rc/plug.kak"

plug "andreyorst/plug.kak" noload

plug "h-youhei/kakoune-surround" config %{
    declare-user-mode surround
    map global surround s ':surround<ret>' -docstring 'surround'
    map global surround c ':change-surround<ret>' -docstring 'change'
    map global surround d ':delete-surround<ret>' -docstring 'delete'
    map global surround t ':select-surrounding-tag<ret>' -docstring 'select tag'
}

map global normal <space> , -docstring 'leader'
map global normal <backspace> <space> -docstring 'remove all selections except main'
map global normal <a-backspace> <a-space> -docstring 'remove main selection'
map global normal <a-left> <a-space> -docstring 'remove main selection, Hacker''s Keyboard'

map global insert <c-l> '<esc>'

map global user <space> ':' -docstring 'enter command'
map global user q ': quit<ret>' -docstring 'quit'
map global user w ': write<ret>' -docstring 'save'
map global user e ':e<space>' -docstring 'edit file'
map global user s ': enter-user-mode surround<ret>' -docstring 'surround mode'
map global user y %{<a-|> $(
    type termux-clipboard-set >/dev/null &&
    echo termux-clipboard-set ||
    echo xset --clipboard
)<ret>} -docstring 'yank selection to clipboard'
map global user p %{<a-!> $(
    type termux-clipboard-get >/dev/null &&
    echo termux-clipboard-get ||
    echo xset --output --clipboard
)<ret>} -docstring 'paste clipboard contents after selection'
map global user P %{! $(
    type termux-clipboard-get >/dev/null &&
    echo termux-clipboard-get ||
    echo xset --output --clipboard
)<ret>} -docstring 'paste clipboard contents before selection'
map global user d ',yd' -docstring 'cut selection to clipboard'
