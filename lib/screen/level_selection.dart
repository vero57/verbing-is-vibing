import 'package:flutter/material.dart';
import 'package:verbing_is_vibing/screen/level/beginner.dart';
import 'package:verbing_is_vibing/screen/level/advanced.dart';

class LevelSelectionScreen extends StatelessWidget {
  const LevelSelectionScreen({super.key});

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Pilih Mode Permainan',
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Prototype',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) => const BeginnerScreen())
                      );
                  },
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 45.0, left: 70.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: MediaQuery.of(context).size.width * 0.3,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.width * 0.3,
                        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 68, 157, 209),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Spacer(),
                            Text(
                              'Mudah',
                              style: TextStyle(
                                fontSize: 60,
                                fontFamily: 'Prototype',
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Spacer(),
                            Text(
                              'Kamu masih pemula?',
                              style: TextStyle(
                                fontSize: 35,
                                fontFamily: 'Prototype',
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) => LanjutanScreen())
                      );
                  },
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 45.0, left: 70.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: MediaQuery.of(context).size.width * 0.3,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.width * 0.3,
                        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF5D73),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Spacer(),
                            Text(
                              'Lanjutan',
                              style: TextStyle(
                                fontSize: 60,
                                fontFamily: 'Prototype',
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Spacer(),
                            Text(
                              'Sudah merasa Jago?',
                              style: TextStyle(
                                fontSize: 35,
                                fontFamily: 'Prototype',
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 100),
            const Text(
              'Belajar Verb itu Keren',
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'Prototype',

              ),
            ),
          ],
        ),
      ),
    );
  }
}
