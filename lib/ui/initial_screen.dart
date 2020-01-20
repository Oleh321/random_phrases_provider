import 'package:flutter/material.dart';


class InitialScreen extends StatefulWidget {
  @override
  _InitialScreenState createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, InitialViewModel>(
        onInitialBuild: (viewModel) => viewModel.loadPhrase(),
        rebuildOnChange: true,
        converter: (store) => InitialViewModel.fromStore(store),
        builder: (context, viewModel) => Scaffold(
            body: viewModel.isLoading
                ? Center(child: CircularProgressIndicator())
                : _buildContent(context, viewModel)));
  }
}

Widget _buildContent(BuildContext context, InitialViewModel viewModel) {
  return SafeArea(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      child: Text("\"" + viewModel.phrase.quote + "\"",
                          style: TextStyle(
                              color: Colors.lightBlue[700],
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                          textAlign: TextAlign.center),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      child: Text("- " + viewModel.phrase.author,
                          style: TextStyle(
                              color: Colors.lightBlue[700],
                              fontSize: 16,
                              fontWeight: FontWeight.normal),
                          textAlign: TextAlign.right),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildBottomButton(
    {Color backgroundColor, String text, Function callback}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: MaterialButton(
      minWidth: double.infinity,
      color: backgroundColor,
      onPressed: callback,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Text(
          text.toUpperCase(),
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    ),
  );
}