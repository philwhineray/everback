on run argv

-- Copyright (c) 2015 Philip Whineray
-- SPDX-License-Identifier:  GPL-3.0-or-later

if (count of argv) < 3 then return "Usage: osascript import.scpt 'Notebook Name' 'Note Name' '/absolute/path/to/some.txt'"

set nb to item 1 of argv
set n to item 2 of argv
set f to item 3 of argv

log "Notebook: " & nb
log "Note: " & n
log "File: " & f

tell application "Evernote"
	if (not (notebook named nb exists)) then
		log "Creating notebook"
		set nbo to create notebook nb
	else
		log "Notebook already exists"
	end if

	create note from file f notebook nb title n
end tell


end run
