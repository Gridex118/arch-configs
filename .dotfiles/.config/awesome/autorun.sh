#!/usr/bin/bash

run() {
  if ! pgrep -f "$1" ;
  then
    "$@"&
  fi
}

run picom -b
run polybar
