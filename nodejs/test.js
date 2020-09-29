var hello = 'Hello from Node JS Variable!'
console.log (`Printing variable hello: ${hello}`);

console.log("Directory name: " + __dirname);
console.log("Directory and file name: " + __filename);

var path = require("path");
console.log("Using PATH module:");
console.log(`Hello from file ${path.basename(__filename)}`);

console.log(`Process args: ${process.argv[2]}`)