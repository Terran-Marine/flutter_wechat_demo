import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart' show Constants;
import 'package:flutter_app/constants.dart' show AppColors;
import 'conversation_page.dart';
import 'contacts_page.dart';
import 'discover_page.dart';
import 'mine_page.dart';
import 'package:flutter_app/widget/Test.dart';

class NavigationIconView {
  final BottomNavigationBarItem item;

  NavigationIconView({String title, IconData icon, IconData activeIcon})
      : item = BottomNavigationBarItem(
            icon: Icon(icon),
            activeIcon: Icon(activeIcon),
            title: Text(
              title,
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
            backgroundColor: Colors.white);
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<NavigationIconView> _navigationIconViews;

  PageController _pageController;
  List<Widget> _pages;

  @override
  void initState() {
    _navigationIconViews = [
      NavigationIconView(
        title: '微信',
        icon: IconData(0xe620, fontFamily: Constants.IconFontFamily),
        activeIcon: IconData(0xe620, fontFamily: Constants.IconFontFamily),
      ),
      NavigationIconView(
        title: '通讯录',
        icon: IconData(0xe660, fontFamily: Constants.IconFontFamily),
        activeIcon: IconData(0xe660, fontFamily: Constants.IconFontFamily),
      ),
      NavigationIconView(
        title: '发现',
        icon: IconData(0xe628, fontFamily: Constants.IconFontFamily),
        activeIcon: IconData(0xe628, fontFamily: Constants.IconFontFamily),
      ),
      NavigationIconView(
        title: '我',
        icon: IconData(0xe636, fontFamily: Constants.IconFontFamily),
        activeIcon: IconData(0xe636, fontFamily: Constants.IconFontFamily),
      ),
    ];

    _pageController = PageController(initialPage: _currentIndex);
    _pages = [
      ConversationPage(),
      ContactsPage(),
      DiscoverPage(),
      Test(),
    ];
    super.initState();
  }

  int _currentIndex = 0;

  _buildPopupMenuItem(IconData icon, String title) {
    return Row(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(right: 15.0),
          child: Icon(icon, color: Colors.white),
        ),
        Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xff303030),
        title: Text(
          "盗版微信",
          textAlign: TextAlign.center,
          maxLines: 1,
        ),
        actions: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                print("搜索按钮");
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 10.0),
            child: PopupMenuButton(
              icon: Icon(Icons.add),
              itemBuilder: (BuildContext context) {
                return <PopupMenuItem<String>>[
                  PopupMenuItem(
                    child: _buildPopupMenuItem(Icons.chat, '发起群聊'),
                    value: "group_chat",
                  ),
                  PopupMenuItem(
                    child: _buildPopupMenuItem(Icons.add_call, '添加朋友'),
                    value: "add_friend",
                  ),
                  PopupMenuItem(
                    child: _buildPopupMenuItem(Icons.scanner, '扫一扫'),
                    value: "scan",
                  ),
                  PopupMenuItem(
                    child: _buildPopupMenuItem(Icons.attach_money, '收付款'),
                    value: "payment",
                  ),
                  PopupMenuItem(
                    child: _buildPopupMenuItem(Icons.help, '帮助与反馈'),
                    value: "help",
                  ),
                ];
              },
              onSelected: (String selectId) {
                print(selectId);
              },
            ),
          )
        ],
      ),
      body: PageView.builder(
        controller: _pageController,
        itemBuilder: (BuildContext context, int index) {
          return _pages[index];
        },
        itemCount: 4,
        onPageChanged: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _navigationIconViews
            .map((NavigationIconView navigationIconView) =>
                navigationIconView.item)
            .toList(),
        fixedColor: const Color(AppColors.TabIconActiveColor),
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
            _pageController.animateToPage(_currentIndex,
                duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
          });
        },
      ),
    );
  }
}