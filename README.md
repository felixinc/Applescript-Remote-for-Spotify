Applescript-Remote-for-Spotify
==============================

This is a simple browser based remote for Spotify.
It consists basically in a few lines of shellscript that rely on netcat and Applescript on the server side (a Mac with Spotify) and a browser on the client side (a smartphone or a tablet).

This means that there is no additional software installation needed, since OS X ships with netcat and Applescript support and a browser is available on each and every smartphone.

I made this software because I wanted to keep the ability to use AirPlay speakers with Spotify, I distrust android apps and I don't want to confide my mac credentials to one of them.

These criteria excluded the Spotify App (because it doesn't support AirPlay) and several "Spotify Remote" Apps from my choice (beause they either want the login credentials for my mac or require a counterpart softare on the mac).


This solution works, but at the same time there are a few things to improve, e.g. the name of the AirPlay speakers is hard coded by now.

And of course this stub can easily be augmented into a remote for any other player software that supports Applescript.
