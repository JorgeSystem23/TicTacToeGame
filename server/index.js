//importing modules
const express = require("express");
const http = require("http");
const  mongoose  = require("mongoose");

const app = express();
const port = process.env.PORT || 3000;
var server = http.createServer(app);
var io = require("socket.io")(server);

//client -> middlewar -> server
//middle war
app.use(express.json());

var DB = "mongodb+srv://prosystem155:System_Jorge20@cluster0.qrye0bw.mongodb.net/";

io.on("connection", (socket) => {
    console.log("connected!");
    socket.on("createRoom", ({ nickName }) => { console.log(nickName); });
});

//PROMISE in JS = Future in Dart
mongoose.connect(DB).then(() => {
    console.log('Connection Successful!!');
}).catch(() => {
    console.log(e);
});

server.listen(port, '0.0.0.0', function () {
    console.log('Server started and running in the port ' + port);
},);