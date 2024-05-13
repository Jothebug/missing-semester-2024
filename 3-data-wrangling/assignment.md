### Ex2

Find the number of words (in `/usr/share/dict/words`) that contain at least three `a`s and don’t have a `'s` ending. What are the three most common last two letters of those words? `sed`’s `y` command, or the `tr` program, may help you with case insensitivity. How many of those two-letter combinations are there? And for a challenge: which combinations do not occur?

```
1. Find the number of words that contain at least three `a`s and don't have a `'s` ending.
- cat /usr/share/dict/words | grep -iE '^([^s]*a){3,}' | grep -vE 's$'| tr '[:upper:]' '[:lower:]' > filtered.txt

explanation:
+ grep -iE: search text patterns in files (-i: ignore case distinctions, -E: interpret the pattern as an extended regualr expression)
+ grep -vE 's$': This filters out words ending with 's'.
+ tr '[:upper:]' '[:lower:]': This converts all uppercase letters to lowercase.

After running the command, you have a words.txt file contains all the words that satisfy the conditions

2. What are the three most common last two letters of those word
- sed 's/.*\(..\)$/\1/' filtered_words.txt | sort | uniq -c | sort -nr | head -n 3

explanation:
+ sed 's/.*\(..\)$/\1/': This extracts the last two letters of each word.
+ sort | uniq -c | sort -nr: This counts the occurrences of each unique combination and sorts them in descending order.
+ head -n 3: This selects the top three combinations.

3. How many of those two-letter combinations are there.Which combinations do not occur.
- vim combinations

bash sript:

combinations=$(sed 's/.*\(..\)$/\1/' filtered.txt | sort -u)
echo "Total number of unique two-letter combinations: $(echo "$combinations" | wc -l)"
echo "Combinations that do not occur:"
for c in {a..z}{a..z}; do
    if ! grep -q "$c" <<< "$combinations"; then
        echo "$c"
    fi
done

explanation:

+ sort -u: This sorts and removes duplicates, giving us the unique combinations.
+ echo "$combinations" | wc -l: This counts the number of unique combinations.
+ The loop iterates over all possible two-letter combinations (aa, ab, ac, ..., zz) and checks if each exists in the list of unique combinations. If not, it prints that combination.

sh combinations to run command
```

### Ex3

To do in-place substitution it is quite tempting to do something like `sed s/REGEX/SUBSTITUTION/ input.txt > input.txt`. However this is a bad idea, why? Is this particular to `sed`? Use` man sed` to find out how to accomplish this.

```
subtitution command:
-  sed -i 's/REGEX/SUBSTITUTION/' input.txt

explanation:
-  > command => for redirecting the standard output of a command to a file. It will create the file if it does not exist, or truncate it to zero length if it does exist. In this case the shell first truncates input.txt to zero bytes before `sed` starts reading it
- By the time `sed` processes, the file is empty. Therefore, the output redirection (> input.txt) simply writes nothing to the file.
- To handle this issue, using sed -i to perform an in-place subtitution the file.
```

### Ex4:

Find your average, median, and max system boot time over the last ten boots. Use `journalctl` on Linux and `log show` on macOS, and look for log timestamps near the beginning and end of each boot.

```
log show | grep -E "=== system boot:| Previous shutdown cause: 5" | tail -n 10 > bootlog.txt

When using the command above to get the last ten system boots, there are no the boot time logs of each boot, so I can't calculate according to the requirements.
```

### Ex5:

Skipped

### Ex6:

Find an online data set like this one, this one, or maybe one from here. Fetch it using `curl` and extract out just two columns of numerical data. If you’re fetching HTML data, `pup` might be helpful. For JSON data, try `jq`. Find the min and max of one column in a single command, and the difference of the sum of each column in another.

```
Dataset URL: https://github.com/datasets/glacier-mass-balance/blob/main/data/glaciers.csv?plain=1

1. Fetch data using `curl`:
curl -o glaciers-raw.csv https://raw.githubusercontent.com/datasets/glacier-mass-balance/main/data/glaciers.csv
tail -n +3 glaciers-raw.csv > glaciers.csv

explanation:
- curl -o glaciers-raw.csv: fetch data from URL and save in glaciers-raw.csv file.
- tail -n +3 glaciers-raw.csv > glaciers.csv: outputs all the lines starting from the third line, and redirects the output to a new file named glaciers.csv

2. Extract two coloumns of numerical data
awk -F ',' '{print $2 "," $3}' glaciers.csv > numerical-glaciers.csv

explanation:
- awk -F ',' '{print $2 "," $3}: use awk to extract the second and third columns, and then redirect the output to numerical-glaciers.csv

3. Find the min/max of the first column in numerical-glaciers.csv
awk -F ',' '{print $1}' numerical-glaciers.csv | sort -n | awk 'NR==1 {min=$1} END {print "Min:", min}'; awk -F ',' '{print $1}' numerical-glaciers.csv | sort -n | tail -n 1 | awk '{print "Max:", $1}'

=> result: Min: -28.652, Max: -1.13

explanation:
- sort -n: sorts the input numerically
- awk 'NR==1 {min=$1} END {print "Min:", min}':
       + NR==1 {min=$1}: check if the current line (NR) === 1, which means it's processing the first line of the sorted list. If it is, it assigns the value of the first field (`$1`) to the variable `min`

       + END {print "Min:", min}: after all processing ended, it prints "Min":

- awk -F ',' '{print $1}' numerical-glaciers.csv | sort -n | tail -n 1 | awk '{print "Max:", $1}': because it sorts the numerical values in ascending order, `tail -n 1` will extracr the last line of the sorted output, which corresponds to the max value.

4. The difference of the sum of each column in another.
awk -F ',' '{sum1+=$1; sum2+=$2} END {print "Difference of sum:", sum1-sum2}' numerical-glaciers.csv

=> result: Difference of sum: -2813.95

explanation:
- {sum1+=$1; sum2+=$2}: sum1 and sum2 are variables that accumulate the sums of the values in the first and second columns, respectively.
```
