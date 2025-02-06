import 'package:flutter_bloc/flutter_bloc.dart';
import 'beginner_event.dart';
import 'beginner_state.dart';

class BeginnerBloc extends Bloc<BeginnerEvent, BeginnerState> {
  BeginnerBloc() : super(const InitialState()) {
    on<GenerateChoices>(_onGenerateChoices);
    on<DropAnswer>(_onDropAnswer);
  } 

  // Dataset jawaban benar
  final List<Map<String, String>> _datasets = [
  {"Verb 1": "arise", "Verb 2": "arose", "Verb 3": "arisen"},
  {"Verb 1": "awake", "Verb 2": "awoke", "Verb 3": "awoken"},
  {"Verb 1": "be", "Verb 2": "was/were", "Verb 3": "been"},
  {"Verb 1": "bear", "Verb 2": "bore", "Verb 3": "borne"},
  {"Verb 1": "beat", "Verb 2": "beat", "Verb 3": "beaten"},
  {"Verb 1": "become", "Verb 2": "became", "Verb 3": "become"},
  {"Verb 1": "begin", "Verb 2": "began", "Verb 3": "begun"},
  {"Verb 1": "bend", "Verb 2": "bent", "Verb 3": "bent"},
  {"Verb 1": "bet", "Verb 2": "bet", "Verb 3": "bet"},
  {"Verb 1": "bind", "Verb 2": "bound", "Verb 3": "bound"},
  {"Verb 1": "bite", "Verb 2": "bit", "Verb 3": "bitten"},
  {"Verb 1": "bleed", "Verb 2": "bled", "Verb 3": "bled"},
  {"Verb 1": "blow", "Verb 2": "blew", "Verb 3": "blown"},
  {"Verb 1": "break", "Verb 2": "broke", "Verb 3": "broken"},
  {"Verb 1": "bring", "Verb 2": "brought", "Verb 3": "brought"},
  {"Verb 1": "build", "Verb 2": "built", "Verb 3": "built"},
  {"Verb 1": "burn", "Verb 2": "burnt/burned", "Verb 3": "burnt/burned"},
  {"Verb 1": "buy", "Verb 2": "bought", "Verb 3": "bought"},
  {"Verb 1": "catch", "Verb 2": "caught", "Verb 3": "caught"},
  {"Verb 1": "choose", "Verb 2": "chose", "Verb 3": "chosen"},
  {"Verb 1": "come", "Verb 2": "came", "Verb 3": "come"},
  {"Verb 1": "cost", "Verb 2": "cost", "Verb 3": "cost"},
  {"Verb 1": "cut", "Verb 2": "cut", "Verb 3": "cut"},
  {"Verb 1": "deal", "Verb 2": "dealt", "Verb 3": "dealt"},
  {"Verb 1": "dig", "Verb 2": "dug", "Verb 3": "dug"},
  {"Verb 1": "do", "Verb 2": "did", "Verb 3": "done"},
  {"Verb 1": "draw", "Verb 2": "drew", "Verb 3": "drawn"},
  {"Verb 1": "drink", "Verb 2": "drank", "Verb 3": "drunk"},
  {"Verb 1": "drive", "Verb 2": "drove", "Verb 3": "driven"},
  {"Verb 1": "eat", "Verb 2": "ate", "Verb 3": "eaten"},
  {"Verb 1": "fall", "Verb 2": "fell", "Verb 3": "fallen"},
  {"Verb 1": "feel", "Verb 2": "felt", "Verb 3": "felt"},
  {"Verb 1": "fight", "Verb 2": "fought", "Verb 3": "fought"},
  {"Verb 1": "find", "Verb 2": "found", "Verb 3": "found"},
  {"Verb 1": "fly", "Verb 2": "flew", "Verb 3": "flown"},
  {"Verb 1": "forget", "Verb 2": "forgot", "Verb 3": "forgotten"},
  {"Verb 1": "forgive", "Verb 2": "forgave", "Verb 3": "forgiven"},
  {"Verb 1": "freeze", "Verb 2": "froze", "Verb 3": "frozen"},
  {"Verb 1": "get", "Verb 2": "got", "Verb 3": "gotten/got"},
  {"Verb 1": "give", "Verb 2": "gave", "Verb 3": "given"},
  {"Verb 1": "go", "Verb 2": "went", "Verb 3": "gone"},
  {"Verb 1": "grow", "Verb 2": "grew", "Verb 3": "grown"},
  {"Verb 1": "hang", "Verb 2": "hung", "Verb 3": "hung"},
  {"Verb 1": "have", "Verb 2": "had", "Verb 3": "had"},
  {"Verb 1": "hear", "Verb 2": "heard", "Verb 3": "heard"},
  {"Verb 1": "hide", "Verb 2": "hid", "Verb 3": "hidden"},
  {"Verb 1": "hit", "Verb 2": "hit", "Verb 3": "hit"},
  {"Verb 1": "hold", "Verb 2": "held", "Verb 3": "held"},
  {"Verb 1": "keep", "Verb 2": "kept", "Verb 3": "kept"},
  {"Verb 1": "know", "Verb 2": "knew", "Verb 3": "known"},
  {"Verb 1": "leave", "Verb 2": "left", "Verb 3": "left"},
  {"Verb 1": "lose", "Verb 2": "lost", "Verb 3": "lost"},
  {"Verb 1": "make", "Verb 2": "made", "Verb 3": "made"},
  {"Verb 1": "mean", "Verb 2": "meant", "Verb 3": "meant"},
  {"Verb 1": "meet", "Verb 2": "met", "Verb 3": "met"},
  {"Verb 1": "pay", "Verb 2": "paid", "Verb 3": "paid"},
  {"Verb 1": "put", "Verb 2": "put", "Verb 3": "put"},
  {"Verb 1": "read", "Verb 2": "read", "Verb 3": "read"},
  {"Verb 1": "ride", "Verb 2": "rode", "Verb 3": "ridden"},
  {"Verb 1": "ring", "Verb 2": "rang", "Verb 3": "rung"},
  {"Verb 1": "rise", "Verb 2": "rose", "Verb 3": "risen"},
  {"Verb 1": "run", "Verb 2": "ran", "Verb 3": "run"},
  {"Verb 1": "say", "Verb 2": "said", "Verb 3": "said"},
  {"Verb 1": "see", "Verb 2": "saw", "Verb 3": "seen"},
  {"Verb 1": "sell", "Verb 2": "sold", "Verb 3": "sold"},
  {"Verb 1": "send", "Verb 2": "sent", "Verb 3": "sent"},
  {"Verb 1": "set", "Verb 2": "set", "Verb 3": "set"},
  {"Verb 1": "shake", "Verb 2": "shook", "Verb 3": "shaken"},
  {"Verb 1": "show", "Verb 2": "showed", "Verb 3": "shown"},
  {"Verb 1": "sing", "Verb 2": "sang", "Verb 3": "sung"},
  {"Verb 1": "sit", "Verb 2": "sat", "Verb 3": "sat"},
  {"Verb 1": "sleep", "Verb 2": "slept", "Verb 3": "slept"},
  {"Verb 1": "speak", "Verb 2": "spoke", "Verb 3": "spoken"},
  {"Verb 1": "spend", "Verb 2": "spent", "Verb 3": "spent"},
  {"Verb 1": "stand", "Verb 2": "stood", "Verb 3": "stood"},
  {"Verb 1": "steal", "Verb 2": "stole", "Verb 3": "stolen"},
  {"Verb 1": "swim", "Verb 2": "swam", "Verb 3": "swum"},
  {"Verb 1": "take", "Verb 2": "took", "Verb 3": "taken"},
  {"Verb 1": "teach", "Verb 2": "taught", "Verb 3": "taught"},
  {"Verb 1": "tell", "Verb 2": "told", "Verb 3": "told"},
  {"Verb 1": "think", "Verb 2": "thought", "Verb 3": "thought"},
  {"Verb 1": "throw", "Verb 2": "threw", "Verb 3": "thrown"},
  {"Verb 1": "understand", "Verb 2": "understood", "Verb 3": "understood"},
  {"Verb 1": "wake", "Verb 2": "woke", "Verb 3": "woken"},
  {"Verb 1": "wear", "Verb 2": "wore", "Verb 3": "worn"},
  {"Verb 1": "win", "Verb 2": "won", "Verb 3": "won"},
  {"Verb 1": "write", "Verb 2": "wrote", "Verb 3": "written"},
];


