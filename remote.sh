read Hbefehl Hpfad Hproto
#echo $Hbefehl
#echo $Hpfad
#echo $Hproto

case $Hpfad in
/info)
  echo -e 'HTTP/1.1 202 OK\r\n' 
  osascript -e 'tell application "Spotify" to get "<b>Title:</b> " & name of current track & " <br> " & "<b>Album:</b> " & album of current track & " <br> " & "<b>Artist:</b> " & artist of current track'
;;
/next)
  echo -e 'HTTP/1.1 202 OK\r\n'
  osascript -e 'tell application "Spotify" to next track'
  osascript -e 'tell application "Spotify" to get "<b>Title:</b> " & name of current track & " <br> " & "<b>Album:</b> " & album of current track & " <br> " & "<b>Artist:</b> " & artist of current track'
;;
/prev)
  echo -e 'HTTP/1.1 202 OK\r\n'
  osascript -e 'tell application "Spotify" to previous track'
  osascript -e 'tell application "Spotify" to get "<b>Title:</b> " & name of current track & " <br> " & "<b>Album:</b> " & album of current track & " <br> " & "<b>Artist:</b> " & artist of current track'
;;
/play)
  echo -e 'HTTP/1.1 202 OK\r\n'
  osascript -e 'tell application "Spotify" to play'
  osascript -e 'tell application "Spotify" to get player state'
;;
/pause)
  echo -e 'HTTP/1.1 202 OK\r\n'
  osascript -e 'tell application "Spotify" to pause'
  osascript -e 'tell application "Spotify" to get player state'
;;
/pp)
  echo -e 'HTTP/1.1 202 OK\r\n'
  osascript -e 'tell application "Spotify" to playpause'
  osascript -e 'tell application "Spotify" to get player state'
;;
/airplay)
  echo -e 'HTTP/1.1 202 OK\r\n'
  osascript airport.scpt
;;
/sleeping)
  echo -e 'HTTP/1.1 202 OK\r\n'
  echo Computer is sleeping now.
  osascript -e 'tell application "System Events" to sleep'
;;
*)
  echo -e 'HTTP/1.1 202 OK\r\n'
  cat index.html
;;
esac
