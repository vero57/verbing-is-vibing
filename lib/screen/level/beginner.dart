import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../application/beginner/beginner_bloc.dart';
import '../../application/beginner/beginner_event.dart';
import '../../application/beginner/beginner_state.dart';

class BeginnerScreen extends StatefulWidget {
  const BeginnerScreen({super.key});

  @override
  State<BeginnerScreen> createState() => _BeginnerScreenState();
}

class _BeginnerScreenState extends State<BeginnerScreen> {
  int round = 1; // Buat nge-track round

  void _resetGame(BuildContext context) {
    setState(() {
      round += 1;
    });
    context.read<BeginnerBloc>().add(GenerateChoices()); // Reset pilihan
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF449DD1),
      appBar: AppBar(
        backgroundColor: const Color(0xFF449DD1),
        leading: IconButton(
          icon: Image.asset('assets/arrow.png'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: BlocProvider(
        create: (_) => BeginnerBloc()..add(GenerateChoices()),
        child: BlocBuilder<BeginnerBloc, BeginnerState>(builder: (context, state) {
          if (state is AnsweringState) {
            // Hitung jumlah kotak ijo
            int correctCount = state.answerStatus.values.where((status) => status == true).length;

            // Hitung jumlah kotak salah (warna merah)
            int wrongCount = state.answerStatus.values.where((status) => status == false).length;

            // Jika 2 atau lebih kotak salah, direct ke fail page
            if (wrongCount >= 2) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.of(context).pushReplacementNamed('/fail');
              });
            }

            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  const Text(
                    'Mudah',
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Prototype',
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: state.currentAnswers.keys.map((verb) {
                      return Column(
                        children: [
                          Text(
                            verb,
                            style: const TextStyle(
                              fontFamily: 'Prototype',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          AnswerBox(
                            value: state.currentAnswers[verb] ?? "",
                            targetVerb: verb,
                            isCorrect: state.answerStatus[verb],
                            onDrop: (answer) {
                              context.read<BeginnerBloc>().add(DropAnswer(verb, answer));
                            },
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: state.choices.map((choice) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Choice(
                          text: choice,
                          onDragCompleted: () {
                            context.read<BeginnerBloc>().add(RemoveChoice(choice));
                          },
                        ),
                      );
                    }).toList(),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Center(
                            child: Text(
                              'Round: $round', // Round disesuaikan
                              style: const TextStyle(
                                fontFamily: 'Prototype',
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: GestureDetector(
                            onTap: ()=> correctCount == 3 ? _resetGame(context) : null, // Reset kalo 3 kotak udah ijo
                            child: Opacity(
                              opacity: correctCount == 3 ? 1 : 0.5, // Kalo belum 3 ijo, tombolnya redup
                              child: Image.asset(
                                'assets/arrowNext.png',
                                width: 50,
                                height: 50,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        }),
      ),
    );
  }
}

class AnswerBox extends StatelessWidget {
  final String value;
  final String targetVerb;
  final Function(String) onDrop;
  final bool? isCorrect;

  const AnswerBox({
    required this.value,
    required this.targetVerb,
    required this.onDrop,
    required this.isCorrect,
  });

  @override
  Widget build(BuildContext context) {
    Color boxColor;
    bool isLocked = isCorrect == true;

    if (isCorrect == true) {
      boxColor = Colors.green;
    } else if (isCorrect == false) {
      boxColor = Colors.red;
    } else {
      boxColor = Colors.white;
    }

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 20.0),
          child: Container(
            width: 350,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(1),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        DragTarget<String>(onAccept: (answer) {
          if (!isLocked) {
            onDrop(answer);
          }
        }, builder: (context, candidateData, rejectedData) {
          return Container(
            width: 350,
            height: 150,
            decoration: BoxDecoration(
              color: boxColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                value.isEmpty ? "" : value,
                style: const TextStyle(fontFamily: 'Prototype', color: Colors.white),
              ),
            ),
          );
        }),
      ],
    );
    
  }
}

class Choice extends StatefulWidget {
  final String text;
  final VoidCallback onDragCompleted;

  const Choice({required this.text, required this.onDragCompleted, Key? key}) : super(key: key);

  @override
  State<Choice> createState() => _ChoiceState();
}

class _ChoiceState extends State<Choice> {
  bool _isBeingDragged = false;

  @override
  Widget build(BuildContext context) {
    return Draggable<String>(
      data: widget.text,
      onDragStarted: () {
        setState(() {
          _isBeingDragged = true;
        });
      },
      onDraggableCanceled: (_, __) {
        setState(() {
          _isBeingDragged = false;
        });
      },
      onDragCompleted: () {
        setState(() {
          _isBeingDragged = false;
        });
        widget.onDragCompleted();
      },
      feedback: Material(
        color: Colors.transparent,
        child: Container(
          width: 350,
          height: 150,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 189, 189, 189),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              widget.text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Prototype',
              ),
            ),
          ),
        ),
      ),
      child: Container(
        width: 350,
        height: 150,
        decoration: BoxDecoration(
          color: _isBeingDragged ? const Color.fromARGB(213, 208, 208, 208) : Colors.white,
          borderRadius: BorderRadius.circular(10),

        ),
        
        child: Center(
          child: Text(widget.text, 
          style: const TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Prototype',
              ),
          ),
        ),
      ),
    );
  }
}
