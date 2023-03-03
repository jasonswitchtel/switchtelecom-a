/* Please refer to notes in readme.md */


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