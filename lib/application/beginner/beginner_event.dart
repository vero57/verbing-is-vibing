import 'package:equatable/equatable.dart';

abstract class BeginnerEvent extends Equatable {
  const BeginnerEvent();

  @override
  List<Object> get props => [];
}

class GenerateChoices extends BeginnerEvent {}

class DropAnswer extends BeginnerEvent {
  final String targetVerb;
  final String droppedAnswer;

  const DropAnswer(this.targetVerb, this.droppedAnswer);

  @override
  List<Object> get props => [targetVerb, droppedAnswer];
}

class RemoveChoice extends BeginnerEvent {
  final String choice;

  const RemoveChoice(this.choice);

  @override
  List<Object> get props => [choice];
}

class ResetGame extends BeginnerEvent {}