  void _onGenerateChoices(GenerateChoices event, Emitter<BeginnerState> emit) {
    final selectedDataset = (_datasets..shuffle()).first;
    final groupedChoices = selectedDataset.values.toList();

    emit(AnsweringState(
      currentAnswers: const {"Verb 1": "", "Verb 2": "", "Verb 3": ""},
      choices: groupedChoices..shuffle(),
      answerStatus: const {"Verb 1": null, "Verb 2": null, "Verb 3": null},
      correctAnswers: selectedDataset,
    ));
  }

  void _onDropAnswer(DropAnswer event, Emitter<BeginnerState> emit) {
  final currentState = state;
  if (currentState is AnsweringState) {
    // Salin jawaban user dan status jawaban saat ini
    final updatedAnswers = Map<String, String>.from(currentState.currentAnswers)
      ..[event.targetVerb] = event.droppedAnswer;

    final isCorrect = currentState.correctAnswers[event.targetVerb] == event.droppedAnswer;

    final updatedStatus = Map<String, bool?>.from(currentState.answerStatus)
      ..[event.targetVerb] = isCorrect;

    // Jika jawaban benar, hapus dari daftar pilihan
    final updatedChoices = List<String>.from(currentState.choices);
    if (isCorrect) {
      updatedChoices.remove(event.droppedAnswer);
    }

    emit(AnsweringState(
      currentAnswers: updatedAnswers,
      choices: updatedChoices, // Perbarui pilihan
      answerStatus: updatedStatus,
      correctAnswers: currentState.correctAnswers,
    ));
  }
}





}

