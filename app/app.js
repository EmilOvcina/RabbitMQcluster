var express = require("express");
var path = require("path");
const { Worker } = require('worker_threads');
var app = express();

var rapidriver = require("@ovcina/rapidriver");

const host = 'amqp://' + process.env.RABBIT_USERNAME + ":" + process.env.RABBIT_PASSWORD + "@" + process.env.RABBIT_HOST + ":" + process.env.RABBIT_PORT + "/";

var worker = new Worker(path.join(__dirname + "/rapid-listener.js"));

app.post("/:event/:string", (req, res) => {
    rapidriver.publish(host, req.params.event, {message: req.params.string});

    //All these must be true before responding 
    const flags = {auth: false}

    //The object which will be the response
    var finalResult = {};
    
    //Defines the procedure every time we get a message from the river
    const callback = (data) => {
        var result = data.message; //JSON.parse(data.message);
        if(data.type == "pong") { // if the message is of type 'auth'
            flags.auth = true;
            finalResult = result;
        } 
        if (Object.values(flags).every(item => item === true)) {
            res.send(finalResult);
            worker.removeListener("message", callback);
        }
    }
    worker.on("message", callback);
});


app.get("/", (req, res) => {
    res.send(JSON.stringify({test :"works again!"}));
})

app.listen(3000);