import 'package:flutter/material.dart';

class LearnListView extends StatefulWidget {
  @override
  _LearnListViewState createState() => _LearnListViewState();
}

class _LearnListViewState extends State<LearnListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
                child: GridView.count(
      crossAxisSpacing: 10.0,
      crossAxisCount: 3,
      padding: EdgeInsets.all(20.0),
      children: <Widget>[],
    ))));
  }
}
