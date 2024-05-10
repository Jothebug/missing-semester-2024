combinations=$(sed 's/.*\(..\)$/\1/' filtered.txt | sort -u)
echo "Total number of unique two-letter combinations: $(echo "$combinations" | wc -l)"
echo "Combinations that do not occur:"
for c in {a..z}{a..z}; do
    if ! grep -q "$c" <<< "$combinations"; then
        echo "$c"
    fi
done

