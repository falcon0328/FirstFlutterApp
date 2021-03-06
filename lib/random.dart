import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:hello/favorite.dart';

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  /**
   * リストビューに表示する内容を定義する
   */
  final List<WordPair> _suggestions = <WordPair>[];
  /**
   * お気に入り一覧
   */
  final Set<WordPair> _saved = Set<WordPair>();
  /**
   * テキストのスタイル指定
   */
  final TextStyle _biggerFont = const TextStyle(fontSize: 18);

  /**
   * リストに表示する行の設定
   */
  Widget _buildRow(WordPair pair) {
    // 単語がまだお気に入りに追加されてないことをチェックする
    final bool alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(pair.asPascalCase, style: _biggerFont),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

  /**
   * リストビューを生成する
   */
  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemBuilder: (BuildContext _context, int i) {
          if (i.isOdd) {
            return Divider();
          }
          final int index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Startup name Generator"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.list),
              onPressed: _pushSaved,
            )
          ],
        ),
        body: _buildSuggestions());
  }

  /**
   * リストアイコンを押した時に次の画面に遷移する
   */
  void _pushSaved() {
    Navigator.of(context).push(new MaterialPageRoute<Null>(
        settings: RouteSettings(name: "/favorite"),
        builder: (BuildContext context) => FavoriteWords(_saved.toList())));
  }
}
