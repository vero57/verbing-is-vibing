import 'package:flutter/material.dart';
import 'level_selection.dart';
import 'tutorial_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset('assets/arrow.png'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Verbing is Vibing',
              style: TextStyle(
                fontSize: 80,
                fontWeight: FontWeight.bold,
                fontFamily: 'Prototype',
              ),
            ),
            const SizedBox(height: 40),
            Image.asset(
              'assets/Icon.png',
              width: 300,
              height: 200,
            ),
            const SizedBox(height: 40),
            Stack(
              children: [
                // Kotak "shadow" di belakang
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 15.0),
                  child: Container(
                    width: 300,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                Container(
                  width: 300,
                  height: 65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) => const LevelSelectionScreen())
                        );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Ayo Main !',
                      style: TextStyle(
                        fontSize: 40,
                        fontFamily: 'Prototype',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Stack(
              children: [
                // Kotak "shadow" di belakang
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 15.0),
                  child: Container(
                    width: 300,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                // Tombol utama di depan
                Container(
                  width: 300,
                  height: 65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) => const TutorialScreen())
                        );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Cara Bermain',
                      style: TextStyle(
                        fontSize: 40,
                        fontFamily: 'Prototype',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            const Text(
              'Belajar Verb itu Keren',
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'Prototype', // Menggunakan font Prototype
              ),
            ),
          ],
        ),
      ),
    );
  }
}
