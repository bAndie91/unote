# unote
μNote lightweight note taking and todo app, gtk interface

# Goals

- Dead simple. Include features only which significantly helps productivity.
- no distracting features - let the user focus on the actual task, not on organizing his todo list all the day
- created respecting the author's preferences
- mimic old school paper-and-pen note taking process with the ease of search capability
- "Get Things Done" mindset
- based on plain text files - you can access your notes even without µNote; no vendor-lock

# Parts

- task list
- task view
- search field
- quicksearch list

# Features

- Notes
  - each file is a note, 
  - files loaded from a base directory recursively (default `~/Notes`)
- Auto Save
  - don't worry about saving often or where to save
  - it's an old legacy behaviur to make user save his work, at the time when saving was an expensive operation and it was not affordable to save, say, after each typed word. but today it's feasible. µNote saves the note you're editing per 5 sec. so if it crashes only 5 sec effort gets lost.
  - save window layout, panel sizes, input fields' content, table columns' order, sort order, cursor position
- Tags
  - any word starting with hashmark in the note's text, eg. `#grocery` can be used as keyword or tag
  - Tag Completion
    - when you're typing a tag in the search box or in the task text, a list of options pops up
    - walk on the list by <kdb>Tab</kbd> and <kbd>Shift-Tab</kbd>, choose one by <kbd>Ctrl-Enter</kbd>
- Note/Task Editor
  - it does not want to be a rich text editor, more like a physical sticky note
  - Text formatting
    - head line is always big font
    - `*bold*` → *bold*
    - `red !!` → <span color=red>red !!</span>, `text <!>` → text <span color=red>&lt;!&gt;</span>
    - `\`inline code\`` → `inline code` (markdown-style triple-backtick also works for multiline code block)
    - lines get stroken through when you put some "conclusion marker" at the end, eg:
      - `strike through ✓` → ~~strike through~~ ✓
      - `strike through DONE` → ~~strike through~~ DONE
      - `strike through WONTFIX` → ~~strike through~~ WONTFIX
      - markers: `✓` `✔` `✗` `✘` `DONE` `WONTFIX` `OBSOLETED` `[DONE]` `[WONTFIX]` `[OBSOLETED]`
    - `scheme://link` → (scheme://link)[scheme://link] (for any url scheme)
  - `date:YYYY-MM-DD` and `due:YYYY-MM-DD` keywords 
    - trigger a calendar widget to pop up 
    - are shown in the Task List
  - Undo stack
    - limited not by steps but by memory size of steps' diff
- Note/Task List
  - order by Date, Due Date, or Updated Date
- Search/Filter field
  - search in notes' content
    - narrow search (logical AND) : `#garden #water`
    - negation, everything after "NOT" or "!" are negative keywords: `#house #maintenance NOT #kitchen #bath` meaning "house and maintenance but not kitchen nor bath"
    - union two or more searches (logical OR) : `#garden, #house, #street`
  - filter as you type
- Quick Search
  - there is a list of saved search (filter) expressions
  - you can organize it in tree, change order
  - useful to organize tasks in category/project/priority by their respecting tags

# Keybinding

- <kdb>Ctrl-Q</kbd> Quit
- <kdb>Ctrl-F</kbd>, <kdb>Ctrl-L</kbd> Focus on search field
- <kdb>Ctrl-T</kbd> Focus on Task area
- <kdb>Ctrl-S</kbd> Save current search expression to the quick search list
- <kdb>Ctrl-N</kbd> New task
- <kdb>Ctrl-Shift-L</kbd> Change layout
- <kdb>Ctrl-Shift-W</kbd> Wrap text on/off
- <kdb>Mod1-Up</kbd>, <kdb>Mod1-Down</kbd> Open prev/next task on the list
- <kdb>Mod1-Left</kbd>, <kdb>Mod1-Right</kbd> Open previously opened task, ie. walk back/forward in the history

## Editor Keybinding

- <kdb>Ctrl-B</kbd> Bold selected text
- <kbd>Ctrl-Z</kbd> Undo
- <kbd>Ctrl-Shift-Z</kbd>, <kbd>Ctrl-Y</kbd> Redo
- <kdb>Tab</kbd>, <kbd>Shift-Tab</kbd>
  - Indent/deindent selected text
  - Select next/prev suggestion from the auto-completion list (standing on a tag)
- <kbd>Ctrl-Enter</kbd>
  - Open link currently under the cursor
  - Add tag currently under the cursor to the search field
