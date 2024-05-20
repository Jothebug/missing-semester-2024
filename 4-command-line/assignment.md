## Job control

### Ex1:

From what we have seen, we can use some `ps aux | grep` commands to get our jobs’ pids and then kill them, but there are better ways to do it. Start a `sleep 10000` job in a terminal, background it with `Ctrl-Z` and continue its execution with `bg`. Now use `pgrep` to find its pid and `pkill` to kill it without ever typing the pid itself. (Hint: use the `-af` flags).

```
sleep 10000
Ctrl-Z
bg

- find the pid of process
pgrep -af "sleep 10000"

- kill it withour ever typing the pid itself
pkill -af "sleep 10000"
```

### Ex2:

Say you don’t want to start a process until another completes. How would you go about it? In this exercise, our limiting process will always be `sleep 60 &`. One way to achieve this is to use the `wait` command. Try launching the sleep command and having an `ls` wait until the background process finishes.

However, this strategy will fail if we start in a different bash session, since `wait` only works for child processes. One feature we did not discuss in the notes is that the `kill` command’s exit status will be zero on success and nonzero otherwise. `kill -0` does not send a signal but will give a nonzero exit status if the process does not exist. Write a bash function called `pidwait` that takes a pid and waits until the given process completes. You should use `sleep` to avoid wasting CPU unnecessarily.

```
#file pidwait.sh

pidwait() {
    local pid=$1
    while kill -0 "$pid" 2>/dev/null; do
        sleep 1
    done
}

# Launch sleep command in the background
sleep 60 &
sleep_pid=$!

# Wait for the sleep process to complete
sh pidwait.sh $sleep_pid

# Execute ls command after the sleep process completes
ls
```

## Terminal multiplexer

### Ex1:

Follow this tmux tutorial and then learn how to do some basic customizations following these steps.

```
I use iterm2
```

## Aliases

### Ex1:

Create an alias dc that resolves to cd for when you type it wrongly.

```
alias dc=cd
```

### Ex2:

Run `history | awk '{$1="";print substr($0,2)}' | sort | uniq -c | sort -n | tail -n 10` to get your top 10 most used commands and consider writing shorter aliases for them. Note: this works for Bash; if you’re using ZSH, use `history 1` instead of just `history`.
