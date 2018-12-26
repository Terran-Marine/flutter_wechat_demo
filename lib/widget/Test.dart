import 'package:flutter/material.dart';
import 'package:flutter_app/home/contacts_page.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
          color: Colors.white70,
          child: ListTile(
            title: Text("RetrofitManager"),
            subtitle: Text("instance"),
            leading: Icon(Icons.local_pizza),
            onTap: () {
              print("RetrofitManager");
            },
          ),
        ),
        Card(
          color: Colors.white70,
          child: ListTile(
            title: Text("apiService"),
            subtitle: Text("getSubjectCategoryList"),
            leading: Icon(Icons.build),
            onTap: () {
              print("getSubjectCategoryList");
            },
          ),
        ),
        Card(
          color: Colors.white70,
          child: ListTile(
            title: Text("PreferenceBean"),
            subtitle: Text("onSuccess"),
            leading: Icon(Icons.whatshot),
            onTap: () {
              print("Card");
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text(("hahah"))));
            },
          ),
        ),
        RaisedButton(
          child: Text("按鈕"),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ContactsPage()));
          },
        ),
        FlatButton(
          child: Text("hahaha"),
          onPressed: () {
            print("lalala");
          },
        ),
      ],
    );
//    return Card(
//      child: Column(
//        children: <Widget>[
//          ListTile(
//            title: Text("RetrofitManager"),
//            subtitle: Text("instance"),
//            leading: Icon(Icons.local_pizza),
//          ),
//          ListTile(
//            title: Text("apiService"),
//            subtitle: Text("getSubjectCategoryList"),
//            leading: Icon(Icons.print),
//          ),
//          ListTile(
//            title: Text("PreferenceBean"),
//            subtitle: Text("onSuccess"),
//            leading: Icon(Icons.weekend),
//          ),
//        ],
//      ),
//    );
  }
}
