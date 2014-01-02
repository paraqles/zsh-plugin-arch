function yaourt_search {
  /usr/bin/yaourt -Ss $@ | egrep '^\w'
}
