# tree.zsh

# this emulates the tree command in Linux
find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'