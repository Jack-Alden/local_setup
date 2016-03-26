# local_setup
This is a collection of files related to setting up my machine, for when I need to get a new one and
set up some of the little details the way I like them.

It includes a command line tool for updating the files whenever changes are made.  Why drag and drop
if I can just type pug?

The pug command line tool works by checking if your config files (whichever ones you want to track
and backup) have been updated.  If any have been updated, it will give you a friendly printout of
which ones were updated and which ones weren't.

I keep this repo in my Documents directory, which allows the pug command to work.  If you want to
use the tool but keep this repo somewhere else, just update your .bash_profile to use the necessary
path.  (Replace `<path>` in the following:)  
`alias pug ruby <path>/update_local_setup.rb`