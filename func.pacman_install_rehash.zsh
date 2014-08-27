function pac_install_rehash {
  if [ -x $(which sudo) ]; then
    sudo pacman -S $@
  else
    su -c "pacman -S $@"
  fi
  rehash
}
