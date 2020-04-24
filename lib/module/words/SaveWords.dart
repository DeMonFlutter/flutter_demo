import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

/// @author DeMon
/// Created on 2020/4/23.
/// E-mail 757454343@qq.com
/// Desc:

class SaveWordsPage extends StatefulWidget {
  Set<WordPair> saved;

  SaveWordsPage(Set<WordPair> _saved) : super() {
    this.saved = _saved;
  }

  @override
  createState() => new SaveWordsPageState();
}

class SaveWordsPageState extends State<SaveWordsPage> {
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    final tiles = widget.saved.map(
      (pair) {
        return ListTile(
          title: Text(
            pair.asPascalCase,
            style: _biggerFont,
          ),
        );
      },
    );
    final divided = ListTile.divideTiles(
      context: context,
      tiles: tiles,
    ).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Suggestions'),
      ),
      body: ListView(children: divided),
    );
  }
}
