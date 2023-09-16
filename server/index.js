//importing modules
const express = require("express");
const http = require("http");
const mongoose = require("mongoose");

const app = express();
const port = process.env.PORT || 3000;
var server = http.createServer(app);
const Room = require("./models/room");
var io = require("socket.io")(server);

//client -> middlewar -> server
//middle war
app.use(express.json());

var DB = "mongodb+srv://prosystem155:System_Jorge20@cluster0.qrye0bw.mongodb.net/";

io.on("connection", (socket) => {
    console.log("connected!");
    socket.on("createRoom", async ({ nickName }) => {
        console.log(nickName);
        console.log(socket.id);
        /**
         * room is created
         * player is stored in the room
         * player is taken to the next screen
         */
        try {
            let room = new Room();

            let player = {
                socketID: socket.id,
                nickName,
                playerType: 'X',
            };

            room.players.push(player);
            room.turn = player;

            room = await room.save();
            console.log(room);

            const roomId = room._id.toString();
            socket.join(roomId);

            io.to(roomId).emit('createRoomSuccess', room);

        } catch (e) { console.log(e); }

    });
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