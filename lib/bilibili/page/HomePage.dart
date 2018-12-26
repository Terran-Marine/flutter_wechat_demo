import 'package:flutter/material.dart';
import 'dart:ui';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  final List<Tab> myTabs = [
    new Tab(
      text: "直播",
    ),
    new Tab(
      text: "推薦",
    ),
    new Tab(
      text: "追番",
    ),
    new Tab(
      text: "直播",
    ),
    new Tab(
      text: "敖廠長",
    ),
    new Tab(
      text: "谷阿莫",
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: myTabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Color.fromARGB(255, 248, 102, 141)),
      home: Scaffold(
        drawer: Drawer(),
          appBar: AppBar(
            actions: <Widget>[
              IconButton(icon: Icon(Icons.games),onPressed: (){},),
              IconButton(icon: Icon(Icons.add),onPressed: (){},),
              IconButton(icon: Icon(Icons.dehaze),onPressed: (){},),
            ],
            centerTitle: true,
            title: Row(
              children: <Widget>[
                ClipOval(
                  child: FadeInImage.assetNetwork(
                      width: 30,
                      height: 30,
                      placeholder: "images/ic_rq_code.png",
                      image:
                          "https://randomuser.me/api/portraits/women/76.jpg"),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.all(Radius.circular(30.0))),
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 15),
                    padding: EdgeInsets.only(left: 5),
                    height: 30,
                    child: Icon(Icons.search),
                  ),
                ),
              ],
            ),
            bottom: TabBar(
              indicatorColor: Color.fromARGB(255, 248, 102, 141),
              tabs: myTabs,
              isScrollable: true,
              controller: _tabController,
            ),
          ),
          body: TabBarView(controller: _tabController, children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(10.0),
                    height: 140.0,
                    width: window.physicalSize.width,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      child: Image.network(
                        "http://img5.dwstatic.com/newgame/1504/292445976302/1428491993812.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  Container(
                    height: 200,
                    child:  GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,childAspectRatio: 1.0),
                      children: <Widget>[
                        Column(
                          children: <Widget>[Icon(Icons.add_call), Text("第一个")],
                        ),
                        Column(
                          children: <Widget>[Icon(Icons.add_call), Text("第二个")],
                        ),
                        Column(
                          children: <Widget>[Icon(Icons.add_call), Text("第一个")],
                        ),
                        Column(
                          children: <Widget>[Icon(Icons.add_call), Text("第一个")],
                        ),
                        Column(
                          children: <Widget>[Icon(Icons.add_call), Text("第一个")],
                        ),
                        Column(
                          children: <Widget>[Icon(Icons.add_call), Text("第一个")],
                        ),
                        Column(
                          children: <Widget>[Icon(Icons.add_call), Text("第一个")],
                        ),
                        Column(
                          children: <Widget>[Icon(Icons.add_call), Text("第一个")],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Text(myTabs[1].text),
            ),
            Container(
              child: Text(myTabs[2].text),
            ),
            Container(
              child: Text(myTabs[3].text),
            ),
            Container(
              child: Text(myTabs[4].text),
            ),
            Container(
              child: Text(myTabs[5].text),
            ),
          ])),
    );
  }
}