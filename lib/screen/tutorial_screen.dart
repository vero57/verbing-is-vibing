import 'package:flutter/material.dart';

class TutorialScreen extends StatelessWidget {
  const TutorialScreen({super.key});

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
            Stack(
              children: [
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Cara Bermain',
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Prototype',
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  child: Image.asset(
                    'assets/Icon.png', // Ganti dengan path logo kamu
                    width: 90, // Atur ukuran logo sesuai kebutuhan
                    height: 90,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 45.0, left: 70.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.35,
                        height: MediaQuery.of(context).size.width * 0.35,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 62, 129, 167),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.black,
                            width: 30,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.35,
                      height: MediaQuery.of(context).size.width * 0.35,
                      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 68, 157, 209),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [],
                      ),
                      child: const Center(
                        child: Text(
                          '1. Klik bentuk Verb yang telah tersedia\n2. Cocokkan dengan bentuk ke berapa Verb tersebut\n3. Misalnya, Buy merupakan Verb 1 jadi cocokan dengan kolom Verb 1',
                          style: TextStyle(
                            fontSize: 40,
                            fontFamily: 'Prototype',
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 45.0, left: 70.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.35,
                        height: MediaQuery.of(context).size.width * 0.35,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 203, 82, 98),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.black,
                            width: 30,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.35,
                      height: MediaQuery.of(context).size.width * 0.35,
                      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF5D73),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          '1. Pemain diberikan 3 Verb dengan bentuk yang berbeda\n2. Lengkapi Verb yang hilang dengan cara mengetiknya\n3. Misalnya, diberikan Drink sebagai Verb 1. Maka, Verb 2 dan Verb 3 adalah Drank dan Drunk',
                          style: TextStyle(
                            fontSize: 35,
                            fontFamily: 'Prototype',
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 40),
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
