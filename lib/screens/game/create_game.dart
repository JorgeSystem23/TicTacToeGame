import 'package:flutter/material.dart';
import 'package:project_tictactoe/resources/socket_methods.dart';
import 'package:project_tictactoe/responsive/responsive.dart';
import 'package:project_tictactoe/widgets/custom_button.dart';
import 'package:project_tictactoe/widgets/custom_text.dart';
import 'package:project_tictactoe/widgets/custom_text_field.dart';

class CreateGame extends StatefulWidget {
  const CreateGame({super.key});

  @override
  State<CreateGame> createState() => _CreateGameState();
}

class _CreateGameState extends State<CreateGame> {
  final TextEditingController _userController = TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void dispose() {
    super.dispose();
    _userController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Responsive(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomText(
                text: 'Crear Sala',
                shadows: [
                  Shadow(
                    blurRadius: 60,
                    color: Colors.blue,
                  )
                ],
                fontSize: 115,
              ),
              SizedBox(
                height: size.height * 0.08,
              ),
              CustomTextField(
                controller: _userController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Ingresa tu usuario',
                ),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              CustomButton(
                onTap: () => _socketMethods.createRoom(_userController.text),
                title: 'Crear',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
