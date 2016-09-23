#! /bin/sh
CONFIG=/var/lib/tor/torrc

while true; do

  case "$1" in
    -l|--listen)
      printf "SocksListenAddress $2:9050\n" >> $CONFIG
      ;;

    -x|--exit-nodes)
      printf "ExitNodes $2\nStrictNodes 1\n" >> $CONFIG
      ;;

    *)
      break
      ;;
  esac

  shift 2

done

tor --ignore-missing-torrc -f $CONFIG

