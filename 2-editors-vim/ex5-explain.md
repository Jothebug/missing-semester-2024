1. Gdd => delete last line, ggdd => delete first line


2. Go to line with <name>
   2.1 qe^r"f>s": "<ESC>f<C"<ESC>q

	qe: Start recording a macro in register e.
	^: Move the cursor to the beginning of the line.
	r": Replace the character under the cursor with "
	f>s": " => Move the cursor to the next occurrence of > => s": " => replace the character after > with "
	f<C" => Move the cursor to the next occurrence of < => C: Delete from the cursor position to the end of the line and insert "
	q: Exits the recording mode.


3. Go to line with <person>
   3.1 qpS{<ESC>j@eA,<ESC>j@ejS},<ESC>q

	S: This deletes the character under the cursor and enters insert mode, adding {
	j: This moves the cursor down one line.
	@e: This executes the macro stored in register e.
	A,: This appends , at the end of the line and exits insert mode using the escape key.
   

   3.2 qq@pjq

	qq: This starts recording a macro and stores it in register q.
	@p: This executes the macro stored in register p.
	j: This moves the cursor down one line.
	q: This stops the recording of the macro.

	=>  If you want to repeat this sequence multiple times, you would need to prefix it with a number, like 3@q to execute it three times.
