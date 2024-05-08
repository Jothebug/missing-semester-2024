counter=0
output_file="output.txt"
error_file="error.txt"

while bash random.sh &> /dev/null; do
	((counter++))
done

bash random.sh > "$output_file" 2> "$error_file"

echo "Output:"
cat "$output_file"
echo "Error:"
cat "$error_file"
echo "Command failed after $counter runs."

rm "$output_file" "$error_file"
