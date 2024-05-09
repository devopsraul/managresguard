import 'package:flutter/material.dart';
import 'screens/home_screen.dart'; // Asegúrate de ajustar la ruta si es necesario

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'ResGuard App',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
