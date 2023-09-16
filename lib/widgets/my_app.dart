import 'package:flutter/material.dart';
import 'package:project_tictactoe/routes/routes.dart';
import 'package:project_tictactoe/utils/design.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tic Tac Toe Game',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgcolor,
      ),
      initialRoute: '/',
      onGenerateRoute: Routes.onGenerateRoute,
      routes: const {},
    );
  }
}
