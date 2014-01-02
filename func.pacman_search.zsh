function pac_search {
  /usr/bin/pacman -Ss $@ | egrep '^\w'
}
