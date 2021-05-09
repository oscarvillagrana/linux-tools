# VIM Editor Modes

Vim is an editor to create or edit a text file. There are two modes in vim. One is the command mode and another is the insert mode. In the command mode, user can move around the file, delete text, etc. In the insert mode, user can insert text. Changing mode from one to another. From command mode to insert mode type a/A/i/I/o/O ( see details below). From insert mode to command mode type Esc (escape key)

# Useful Commands

### Text Entry Commands (Used to start text entry)

a 		Append text following current cursor position
A 		Append text to the end of current line
i 		Insert text before the current cursor position
I 		Insert text at the beginning of the cursor line
o 		Open up a new line following the current line and add text there
O 		Open up a new line in front of the current line and add text there

### Commands Mode
The following commands are used only in the commands mode.

### Screen Movement

To move the cursor to a line within your current screen use the following keys:

H		moves the cursor to the top line of the screen.
M		moves the cursor to the middle line of the screen.
L		moves the cursor to the last line of the screen.

To scroll through the file and see other screens use:

ctrl-f	scrolls down one screen
ctrl-b	scrolls up one screen
ctrl-u	scrolls up a half a screen
ctrl-d	scrolls down a half a screen

### Moving by Searching

:/ 		pattern Search forward for the pattern

### Cursor Movement Commands

h 		Moves the cursor one character to the left
l 		Moves the cursor one character to the right
k 		Moves the cursor up one line
j 		Moves the cursor down one line
nG or :n Cursor goes to the specified (n) line
(ex. 10G goes to line 10)
^F 		(CTRl F) Forward screenful
^B 		Backward screenful
^f 		One page forward
^b 		One page backward
^U 		Up half screenful
^D 		Down half screenful
$ 		Move cursor to the end of current line
0 		(zero) Move cursor to the beginning of current line
w 		Forward one word
b 		Backward one word

Pasting Text using Put

Often, when you delete or cut text, you may wish to reinsert it in another location of the document. The Put command will paste in the last portion of text that was deleted since deleted text is stored in a buffer. To use this command, place the cursor where you wish the deleted text to appear. Then use p to reinsert the text. If you are inserting a line or paragraph use the lower case p to insert on the line below the cursor or upper case P to place in on the line above the cursor.

Copying Text with Yank

If you wish to make a duplicate copy of existing text, you may use the yank and put commands to accomplish this function. Yank copies the selected text into a buffer and holds it until another yank or deletion occurs. Yank is usually used in combination with a word or line object such as the ones shown below:


yw		copies a word into a buffer (7yw copies 7 words)
yy		copies a line into a buffer (3yy will copy 3 lines)


### Exit Commands

:wq 	Write file to disk and quit the editor
:q! 	Quit (no warning)
:q 		Quit (a warning is printed if a modified file has not been saved)
ZZ 		Save workspace and quit the editor (same as :wq)

: 10,25 w temp
write lines 10 through 25 into file named temp. Of course, other line
numbers can be used. (Use :f to find out the line numbers you want.

### Text Deletion Commands

x 		Delete character
dw 		Delete word from cursor on
db 		Delete word backward
dd 		Delete line
d$ 		Delete to end of line
d^ 		(d caret, not CTRL d) Delete to beginning of line
Yank 	(has most of the options of delete)-- VI's copy commmand
yy 		yank current line
y$ 		yank to end of current line from cursor
yw 		yank from cursor to end of current word
5yy 	yank, for example, 5 lines

Paste 	(used after delete or yank to recover lines.)
p 		paste below cursor
P 		paste above cursor
"2p paste from buffer 2 (there are 9)
u 		Undo last change
U 		Restore line
J 		Join next line down to the end of the current line

### File Manipulation Commands

:w 		Write workspace to original file
:w 		file Write workspace to named file
:e 		file Start editing a new file
:r 		file Read contents of a file to the workspace

To create a page break, while in the insert mode, press the CTRL key
And l. ^L will appear in your text and will cause the printer to start
A new page.

### Other Useful Commands
Most commands can be repeated n times by typing a number, n, before
the command. For example 10dd means delete 10 lines.

. 		Repeat last command
cw 		Change current word to a new word
r 		Replace one character at the cursor position
R 		Begin overstrike or replace mode � use ESC key to exit
:/ 		pattern Search forward for the pattern
:? 		pattern Search backward for the pattern
n 		(used after either of the 2 search commands above to
continue to find next occurrence of the pattern.
:g/pat1/s//pat2/g replace every occurrence of pattern1 (pat1) with
pat2

Example :g/tIO/s//Ada.Text_IO/g
This will find and replace tIO by Ada.text_IO everywhere in the file.
:g/a/s// /g replace the letter a, by blank
:g/a/s///g replace a by nothing
note: Even this command be undone by u