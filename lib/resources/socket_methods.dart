import 'package:flutter/material.dart';
import 'package:project_tictactoe/resources/socket_client.dart';

class SocketMethods {
  final _socketClient = SocketClient.instance.socket!;

  void createRoom(String nickName) {
    if (nickName.isNotEmpty) {
      _socketClient.emit(
        'createRoom',
        {
          'nickName': nickName,
        },
      );
    }
  }

  void createRoomSuccessListener(BuildContext context) {
    _socketClient.on(
      'createRoom',
      (room) {
        print(room);
        Navigator.pushNamed(
          context,
          '/game',
        );
      },
    );
  }
}
