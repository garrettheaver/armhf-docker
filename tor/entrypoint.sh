#! /bin/sh
CONFIG=/var/lib/tor/torrc

while true; do
  case "$1" in
    --listen)
      printf "SocksListenAddress $2:9050\n" >> $CONFIG
      shift 2
      ;;

    --exit-nodes)
      printf "ExitNodes $2\nStrictNodes 1\n" >> $CONFIG
      shift 2
      ;;

    --socks-policy)
      printf "SocksPolicy $2\n" >> $CONFIG
      shift 2
      ;;

    --avoid-disk-writes)
      printf "AvoidDiskWrites 1\n" >> $CONFIG
      shift 1
      ;;

    *)
      break
      ;;
  esac
done

tor --ignore-missing-torrc -f $CONFIG

