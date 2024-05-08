marco(){
export MARCO_DIR=$(pwd)
echo "The current directory"
}

polo(){
cd "$MARCO_DIR" || return 1
echo "$MARCO_DIR"
}
