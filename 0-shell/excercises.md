## Ex1:

For this course, you need to be using a Unix shell like Bash or ZSH. If you are on Linux or macOS, you don’t have to do anything special. If you are on Windows, you need to make sure you are not running cmd.exe or PowerShell; you can use Windows Subsystem for Linux or a Linux virtual machine to use Unix-style command-line tools. To make sure you’re running an appropriate shell, you can try the command echo $SHELL. If it says something like /bin/bash or /usr/bin/zsh, that means you’re running the right program.

```console
% echo $SHELL
/bin/zsh
```

## Ex2:

Create a new directory called missing under /tmp.

```console
mkdir missing-semester
cd missing-semester
mkdir 0
```

In my case, I create missing_semester directory to hold all lessons of this course, and create each directory with title is the index for each week lesson and assignments.

## Ex3:

Look up the touch program. The man program is your friend.

```console
man touch
```

## Ex4:

Use touch to create a new file called semester in missing.

```console
touch 0/semester
```

In my case, I create new file called semester in 0 directory

## Ex5:

Write the following into that file, one line at a time:

```console
#!/bin/sh
curl --head --silent https://missing.csail.mit.edu
```

The first line might be tricky to get working. It’s helpful to know that # starts a comment in Bash, and ! has a special meaning even within double-quoted (") strings. Bash treats single-quoted strings (') differently: they will do the trick in this case. See the Bash quoting manual page for more information.

```console
cd 0
echo '#!/bin/sh' >> semester
echo 'curl --head --silent https://missing.csail.mit.edu' >> semester
```

## Ex6:

Try to execute the file, i.e. type the path to the script (./semester) into your shell and press enter. Understand why it doesn’t work by consulting the output of ls (hint: look at the permission bits of the file).

=> The permission of semester file is only `read` & `write`, I cant execute it

## Ex7:

Run the command by explicitly starting the `sh` interpreter, and giving it the file semester as the first argument, i.e. `sh` semester. Why does this work, while `./semester` didn’t?

`sh` command invokes the default shell and uses its syntax and flags.
In this situation, using `sh` command directly asks the kernel (program loader) to run `/bin/sh`, so the permission of the file do not matter at all.

```console
sh semester
```

## Ex8:

Look up the chmod program (e.g. use man chmod).

```console
man chmod
```

## Ex9:

Use `chmod` to make it possible to run the command `./semester `rather than having to type `sh semester`. How does your shell know that the file is supposed to be interpreted using `sh`? See this page on the [shebang](<https://en.wikipedia.org/wiki/Shebang_(Unix)>) line for more information.

```console
chmod +x semester
./semester
```

I also read about `chmod` command in [How to Make Script Executable in Linux | chmod Command](https://www.geeksforgeeks.org/chmod-command-linux/)

## Ex10:

Use `|` and `>` to write the “last modified” date output by `semester` into a file called `last-modified.txt` in your home directory.

```console
ls -l semester.sh | tail -c 22 > last-modified.txt
cat last-modified.txt
```

```console
stat -f %Sm -t %d semester.sh >> last-modified.txt
cat last-modified.txt
```

## Ex11:

Write a command that reads out your laptop battery’s power level or your desktop machine’s CPU temperature from /sys. Note: if you’re a macOS user, your OS doesn’t have sysfs, so you can skip this exercise.

=> I skip this ex because I use macOS
