import 'package:flutter/material.dart';
import 'package:flutter_app/heima/CreationMoviePage.dart';
import 'package:flutter_app/heima/FilterMoviePage.dart';
import 'package:flutter_app/heima/LocalMoviesPage.dart';

class HeimaHomePage extends StatefulWidget {
  @override
  _HeimaHomePageState createState() => _HeimaHomePageState();
}

class _HeimaHomePageState extends State<HeimaHomePage> {
  var _currentIndex = 0;
  var _tabPage = [
    CreationMoviePage(mt:"in_theaters"),
    CreationMoviePage(mt: "coming_soon",),
    CreationMoviePage(mt: "top250",)
  ];

  var _pageController=PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    _pageController.addListener((){});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GJ的Demo"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.accessible),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.store),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(0.0),
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://randomuser.me/api/portraits/women/76.jpg"),
              ),
              accountName: Text("GJ"),
              accountEmail: Text("gongjiantttt@gamil.com"),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "http://www.liulongbin.top:3005/images/bg1.jpg"),
                      fit: BoxFit.cover)),
            ),
            ListTile(
              title: Text("用户反馈"),
              trailing: Icon(Icons.feedback),
            ),
            ListTile(
              title: Text("系统设置"),
              trailing: Icon(Icons.settings),
            ),
            ListTile(
              title: Text("我要发布"),
              trailing: Icon(Icons.send),
            ),
            Divider(
              height: 2,
              color: Colors.grey,
            ),
            ListTile(
              title: Text("注销"),
              trailing: Icon(Icons.exit_to_app),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            this.setState(() {
              _currentIndex = index;
              _pageController.animateToPage(_currentIndex,duration: Duration(seconds: 1),curve: ElasticOutCurve(0.8));
            });
          },
          currentIndex: _currentIndex,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.movie_filter), title: Text('正在热映')),
            BottomNavigationBarItem(
                icon: Icon(Icons.movie_creation), title: Text('即将上映')),
            BottomNavigationBarItem(
                icon: Icon(Icons.local_movies), title: Text('Top250')),
          ]),
      body: PageView(children: _tabPage,controller: _pageController,),
    );
  }
}