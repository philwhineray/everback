-- Copyright (c) 2015 Philip Whineray
-- SPDX-License-Identifier:  GPL-3.0-or-later
--
-- Run as:
--    osascript listnotebooks.scpt

do shell script "open /Applications/Evernote.app"
delay 3

tell application "Evernote"
  set allNotebooks to every notebook

  set max to (count of allNotebooks)

  set i to 1
  repeat with currentNoteBook in allNotebooks
    set notebookName to (the name of currentNoteBook)
    log "" & i & " of " & max & ": " & notebookName
    set i to i + 1
  end repeat
end tell
