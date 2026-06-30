import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const SimplePaymentApp());
}

class SimplePaymentApp extends StatelessWidget {
  const SimplePaymentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Payment',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}