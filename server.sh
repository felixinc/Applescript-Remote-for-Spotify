echo Trying to create pipe
mkfifo /tmp/backpipe
echo


cd $(dirname "$0")

while true
do
  echo Listening
  ./remote.sh < /tmp/backpipe | nc -l 8080 > /tmp/backpipe
  echo Done
  date
  echo
done
