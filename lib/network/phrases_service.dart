import 'dart:convert';

import 'package:http/http.dart';
import 'package:random_phrases_provider/entity/phrase_model.dart';
import 'package:random_phrases_provider/entity/screen.dart';

const String BACKEND_ENDPOINT =
    "https://quotesondesign.com/wp-json/wp/v2/posts?orderby=rand&per_page=";


Future<List<PhraseModel>> loadRandomPhrasesAction(Screen screen, [int amount = 10]) async {
  Response response =  await get(Uri.encodeFull(BACKEND_ENDPOINT + amount.toString()));
  List<dynamic> results = json.decode(response.body);
  List<PhraseModel> phrasesList = [];

  for (var item in results) {
    phrasesList.add(PhraseModel(
        item["content"]["rendered"]
            .replaceAll('<p>', '')
            .replaceAll('<\/p>', '')
            .replaceAll(new RegExp('&#8217;'), '\'')
            .replaceAll(new RegExp('&#8211;'), '-')
            .replaceAll(new RegExp('\\n'), '').trim(),
        item["title"]["rendered"]));
  }

  switch(screen){
    case Screen.INITIAL:
      return phrasesList.sublist(0, 0) ?? [PhraseModel("", "")];
    case Screen.RANDOM_LIST:
      return phrasesList;
    default:
      throw("Screen ${screen.toString()} is not define");
  }


}