/*
I am familiar with this problem, the "Foo Bar" problem.
The idea is usually to start with a for loop, and if statements to log to values, and then maybe add some flexibility to alter the output.
Something like:

for (let i = 1; i <= 100; i++) {
    if (i % 3 === 0 && i % 5 === 0) {console.log("Switch Telecom")}
    else if (i % 3 === 0) {console.log("Switch")}
    else if (i % 5 === 0) {console.log("Telecom")}
    else {console.log(i)}
}

The above loop will give the correct output, but being familiar with the problem I decided to try think of a different way to tackle it.


Looking at the example answer, I noticed that when the number outputs where no matches are found are not relevant.
So I decided to use an object to hold the output values, just focusing on the values that would match.
Now instead of using modulus to check if `i` is a multiple of x, I can use x as an interval to push values into the output object.

I created a function `pushOutput` to add a value at the interval of x between 1 and 100.
Then for the output I used a for loop to go from 1 through to 100. If the output has a key for `i` then the value is logged, otherwise the number `i` is logged.
 */


let output = {}
//Specify outputs at intervals
const NUM_FROM = 1
const NUM_TO = 100
pushOutput(3, "Switch")
pushOutput(5, "Telecom")
pushOutput(15, "Switch Telecom")

logOutput()//Console log the generated output.


function pushOutput(interval, value) {
    for (let i = interval; i <= NUM_TO; i += interval) {
        output[i] = value
    }
}

function logOutput() {
    for (let i = NUM_FROM; i <= NUM_TO; i++) {
        if (output.hasOwnProperty(i)) {
            console.log(output[i]) //Log the value
        }else{
            console.log(i) //No value exists for key `i`, log the number
        }
    }
}