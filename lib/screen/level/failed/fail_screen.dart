import 'package:flutter/material.dart';
import '../beginner.dart';
class FailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Yahhh...\nKamu Gagal',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color.fromARGB(255, 0, 0, 0),
                fontSize: 32,
                fontWeight: FontWeight.bold,
                fontFamily: 'Prototype',
              ),
            ),
            SizedBox(height: 16),
            Text(
              '"Why do we have to fall ? So that we\ncan learn how to pick ourselves up"\n- Thomas Wayne',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color.fromARGB(179, 0, 0, 0),
                fontSize: 16,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 32),
            IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const BeginnerScreen()),
                );
              },
              icon: Icon(
                Icons.refresh,
                color: const Color.fromARGB(255, 0, 0, 0),
                size: 36,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Ayo coba lagi !',
              style: TextStyle(
                color: const Color.fromARGB(255, 0, 0, 0),
                fontSize: 18,
                fontFamily: 'Prototype',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
