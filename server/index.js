//importing modules
const express = require("express");
const http = require("http");

const app = express();
const port = process.env.PORT || 3000;
var server = http.createServer(app);
var io = require("socket.io")(server);

//client -> middlewar -> server
//middle war
app.use(express.json());

server.listen(port, '0.0.0.0', function () {
    console.log('Server started and running in the port ' + port);
},);