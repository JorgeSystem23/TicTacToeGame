import 'package:flutter/material.dart';
import 'package:project_tictactoe/resources/socket_methods.dart';
import 'package:project_tictactoe/responsive/responsive.dart';
import 'package:project_tictactoe/widgets/custom_button.dart';
import 'package:project_tictactoe/widgets/custom_text.dart';
import 'package:project_tictactoe/widgets/custom_text_field.dart';

class CreateRoomScreen extends StatefulWidget {
  const CreateRoomScreen({Key? key}) : super(key: key);

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  final TextEditingController _nameController = TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethods.createRoomSuccessListener(context);
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
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
                shadows: [
                  Shadow(
                    blurRadius: 40,
                    color: Colors.blue,
                  ),
                ],
                text: 'Create Room',
                fontSize: 70,
              ),
              SizedBox(height: size.height * 0.08),
              CustomTextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                hintText: 'Enter your nickname',
                ),
              ),
              SizedBox(height: size.height * 0.045),
              CustomButton(
                  onTap: () => _socketMethods.createRoom(
                        _nameController.text,
                      ),
                  title: 'Create'),
            ],
          ),
        ),
      ),
    );
  }
}