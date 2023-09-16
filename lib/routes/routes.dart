import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project_tictactoe/screens/game/game_init.dart';
import 'package:project_tictactoe/screens/game/join_game.dart';
import 'package:project_tictactoe/screens/login.dart';
import 'package:project_tictactoe/screens/menu_screen.dart';

class Routes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    if (kDebugMode) {
      print(settings.name);
    }

    Widget page;

    switch (settings.name) {
      case '/':
        page = const Login();
        break;
      case '/menu':
        page = const MenuScreen();
        break;
      case '/pass':
        page = Container();
        break;
      case '/game':
        page = const GameInit();
        break;
      case '/join':
        page = const JoinGame();
        break;
      default:
        page = const Scaffold(
          body: Center(
            child: Text(
              'No se encontro la pagina que quiere navegar!!',
            ),
          ),
        );
    }
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => page,
    );
  }
}
