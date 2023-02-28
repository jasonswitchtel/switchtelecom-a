let output = {}
pushOutput(3, "Switch")
pushOutput(5, "Telecom")
logOutput()

function pushOutput(interval, value) {
    for (let i = interval; i <= 100; i += interval) {
        if (output.hasOwnProperty(i)) {
            output[i] += " " + value
        }else{
            output[i] = value
        }
    }
}

function logOutput() {
    for (let i = 1; i <= 100; i++) {
        if (output.hasOwnProperty(i)) {
            console.log(output[i])
        }else{
            console.log(i)
        }
    }
}