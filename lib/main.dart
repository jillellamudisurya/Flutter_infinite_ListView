import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart'; //import new pacakge that we added in pubspec

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({ Key key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  //const RandomWords({ Key? key }) : super(key: key);

  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome To Flutter',
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:const Text('Welcome To Flutter',style: TextStyle(color: Colors.white,fontSize: 24),),
          backgroundColor: Colors.blue[900],
          elevation: 2.0,
        ),

        body: _buildSuggestions(),

      ),
    );
  }
  Widget _buildSuggestions() {  
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return const Divider(); /*2*/

          final index = i ~/ 2; /*3*/
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10)); /*4*/
          }
          return _buildRow(_suggestions[index]);
        });
  }
  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }
}
