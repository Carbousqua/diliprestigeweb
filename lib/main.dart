import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const DiliPrestigeApp());
}

class DiliPrestigeApp extends StatelessWidget {
  const DiliPrestigeApp({super.key});

  static const Color primary = Color(0xFF0D47A1);
  static const Color accent = Color(0xFFFFC107);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dili Prestige',
      theme: ThemeData(
        primaryColor: primary,
        colorScheme: ColorScheme.fromSeed(
          seedColor: primary,
          secondary: accent,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
