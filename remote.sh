read Hbefehl Hpfad Hproto
#echo $Hbefehl
#echo $Hpfad
#echo $Hproto

case $Hpfad in
/info)
  echo -e 'HTTP/1.1 202 OK\r\n' 
  osascript -e 'tell application "Spotify" to get "Title: " & name of current track & " <br> " & "Album: " & album of current track & " <br> " & "Artist: " & artist of current track'
;;
/next)
  echo -e 'HTTP/1.1 202 OK\r\n'
  osascript -e 'tell application "Spotify" to next track'
  echo next
;;
/prev)
  echo -e 'HTTP/1.1 202 OK\r\n'
  osascript -e 'tell application "Spotify" to previous track'
  echo previous
;;
/play)
  echo -e 'HTTP/1.1 202 OK\r\n'
  osascript -e 'tell application "Spotify" to play'
  echo play
;;
/pause)
  echo -e 'HTTP/1.1 202 OK\r\n'
  osascript -e 'tell application "Spotify" to pause'
  echo pause
;;
/pp)
  echo -e 'HTTP/1.1 202 OK\r\n'
  osascript -e 'tell application "Spotify" to playpause'
  echo playpause
;;
/airplay)
  echo -e 'HTTP/1.1 202 OK\r\n'
  echo airplay
  osascript airport.scpt
;;
/sleeping)
  echo -e 'HTTP/1.1 202 OK\r\n'
  echo sleeping
  osascript -e 'tell application "System Events" to sleep'
;;
*)
  echo -e 'HTTP/1.1 202 OK\r\n'
  cat index.html
;;
esac
