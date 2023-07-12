import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<String> cardList=[
    'sdjfkdn',
    'sdjfkdn',
    'sdjfkdn',
    'sdjfkdn',
  ];
  final int itemCount = 10;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List Generate Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('List Generate Example'),
        ),
        body: buildListView(),
      ),
    );
  }

  ListView buildListView() {
    return ListView(
        children: List.generate(cardList.length, (index) {
          return ListTile(
            title: Text('Item ${index + 1}'),
          );
        }),
      );
  }



}
