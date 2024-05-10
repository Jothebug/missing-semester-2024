### Ex2:

Find the number of words (in `/usr/share/dict/words`) that contain at least three `a`s and don’t have a `'s` ending. What are the three most common last two letters of those words? `sed`’s `y` command, or the `tr` program, may help you with case insensitivity. How many of those two-letter combinations are there? And for a challenge: which combinations do not occur?

```
1. Find the number of words that contain at least three `a`s and don't have a `'s` ending.
   - cat /usr/share/dict/words | grep -iE '^([^s]*a){3,}' > a-words.txt

grep -iE: search text patterns in files (-i: ignore case distinctions, -E: interpret the pattern as an extended regualr expression)

After running the command, you have a words.txt file contains all the words that satisfy the conditions 

2. What are the three most common last two letters of those words

3. How many of those two-letter combinations are there
4. Which combinations do not occur

grep -iE '^([^s]*a){3,}' /usr/share/dict/words | sed -E 's/.*(..)$/\1/' | tr '[:upper:]' '[:lower:]' | sort | uniq > combinations.txt

echo "Total unique two-letter combinations: $(wc -l < combinations.txt)"
echo "Combinations that do not occur:"
comm -23 <(echo {a..z}{a..z} | tr ' ' '\n') combinations.txt
```
