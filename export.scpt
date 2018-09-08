-- Copyright (c) 2015 Philip Whineray
-- SPDX-License-Identifier:  GPL-3.0-or-later

set backupFolder to (system attribute "HOME") & "/Documents/EvernoteBackups/"

do shell script "open /Applications/Evernote.app"
delay 3

-- Note the controlling shell script should look for "error" in the output
-- since that implies the script has not completed

set startDate to do shell script "date +'%Y-%m-%d %H:%M:%S'"
log "Starting: " & startDate

with timeout of (30 * 60) seconds
tell application "Evernote"
  set allNotebooks to every notebook
  set max to (count of allNotebooks)

  set i to 0
  repeat with currentNoteBook in allNotebooks
    set i to i + 1
    set notebookName to (the name of currentNoteBook)
    set notebookNotes to notes of notebook notebookName
    set c to (count of noteBookNotes)
    set datestamp to (do shell script "date +'%Y-%m-%d_'")
    set exportFilename to do shell script "echo \"" & notebookName & "\"|tr -c 'A-Za-z0-9_. -' '-'|sed s/-$//"
    set exportPath to (backupFolder & exportFilename & ".enex")
    set curTime to do shell script "date +'%H:%M:%S'"
    if c > 0 then
      log curTime & " " & i & " of " & max & ": " & notebookName & " (" & c & ")"
      export notebookNotes to exportPath
    else
      log curTime & " " & i & " of " & max & ": " & notebookName & " (" & c & " - skipped)"
    end if
  end repeat
end tell
end timeout


set endDate to do shell script "date +'%Y-%m-%d %H:%M:%S'"

log "Exported to: " & backupFolder
log "Started: " & startDate
log "Ended: " & endDate
