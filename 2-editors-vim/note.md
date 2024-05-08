SEARCH COMMAND
1. press / or ? (for the backward direction) *type search content*
2. press n to search for the same phrase
3. press N to search for the same phrase in the opposite direction

MATCHING PARENTHESE SEARCH
1. press % to find matching for: ),},]

SUBSTITUTE COMMAND
1. :s/old/new/g (gc) to substitute new for old. g flag means to replace globally. gc flag means to find every occurence in the file, with a prompt whether to replace or not

2. :#,#s/old/new/g: where #,# are the line numbers of the range of lines where the substitution is to be done

EXECUTE AN EXTERNAL COMMAND
1. :! followed by an external command to execute that command
2. :!dir  :!ls -  show  all the files in directory
3. :!rm [file name] - remove file [file name]

WRITING FILES
1. :w [file name] => writes the current Vim file to dish with name [file name]
2. v montion :w [file name] saves the selected lines in the file
3. To remove the file => :!rm [file name] || :!del [file name]

VISUAL SELECTION
1. press v in Normal mode => move the cursor around to make the selection bigger or smaller

READING, RETRIEVING AND MERGING FILES
1. :r [file name]
2. :r !dir  reads the output of the dir command and puts it below the
      cursor position.

OPEN COMMAND
1. o => open a line below and place you in Insert mode
2. O => open a line above the cursor
3. e => moving character each word

TO REPLACE
1. R => replace more than one character

COPY AND PASTE
1. y => copy text (yank)
   yw => copy one word
   yy => copy the whole line
2. p => paste

SET OPTIONS
1. :set [option]
   ic: ignore upper/lower case when searching
   is: incsearch - show partial matches for a search phrase
   hls: hlsearch - highlight all matching phases
2. :set no [option]: to switch an option off: 



