import 'package:flutter/material.dart';

class FilterMoviePage extends StatefulWidget {
  @override
  _FilterMoviePageState createState() => _FilterMoviePageState();
}

class _FilterMoviePageState extends State<FilterMoviePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(children: <Widget>[
        ListTile(title: Text("title"),subtitle: Text("subtitle"),),
        ListTile(title: Text("title1"),subtitle: Text("subtitle1"),),
        ListTile(title: Text("title2"),subtitle: Text("subtitle2"),),
        ListTile(title: Text("title3"),subtitle: Text("subtitle3"),),
        ListTile(title: Text("title4"),subtitle: Text("subtitle4"),),
      ],),
    );
  }
}
