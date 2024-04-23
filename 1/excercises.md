## Ex1:

Read `man ls` and write an ls command that lists files in the following manner

Includes all files, including hidden files
Sizes are listed in human readable format (e.g. 454M instead of 454279954)
Files are ordered by recency
Output is colorized

A sample output would look like this

```-rw-r--r-- 1 user group 1.1M Jan 14 09:53 baz
 drwxr-xr-x   5 user group  160 Jan 14 09:53 .
 -rw-r--r--   1 user group  514 Jan 14 06:42 bar
 -rw-r--r--   1 user group 106M Jan 13 12:12 foo
 drwx------+ 47 user group 1.5K Jan 12 18:08 ..
```

```console
ls -lahtG

### result:
-rw-r--r--  1 user  staff   1.4K Apr 21 16:45 excercises.md
drwxr-xr-x  4 user  staff   128B Apr 21 16:44 .
drwxr-xr-x  7 user  staff   224B Apr 21 16:36 ..
-rw-r--r--@ 1 user  staff    49B Apr  2 18:32 playground.txt
### explain:
-a: includes all files,including hidden files
-h: sizes are listed in human readable format
-t: files are ordered by recency
-G: output is colorized (macOS)
```

## Ex2:

Write bash functions `marco` and `polo` that do the following:
Whenever you execute `marco` the current working directory should be saved in some manner, then when you execute `polo`, no matter what directory you are in, `polo` should `cd` you back to the directory where you executed `marco`. For ease of debugging you can write the code in a file `marco.sh` and (re)load the definitions to your shell by executing `source marco.sh`.

```
vim marco
<!-- create & edit marco file -->

#!/bin/bash

marco() {
     export MARCO_DIR=$(pwd)
}
polo() {
     cd "$MARCO_DIR" || return 1
}
```

## Ex3:

Say you have a command that fails rarely. In order to debug it you need to capture its output but it can be time consuming to get a failure run. Write a bash script that runs the following script until it fails and captures its standard output and error streams to files and prints everything at the end. Bonus points if you can also report how many runs it took for the script to fail.

```
 #!/usr/bin/env bash

 n=$(( RANDOM % 100 ))

 if [[ n -eq 42 ]]; then
    echo "Something went wrong"
    >&2 echo "The error was using magic numbers"
    exit 1
 fi

 echo "Everything went according to plan"
```

```console
solveEx3.sh

counter=0
<!-- variable for counting runs  -->
stdout="output.txt"
<!-- for capturing standard output -->
stderr="error.txt"
<!-- for capturing standard error -->

<!-- looping until the script failed. I save the given script in random.sh -->
<!-- &> /dev/null is used to redirect both stdout and stderrof to the null device /dev/null which is a special device file on Unix-like operating systems that discards any data written to it -->
while bash random.sh &> /dev/null; do
	((counter++))
done

<!-- capturing result both output and errors -->
bash random.sh > "$stdout" 2> "$stderr"

<!-- print out result -->
echo "Output:"
cat "$stdout"
echo "Error:"
cat "$stderr"
echo "Command failed after $counter runs."

<!-- clean up -->
rm "$stdout" "$stderr"
```
