#!/bin/bash

#say 1

read Hbefehl Hpfad Hproto
#echo $Hbefehl
#echo $Hpfad
#echo $Hproto

#say 2

case $Hbefehl in
POST)
case $Hpfad in
/next)
  echo -e 'HTTP/1.1 202 Accepted'
  echo -e 'Content-Type: text/html'
  echo -e '\r\n'
  osascript -e 'tell application "Spotify" to next track'
  osascript info.scpt
;;
/prev)
  echo -e 'HTTP/1.1 202 Accepted'
  echo -e 'Content-Type: text/html'
  echo -e '\r\n'
  osascript -e 'tell application "Spotify" to previous track'
  osascript info.scpt
;;
/pp)
  echo -e 'HTTP/1.1 202 Accepted'
  echo -e 'Content-Type: text/html'
  echo -e '\r\n'
  osascript pp.scpt
;;
/airplay)
  echo -e 'HTTP/1.1 202 Accepted'
  echo -e 'Content-Type: text/html'
  echo -e '\r\n'
  osascript airport.scpt
;;
/toggleshuffle)
  echo -e 'HTTP/1.1 202 Accepted'
  echo -e 'Content-Type: text/html'
  echo -e '\r\n'
  osascript -e 'tell application "Spotify" to set shuffling to not shuffling'
  osascript -e 'tell application "Spotify" to get "<span>" & shuffling & "</span>"'
;;
*)
  echo -e 'HTTP/1.1 405 Method Not Allowed'
  echo -e 'Content-Type: text/plain'
  echo -e '\r\n'
  echo -e '405 Method Not Allowed'
  #echo -e 'Allow:???r\n'
;;
esac
;;

PUT)
case $Hpfad in
/play)
  echo -e 'HTTP/1.1 202 Accepted'
  echo -e 'Content-Type: text/html'
  echo -e '\r\n'
  osascript -e 'tell application "Spotify" to play'
  osascript info.scpt
;;
/pause)
  echo -e 'HTTP/1.1 202 Accepted'
  echo -e 'Content-Type: text/html'
  echo -e '\r\n'
  osascript -e 'tell application "Spotify" to pause'
  osascript -e 'tell application "Spotify" to get player "<span>" & state & "</span>"'
;;
/sleeping)
  echo -e 'HTTP/1.1 202 Accepted'
  echo -e 'Content-Type: text/html'
  echo -e '\r\n'
  echo -e '<span>Computer is sleeping now.</span>'
  osascript -e 'tell application "System Events" to sleep'
;;
*)
  echo -e 'HTTP/1.1 405 Method Not Allowed'
  echo -e 'Content-Type: text/plain'
  echo -e '\r\n'
  echo -e '405 Method Not Allowed'
;;
esac
;;

GET)
case $Hpfad in
/info)
  echo -e 'HTTP/1.1 202 Accepted'
  echo -e 'Content-Type: text/html'
  echo -e '\r\n'
  osascript info.scpt
;;
/)
  echo -e 'HTTP/1.1 202 Accepted'
  echo -e 'Content-Type: text/html'
  echo -e '\r\n'
  cat index.html
;;
/getUNSAFEpp)
  echo -e 'HTTP/1.1 202 Accepted'
  echo -e 'Content-Type: text/html'
  echo -e '\r\n'
  osascript pp.scpt
;;
*)
  echo -e 'HTTP/1.1 405 Method Not Allowed'
  echo -e 'Content-Type: text/plain'
  echo -e '\r\n'
  echo -e '405 Method Not Allowed'
;;
esac
;;

esac

#say 3
