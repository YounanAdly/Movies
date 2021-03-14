import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'file:///D:/Android/Flutter/learn_api/lib/ui/home_screen.dart';
import 'package:provider/provider.dart';

import 'backend/backend.dart';

void main() {
  final backend = Backend('https://api.themoviedb.org/3/movie');
  runApp(
      Provider.value(
        value: backend,
          child: MyApp(backend: backend)
      ));
}

class MyApp extends StatelessWidget {
  final Backend backend;

  const MyApp({
    @required this.backend,
  }) : assert(backend != null);

  @override
  Widget build(BuildContext context) {
    const MaterialColor color = MaterialColor(
      0xFF221B32,
      <int, Color>{
        50: Color(0xFF162A49),
        100: Color(0xFF162A49),
        200: Color(0xFF162A49),
        300: Color(0xFF162A49),
        400: Color(0xFF162A49),
        500: Color(0xFF162A49),
        600: Color(0xFF162A49),
        700: Color(0xFF162A49),
        800: Color(0xFF162A49),
        900: Color(0xFF162A49),
      },
    );
    timeDilation = 1.5;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: color,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen());
  }
}
