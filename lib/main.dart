import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const SupportApp());
}

class SupportApp extends StatelessWidget {
  const SupportApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Support App",
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.pink,
      ),

      home: const HomeScreen(),
    );
  }
}