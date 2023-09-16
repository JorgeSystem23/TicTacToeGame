import 'package:flutter/material.dart';
import 'package:project_tictactoe/responsive/responsive.dart';
import 'package:project_tictactoe/widgets/custom_button.dart';
import 'package:project_tictactoe/widgets/custom_text_field.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  /*late String _email;
  late String _password;
  final bool _saving = false;*/

  @override
  void dispose() {
    super.dispose();
    _userController.dispose();
    _passController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamed(
          context,
          '/menu',
        );
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        backgroundColor: Colors.white,
        body: Responsive(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(
                  10,
                ),
                child: CustomTextField(
                  controller: _userController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Ingresa tu email',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(
                  10,
                ),
                child: CustomTextField(
                  controller: _passController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Ingresa tu password',
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/pass',
                  );
                },
                child: const Text(
                  '¿Has olvidado tu contraseña?',
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              CustomButton(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/menu',
                  );
                },
                title: 'Iniciar Sesion',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
