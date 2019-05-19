import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class FavoriteWords extends StatefulWidget {
  final List<WordPair> _favorite;

  FavoriteWords(this._favorite);

  @override
  FavoriteWordsState createState() => FavoriteWordsState(_favorite);
}

class FavoriteWordsState extends State<FavoriteWords> {
  final List<WordPair> _favorite;
  final TextStyle _biggerFont = const TextStyle(fontSize: 18);

  FavoriteWordsState(this._favorite);

  Widget _buildRow(WordPair pair) {
    // 単語がまだお気に入りに追加されてないことをチェックする
    return ListTile(
      title: Text(pair.asPascalCase, style: _biggerFont),
    );
  }

  /**
   * リストビューを生成する
   */
  Widget _buildSuggestions() {
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(),
      padding: EdgeInsets.all(16),
      itemCount: _favorite.length,
      itemBuilder: (BuildContext _context, int i) {
        return _buildRow(_favorite[i]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("お気に入り一覧"),
        ),
        body: _buildSuggestions());
  }
}
