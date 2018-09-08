# Everback

Here is a simple script I use to export my data from Evernote Mac,
to ensure I have a backup of my data.

With the current situation at Evernote, I figure there might be people
trying to work out what their options are, hence I am publishing it.

Exports are in `.enex` format, which I believe some other tools and
services import.

There's also a couple of bonus AppleScripts for those interested in
Evernote automation.


# Running

Evernote will be started automatically if it is not already running
(and sometimes takes too long, causing a timeout, in which case just
re-run the script and it should be OK eventually).

To dump all your notebooks:

~~~~
./everback
cat $HOME/Documents/EvernoteBackups/backup.log
ls $HOME/Documents/EvernoteBackups/*.enex
~~~~

There aren't any options, everything is hardcoded. If you add some
flexibility or functionality, please send a [PR](#contributing) so others
can benefit.


# Support

I'm not able to offer any practical usage support, on Mac or any other
platform, but I hope people find this useful and are able to help each
other out with github issues.


# Contributing

I will accept any Pull Requests that come with a decent commit message
and don't look like they break anything fundamental.

See COPYING for the full terms of the GPL v3+ under which these sources
are licensed. Individual files contain the following tag instead of the
full text:

~~~~
SPDX-License-Identifier:  GPL-3.0-or-later
~~~~

This enables machine processing based on the SPDX License Identifiers
that are available here: https://spdx.org/licenses
