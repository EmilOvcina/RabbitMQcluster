var rapidriver = require("@ovcina/rapidriver");
const { parentPort } = require('worker_threads');

const host = 'amqp://' + process.env.RABBIT_USERNAME + ":" + process.env.RABBIT_PASSWORD + "@" + process.env.RABBIT_HOST + ":" + process.env.RABBIT_PORT + "/";

rapidriver.subscribe(host, [
    {river: "gateway", event: "pong", work: (msg) => {
        console.log(" [x] received: %s", msg);  
        parentPort.postMessage({type: "pong", message: msg});  
    }}
]);