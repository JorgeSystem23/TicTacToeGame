import 'package:flutter/material.dart';
import 'package:project_tictactoe/responsive/responsive.dart';
import 'package:project_tictactoe/widgets/custom_button.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
      ),
      body: Responsive(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              onTap: () => createRoom(context),
              title: 'Crear partida',
            ),
            const SizedBox(
              height: 25,
            ),
            CustomButton(
              onTap: () => joinRoom(context),
              title: 'Unirse a partida',
            ),
          ],
        ),
      ),
    );
  }
}

void createRoom(BuildContext context) {
  Navigator.pushNamed(
    context,
    '/game',
  );
}

void joinRoom(BuildContext context) {
  Navigator.pushNamed(
    context,
    '/join',
  );
}
