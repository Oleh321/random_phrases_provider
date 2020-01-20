import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_phrases_provider/provider/state/initial_phrase_state.dart';
import 'package:random_phrases_provider/provider/state/loading_state.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<InitialPhraseState>(create: (_) => InitialPhraseState()),
        Provider<LoadingState>(create: (_) => LoadingState())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
