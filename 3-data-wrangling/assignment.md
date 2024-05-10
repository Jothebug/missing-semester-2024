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
