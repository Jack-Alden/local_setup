# ConfigNewton
## What is it?
ConfigNewton backs up the files you need to get up and running quickly on a new
machine or after a fresh OS install.

## Why was it invented?
Every once in a while, I get bogged down by the clutter that accumulates on my
computer, so I nuke it and start of with a fresh OS install.  Other times, I just
want to work on a different machine but don't want to lose all the pretty colors
and preferences I've set on my terminal and text editor.  So I decided that to
alleviate that pain it would make sense to back files up, however, it can be
tedious to find where they are, if they were updated or not, etc. That led to
<b>ConfigNewton</b>, a lightweight backup system that uploads to Github for easy
access to all of my typical config files.

## Usage
1. Clone this repo to your `Documents` directory (You can choose a different directory,
but you'll need to update `lib/classes/localSetting.rb` accordingly)
2. Update the `USERNAME` variable in `confignewton/bin/run.rb`
3. Create an array for each of the files you wish to have backups for.  (iTerm settings,
text editor preferences, etc.)  Do this in `confignewton/lib/modules/configList.rb`
under the `@config_list` instance variable.  There is a comment with an example
of how to construct each array.
4. Run the following from within your Documents directory whenever you want to backup
your files, or load your backups onto your machine.
    ruby ConfigNewton/confignewton/bin/run.rb
5. You will be asked a few questions about specific files, and <b>ConfigNewton</b>
will perform actions accordingly.  Make a `commit` with your changes, `push` it to your
remote, and rest easy knowing you can start up a fresh machine without losing your
beautiful settings.

## To Do
I'd still like to add a few features to <b>ConfigNewton</b>, including:
1. Add files to local machine if not present
2. Create backups for files not backed up yet

## Contributions
I am open to suggestions on how to improve <b>ConfigNewton</b>, just let me know
if you see anything that could be done better.  Thanks!