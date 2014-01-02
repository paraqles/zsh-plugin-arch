
function inf_up {
  inf=$1

  ip='/usr/sbin/ip'
  grep='/usr/bin/grep'

  if [ $($($ip link) | $grep $inf | $grep up) ]; then
    return 0
  else
    return 1
  fi
}

function netctl_func {
  command=$1
  net=$2
  inf=$3


  ip='/usr/bin/ip'
  grep='/usr/bin/grep'
  netctl='/usr/bin/netctl'
  sudo='/usr/bin/sudo'

  case $command in
    start)
      if [ $(inf_up $inf) ]; then
        $sudo $ip link set $inf down
      fi
      $sudo $netctl start $net
    ;;
    stop)
      if [ $(inf_up $inf) ]; then
        $sudo $ip link set $inf down
      fi
      $sudo $netctl stop $net
    ;;
    restart)
      netctl stop $net $inf
      netctl start $net $inf
    ;;
    status)
      $sudo $netctl status $net
    ;;
    *)
      $netctl --help
    ;;
  esac
}

function netwlan {
  netctl $1 $2 wlan0
}

function neteth {
  netctl $1 $2 enp0s10
}

