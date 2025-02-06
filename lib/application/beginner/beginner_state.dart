import 'package:equatable/equatable.dart';

abstract class BeginnerState extends Equatable {
  const BeginnerState();
}

class InitialState extends BeginnerState {
  const InitialState();

  @override
  List<Object?> get props => [];
}

class AnsweringState extends BeginnerState {
  final Map<String, String> currentAnswers;
  final List<String> choices;
  final Map<String, bool?> answerStatus;
  final Map<String, String> correctAnswers;
  final int wrongAttempts;

  const AnsweringState({
    required this.currentAnswers,
    required this.choices,
    required this.answerStatus,
    required this.correctAnswers,
    this.wrongAttempts = 0,
  });

  @override
  List<Object?> get props => [
        currentAnswers,
        choices,
        answerStatus,
        correctAnswers,
        wrongAttempts,
      ];
}

class FinishedState extends BeginnerState {
  final bool isCorrect;

  const FinishedState({required this.isCorrect});

  @override
  List<Object?> get props => [isCorrect];
}

class RoundResetState extends BeginnerState {
  final int newRound;

  const RoundResetState(this.newRound);

  @override
  List<Object?> get props => [newRound];
}

