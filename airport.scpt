set desiredOutput to "AirPort"

tell application "System Preferences" to activate
tell application "System Events"
	tell process "System Preferences"
		delay 1
		activate
		set frontmost to true
		perform action "AXRaise" of first window
		click menu item "Ton" of menu "Einstellungen" of menu bar 1
		delay 1
		set theRows to every row of table 1 of scroll area 1 of tab group 1 of window "Ton"
		set theOutputs to {} as list
		if selected of item 1 in theRows is true then
			repeat with aRow in theRows
				try
					set outputName to value of text field 1 of aRow
				on error
					set outputName to "-"
				end try
				if (outputName as text) is equal to desiredOutput then
					set selected of aRow to true
					exit repeat
				end if
			end repeat
		else
			set selected of item 1 in theRows to true
		end if
	end tell
end tell
tell application "System Preferences" to quit
