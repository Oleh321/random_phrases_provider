import 'package:flutter/foundation.dart';
import 'package:random_phrases_provider/entity/phrase_model.dart';

class InitialPhraseState extends ChangeNotifier {
  PhraseModel _phraseModel = PhraseModel("","");

  InitialPhraseState();

  PhraseModel get phraseModel => _phraseModel;

  set phraseModel(PhraseModel value) {
    _phraseModel = value;
    notifyListeners();
  }

}