import 'package:flutter/material.dart';
import 'package:eco_avanzado/pantallas/sueldo.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 81, 147, 81),
                Color.fromARGB(200, 17, 31, 17),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Scaffold(backgroundColor: Colors.transparent, body: child),
        );
      },
      home: const sueldoPantalla(),
    );
  }
}
