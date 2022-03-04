import 'package:flutter/material.dart';
import 'package:retos_animaciones/routes/routes.dart';
// import 'package:retos_animaciones/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home_main',
      routes: RoutesApp().getRoutes(),
    );
  }
}