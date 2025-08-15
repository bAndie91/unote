# unote
μNote lightweight note taking and todo app, gtk interface

# Goals

- Dead-simple. Include features only which help productivity.
- no distracting features - let the user focus on the actual task, not on organizing his todo list all the day
- respecting the author's preferences
- mimic old-school paper-and-pen note taking process with the ease of search capability
- "Get Things Done" mindset
- based on plain text files - you can access your notes even without µNote: no vendor-lock
- optimized for keyboard

# Parts

- task list
- task view
- search field
- quicksearch list

# Features

- Notes/Tasks
  - each file is a note
  - files loaded from a base directory recursively (default `~/Notes`, dot-folders ignored)
  - Title is the first line
  - Created Date is file's atime (assuming a filesystem with the popular `noatime` mount option)
  - Updated Date is file's mtime
- Auto Save
  - don't worry about saving often or where to save
  - Software used to make user save his work; it was at a time when saving was an expensive operation 
  and it was not affordable to save, say, after each typed word. 
  But today it's feasible. Not only in programms with web frontend.
  µNote saves the note you're editing in every 5 sec. 
  so if it crashes, only so little effort gets lost.
  - preserves window layout, panel sizes, input fields' content, table columns' order, sort order, cursor position
- Tags
  - any word starting with hashmark in the note's text, eg. `#grocery` is a tag
  - Tag Completion
    - when you're typing a tag in the search box or in the task text, a list of options pops up
    - walk on the list by <kbd>Tab</kbd> and <kbd>Shift-Tab</kbd>, choose one by <kbd>Ctrl-Enter</kbd>
- Note/Task Editor
  - it does not want to be a rich text editor (more like a physical sticky note, but only text input a.t.m.)
  - Text formatting
    - head line is always big font
    - `*bold*` → **bold**
    - `red !!` → <span style="color:red">red !!</span>, `text <!>` → text <span style="color:red">&lt;!&gt;</span> (the line is supposed to be in red for `!!`)
    - \``inline code`\` → `inline code` (markdown-style triple-backtick also works for multiline code block)
    - lines get stroken through when you put some "conclusion marker" at the end, eg:
      - `strike through ✓` → ~~strike through~~ ✓
      - `strike through DONE` → ~~strike through~~ DONE
      - `strike through WONTFIX` → ~~strike through~~ WONTFIX
      - markers: `✓` `✔` `✗` `✘` `DONE` `WONTFIX` `OBSOLETED` `[DONE]` `[WONTFIX]` `[OBSOLETED]`
    - `http://link` → [http://link](http://link) (for any url scheme)
  - `date:YYYY-MM-DD` and `due:YYYY-MM-DD` keywords 
    - entering `date:` or `due:` triggers a calendar widget to show up
    - date and due date are shown in the Task List table
    - interpret date field by any sematics you like, eg. "when this task needs attention the soonest?"
  - Undo stack
    - limited not by the number of steps but by the memory size it takes to store diffs
- Note/Task List
  - order by Title, Date, Due Date, Created Date, or Updated Date
- Search/Filter field
  - search in notes' content
    - narrow search (logical AND) : `#garden #water`
    - negation, everything after "NOT" or "!" are negative keywords: `#house #maintenance NOT #kitchen #bath` meaning "house and maintenance but not kitchen nor bath"
    - union two or more searches (logical OR) : `#garden, #house, #street`
  - smart-case search, i.e. case-insensitive when the complete word is lower-case, otherwise search case-sensitively
  - filters as you type
  - hit Enter to put current search term in history, 
    - recall them with <kbd>Ctrl-P</kbd> and <kbd>Ctrl-Shift-P</kbd>
- Quick Search
  - there is a list of saved search (filter) expressions
  - you can organize it in tree, change order of items
  - select multiple item to search notes which match all the filter expressions (Conjunct Search) 
  or any of them (Union Search)
  - useful to organize tasks in category/project/priority by their respecting tags

# Keybinding

- <kbd>Ctrl-Q</kbd> Quit
- <kbd>Ctrl-F</kbd>, <kbd>Ctrl-L</kbd> Focus on search field
- <kbd>Ctrl-T</kbd> Focus on Task area
- <kbd>Ctrl-S</kbd> Save current search expression to the quick search list
- <kbd>Ctrl-N</kbd> New task
- <kbd>Ctrl-Shift-L</kbd> Change layout
- <kbd>Mod1-Up</kbd>, <kbd>Mod1-Down</kbd> Open prev/next task on the list
- <kbd>Mod1-Left</kbd>, <kbd>Mod1-Right</kbd> Open previously opened task, ie. walk back/forward in the history
- <kbd>Ctrl-P</kbd>, <kbd>Ctrl-Shift-P</kbd> Previous/Next search term

## Editor Keybinding

- <kbd>Ctrl-B</kbd> Bold selected text
- <kbd>Ctrl-Z</kbd> Undo
- <kbd>Ctrl-Shift-Z</kbd>, <kbd>Ctrl-Y</kbd> Redo
- <kbd>Tab</kbd>, <kbd>Shift-Tab</kbd>
  - Indent/deindent selected text
  - Select next/prev suggestion from the auto-completion list (standing on a tag)
- <kbd>Ctrl-Enter</kbd>
  - Open link currently under the cursor
  - Add tag currently under the cursor to the search field
- <kbd>Ctrl-Shift-W</kbd> Wrap text on/off
- <kbd>Mod1-T</kbd> Insert today's date

# Files

See editable property files in `~/.config/unote/prop`. 
You may edit them while unote is not running.

# Dependencies

- python-gtk2 (AKA pygtk)
- python modules
  - xdg
  - dateutil
  - xattr
  - inotifyx (python-inotify support is on branch)

See python2.7 + python3.6 multiport on 'py3' branch. It's unstable yet due to missing GTK+2.0 support.

# Project issues, bugs, feature requests, ideas

1. clone the repo
2. use [git-bug](https://github.com/git-bug/git-bug) to open a new ticket in this repo
3. find one or more person in the commit history to make contact with, then either

   a. send the URL of your git clone to the other contributor(s), via E-mail or other channel, 
   requesting them to pull (`git-bug` issues and/or branches as well) from you.
   This is the preferred way, since it's easier to update your ticket, amend changes, and/or contibute later on.
   
   b. or, if you don't provide your repo's location, send your newly created `git-bug` ticket (or patch if you already propose a code change) via E-mail.
