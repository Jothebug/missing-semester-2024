const { argv } = require('node:process');

function fizz_buzz(limit) {
  for (let i = 0; i <= limit; i++) {
    if (i % 3 === 0) {
      console.log("fizz");
    }
    if (i % 5 === 0) {
      console.log("buzz");
    }
    if (i % 3 && i % 5) {
      console.log(i);
    }
  }
}

function main() {
  fizz_buzz(argv[2])
}

main()
