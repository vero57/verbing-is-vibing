import 'package:flutter/material.dart';
import 'package:verbing_is_vibing/screen/home_screen.dart';
import 'package:verbing_is_vibing/screen/level/failed/fail_screen.dart'; // Pastikan import halaman fail.dart

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Verbing is Vibing',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      routes: {
        '/fail': (context) => FailScreen(), // Menambahkan rute halaman gagal
      },
    );
  }
}
