// First Flutter tutorial
// ENGINEERED BY HENRY LAW JUNWEI
// STARTUP NAME GENERATOR APPS

// SOURCE PACKAGES
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

// MAIN FUNCTION TO RUN APPS
void main() => runApp(MyApp());

// GeneratorApp class extends with StatelessWidget = makes an app itself a widget
class MyApp extends StatelessWidget {
  // build() = descirbe how to display the widget
  Widget build(BuildContext buildContext) {
    return MaterialApp(
      title: 'Startup Name Generator',
      home: RandomWords(),
    );
  }
}

// class RandomWords extends with StatefulWidget
class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  /* _biggerFont = to make the font size larger */
  final _biggerFont = TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext context) {
    // final wordPair = WordPair.random();
    // return Text(wordPair.asPascalCase);
    // Scaffold = a default app bar and body property that holds the widget tree for the home screen
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();

          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  // _buildRow = display each new pair in ListTile
  Widget _buildRow(WordPair wordPair) {
    return ListTile(
        title: Text(
      wordPair.asPascalCase,
      style: _biggerFont,
    ));
  }
}
