import 'package:flutter/material.dart';
import 'dart:math';
import '../level/data/answer.dart'; // Import dataset

class LanjutanScreen extends StatefulWidget {
  @override
  _LanjutanScreenState createState() => _LanjutanScreenState();
}

class _LanjutanScreenState extends State<LanjutanScreen> {
  final random = Random();
  final List<Answer> shuffledAnswers = List.from(answers)..shuffle();
  late Answer answer1;
  late Answer answer2;
  late Answer answer3;
  int round = 1; // Add a state variable for the round number

  @override
  void initState() {
    super.initState();
    answer1 = shuffledAnswers[0];
    answer2 = shuffledAnswers[1];
    answer3 = shuffledAnswers[2];
  }

  void checkAnswers() {
    if (_controllers.every((controller) => controller.text.isNotEmpty)) {
      bool isCorrect = true;
      for (int i = 0; i < _controllers.length; i++) {
        if (_controllers[i].text != _correctAnswers[i]) {
          isCorrect = false;
          break;
        }
      }
      if (isCorrect) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            Future.delayed(const Duration(seconds: 3), () {
              setState(() {
                round++; // Increment the round number
                print('Round: $round'); // Debug print
                shuffledAnswers.shuffle(); // Shuffle the answers again
                answer1 = shuffledAnswers[0];
                answer2 = shuffledAnswers[1];
                answer3 = shuffledAnswers[2];
                _controllers.forEach((controller) => controller.clear()); // Clear the text fields
                print('Shuffled Answers: $shuffledAnswers'); // Debug print
              });
              Navigator.of(context).pop();
            });
            return Dialog(
              backgroundColor: Colors.transparent, // Make the background transparent
              child: Container(
                width: 300,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.black
                ),
                child: const Center(
                  child: Text(
                    'Congrats you did it!',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Prototype',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          },
        );
      }
    }
  }

  final List<TextEditingController> _controllers = [];
  final List<String> _correctAnswers = [];
  final List<Color> _fieldColors = [];

  Widget buildTextField(String text, String correctAnswer) {
    final controller = TextEditingController(text: text);
    _controllers.add(controller);
    _correctAnswers.add(correctAnswer);
    _fieldColors.add(Colors.white);

    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        final index = _controllers.indexOf(controller);
        return Container(
          width: 200,
          height: 80,
          decoration: BoxDecoration(
            color: _fieldColors[index],
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextField(
            controller: controller,
            style: const TextStyle(
              fontSize: 23,
              fontFamily: 'Prototype',
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: _fieldColors[index],
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 30.0), 
            ),
            textAlign: TextAlign.center,
            textAlignVertical: TextAlignVertical.center,
            readOnly: text.isNotEmpty,
            onChanged: (userAnswer) {
              if (userAnswer == correctAnswer) {
                setState(() {
                  _fieldColors[index] = Colors.green;
                });
              } else {
                setState(() {
                  _fieldColors[index] = Colors.blue;
                });
              }
              checkAnswers();
            },
          ),
        );
      },
    );
  }

  Widget buildContainer(Answer answer) {
    final List<String> verbs = [answer.verb1, answer.verb2, answer.verb3];
    final int emptyIndex1 = random.nextInt(3);
    int emptyIndex2;
    do {
      emptyIndex2 = random.nextInt(3);
    } while (emptyIndex2 == emptyIndex1);

    return Container(
      width: 1200,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    buildTextField(emptyIndex1 == 0 || emptyIndex2 == 0 ? '' : verbs[0], verbs[0]),
                  ],
                ),
                Column(
                  children: [
                    buildTextField(emptyIndex1 == 1 || emptyIndex2 == 1 ? '' : verbs[1], verbs[1]),
                  ],
                ),
                Column(
                  children: [
                    buildTextField(emptyIndex1 == 2 || emptyIndex2 == 2 ? '' : verbs[2], verbs[2]),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNewContainer() {
    return Container(
      width: 1200,
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 200,
              height: 80,
              child: const Center(
                child: Text(
                  'Verb 1',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Prototype',
                  ),
                ),
              ),
            ),
            Container(
              width: 200,
              height: 80,
              child: const Center(
                child: Text(
                  'Verb 2',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Prototype',
                  ),
                ),
              ),
            ),
            Container(
              width: 200,
              height: 80,
              child: const Center(
                child: Text(
                  'Verb 3',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Prototype',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFF5D73),
        leading: IconButton(
          icon: Image.asset(
            'assets/arrow.png',
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        color: Color(0xFFFF5D73),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 1200,
                height: 80,
                child: const Center(
                  child: Text(
                    'LANJUTAN',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 50,
                      fontFamily: 'Prototype',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              buildNewContainer(),
              const SizedBox(height: 20),
              buildContainer(answer1),
              const SizedBox(height: 20),
              buildContainer(answer2),
              const SizedBox(height: 20),
              buildContainer(answer3),
              const SizedBox(height: 20),
              Container(
                width: 1200,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const SizedBox(width: 20),
                    Text(
                      'ROUND $round',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontFamily: 'Prototype',
                      ),
                    ),
                    Image.asset(
                      'assets/arrowNext.png',
                      width: 50,
                      height: 50,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}