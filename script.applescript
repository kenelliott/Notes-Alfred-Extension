on alfred_script(str)
	set str to "" & str & ""
	set AppleScript's text item delimiters to ":"
	set theName to text item 1 of str
	set theBody to text item 2 of str
	tell application "Notes"
		set theNotes to (get every note whose name is theName)
		set cnt to count theNotes
		if cnt is greater than 0 then
			set thisNote to item 1 of theNotes
			set totalBody to body of thisNote
			set body of thisNote to body of thisNote & "<br />" & theBody
			return 1
		else
			make new note at folder "Notes" with properties {name:theName, body:"<strong>" & theName & "</strong><br /><br />" & theBody}
		end if
	end tell
end alfred_script