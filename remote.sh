read Hbefehl Hpfad Hproto
#echo $Hbefehl
#echo $Hpfad
#echo $Hproto

case $Hbefehl in
POST)
case $Hpfad in
/next)
  echo -e 'HTTP/1.1 202 Accepted\r\n'
  osascript -e 'tell application "Spotify" to next track'
  osascript -e 'tell application "Spotify" to get "<b>Title:</b> " & name of current track & " <br> " & "<b>Album:</b> " & album of current track & " <br> " & "<b>Artist:</b> " & artist of current track'
;;
/prev)
  echo -e 'HTTP/1.1 202 Accepted\r\n'
  osascript -e 'tell application "Spotify" to previous track'
  osascript -e 'tell application "Spotify" to get "<b>Title:</b> " & name of current track & " <br> " & "<b>Album:</b> " & album of current track & " <br> " & "<b>Artist:</b> " & artist of current track'
;;
/pp)
  echo -e 'HTTP/1.1 202 Accepted\r\n'
  osascript -e 'tell application "Spotify" to playpause'
  osascript -e 'tell application "Spotify" to get player state'
;;
/airplay)
  echo -e 'HTTP/1.1 202 OK\r\n'
  osascript airport.scpt
;;
*)
  echo -e 'HTTP/1.1 405 Method Not Allowed\r\n'
  #echo -e 'Allow:???r\n'
;;
esac
;;

PUT)
case $Hpfad in
/play)
  echo -e 'HTTP/1.1 202 Accepted\r\n'
  osascript -e 'tell application "Spotify" to play'
  osascript -e 'tell application "Spotify" to get "<b>Title:</b> " & name of current track & " <br> " & "<b>Album:</b> " & album of current track & " <br> " & "<b>Artist:</b> " & artist of current track'
;;
/pause)
  echo -e 'HTTP/1.1 202 Accepted\r\n'
  osascript -e 'tell application "Spotify" to pause'
  osascript -e 'tell application "Spotify" to get player state'
;;
/sleeping)
  echo -e 'HTTP/1.1 202 Accepted\r\n'
  echo Computer is sleeping now.
  osascript -e 'tell application "System Events" to sleep'
;;
*)
  echo -e 'HTTP/1.1 405 Method Not Allowed\r\n'
;;
esac
;;

GET)
case $Hpfad in
/info)
  echo -e 'HTTP/1.1 202 Accepted\r\n' 
  osascript -e 'tell application "Spotify" to get "<b>Title:</b> " & name of current track & " <br> " & "<b>Album:</b> " & album of current track & " <br> " & "<b>Artist:</b> " & artist of current track'
;;
/)
  echo -e 'HTTP/1.1 202 Accepted\r\n'
  cat index.html
;;
*)
  echo -e 'HTTP/1.1 405 Method Not Allowed\r\n'
;;
esac
;;

esac
