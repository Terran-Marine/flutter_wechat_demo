import 'package:flutter/material.dart';
import 'package:flutter_app/modal/contacts.dart' show Contact, ContactsPageData;
import 'package:flutter_app/constants.dart'
    show Constants, AppColors, AppStyles;
import 'dart:math';

class _ContactItem extends StatelessWidget {
//  final Contact _contact = ContactsPageData.mock().contacts[0];

  final String avatar;
  final String title;
  final String groupTitle;
  final VoidCallback onPressed;

  static final double MARGIN_VERTICAL = 10.0;
  static final double GROUP_TITLE_HEIGHT = 24.0;

  bool get _isAvatarFromNet {
    return this.avatar.startsWith("http");
  }

  static double _height(bool hasGroupTitle) {
    var _buttonHeight = MARGIN_VERTICAL * 2 +
        Constants.ContactAvatarSize +
        Constants.DividerWidth;
    if (hasGroupTitle) {
      _buttonHeight += GROUP_TITLE_HEIGHT;
    }
    return _buttonHeight;
  }

  _ContactItem({this.avatar, this.title, this.groupTitle, this.onPressed});

  @override
  Widget build(BuildContext context) {
    Widget _avatarIcon;

    //图标 头像
    if (_isAvatarFromNet) {
      _avatarIcon = Image.network(avatar,
          width: Constants.ContactAvatarSize,
          height: Constants.ContactAvatarSize);
    } else {
      _avatarIcon = Image.asset(avatar,
          width: Constants.ContactAvatarSize,
          height: Constants.ContactAvatarSize);
    }

    //列表主体
    Widget _button = Container(
      padding: EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        top: MARGIN_VERTICAL,
        bottom: MARGIN_VERTICAL,
      ),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  style: BorderStyle.solid,
                  width: Constants.DividerWidth,
                  color: Color(AppColors.DividerColor)))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _avatarIcon,
          SizedBox(
            width: 10.0,
          ),
          Text(title),
        ],
      ),
    );

    // 分组标签
    Widget _itemBody;
    if (this.groupTitle != null) {
      _itemBody = Column(
        children: <Widget>[
          Container(
            height: GROUP_TITLE_HEIGHT,
            padding: EdgeInsets.only(left: 10.0),
            alignment: Alignment.centerLeft,
            color: Color(AppColors.ContactGroupTitleBg),
            child: Text(
              this.groupTitle,
              style: AppStyles.GroupTitleItemTextStyle,
            ),
          ),
          _button
        ],
      );
    } else {
      _itemBody = _button;
    }

    return Container(
      child: _itemBody,
    );
  }
}

const INDEX_BAR_WORDS = [
  "↑",
  "☆",
  "A",
  "B",
  "C",
  "D",
  "E",
  "F",
  "G",
  "H",
  "I",
  "J",
  "K",
  "L",
  "M",
  "N",
  "O",
  "P",
  "Q",
  "R",
  "S",
  "T",
  "U",
  "V",
  "W",
  "X",
  "Y",
  "Z"
];

class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  Color _indexBarBG = Colors.transparent;
  ScrollController _scrollController;
  Container controller;
  final Map<String, double> _letterMap = {INDEX_BAR_WORDS[0]: 0.0};
  String _currentLetter = "";

  final List<Contact> _contacts = ContactsPageData.mock().contacts;
  final List<_ContactItem> _functionButtons = [
    _ContactItem(
        avatar: "images/ic_new_friend.png",
        title: "新的朋友",
        onPressed: () {
          print('新的朋友');
        }),
    _ContactItem(
        avatar: "images/ic_group_chat.png",
        title: "群聊",
        onPressed: () {
          print('群聊');
        }),
    _ContactItem(
        avatar: "images/ic_tag.png",
        title: "标签",
        onPressed: () {
          print('标签');
        }),
    _ContactItem(
        avatar: "images/ic_public_account.png",
        title: "公众号",
        onPressed: () {
          print('公众号');
        }),
  ];

  @override
  void initState() {
    super.initState();

    _contacts.sort((Contact a, Contact b) {
      return a.nameIndex.compareTo(b.nameIndex);
    });

    _scrollController = new ScrollController();

    //計算index的位置offset
    var _totalPos = _functionButtons.length * _ContactItem._height(false);

    for (int i = 0; i < _contacts.length; i++) {
      bool _hasGroupTitle = true;

      if (i > 0 && _contacts[i].nameIndex == (_contacts[i - 1].nameIndex)) {
        _hasGroupTitle = false;
      }

      if (_hasGroupTitle) {
        _letterMap[_contacts[i].nameIndex] = _totalPos;
      }

      _totalPos += _ContactItem._height(_hasGroupTitle);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  String _getletter(BuildContext context, Offset globalPos, double tileHeight) {
    RenderBox _findRenderObject = context.findRenderObject();
    var local = _findRenderObject.globalToLocal(globalPos);
    return INDEX_BAR_WORDS[
        (local.dy ~/ tileHeight).clamp(0, INDEX_BAR_WORDS.length - 1)];
  }

  void _jumpToIndex(String letter) {
    _scrollController.animateTo(_letterMap[letter],
        duration: Duration(milliseconds: 200), curve: Curves.ease);
  }

  Widget _buildIndexBar(BuildContext context, BoxConstraints constraints) {
    final List<Widget> _letters = INDEX_BAR_WORDS.map((String word) {
      return Expanded(child: Text(word));
    }).toList();

    final double _totalHeight = constraints.biggest.height;
    final double _tileHeight = _totalHeight / _letters.length;
    return GestureDetector(
      child: Column(
        children: _letters,
      ),
      onVerticalDragDown: (DragDownDetails details) {
        print("按下");
        setState(() {
          _indexBarBG = Colors.black26;
          var indexLetter =
              _getletter(context, details.globalPosition, _tileHeight);
          _currentLetter = indexLetter;
          _jumpToIndex(indexLetter);
        });
      },
      onVerticalDragUpdate: (DragUpdateDetails details) {
        print("Update");
        setState(() {
          _indexBarBG = Colors.black26;
          var indexLetter =
              _getletter(context, details.globalPosition, _tileHeight);
          _currentLetter = indexLetter;
          _jumpToIndex(indexLetter);
        });
      },
      onVerticalDragCancel: () {
        print("取消");
        setState(() {
          _currentLetter = null;
          _indexBarBG = Colors.transparent;
        });
      },
      onVerticalDragEnd: (DragEndDetails details) {
        print("结束");
        setState(() {
          _currentLetter = null;
          _indexBarBG = Colors.transparent;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _body = [
      ListView.builder(
        controller: _scrollController,
        itemBuilder: (BuildContext context, int index) {
          if (index < _functionButtons.length) {
            return _functionButtons[index];
          } else {
            Contact _contact = _contacts[index - _functionButtons.length];

            return _ContactItem(
              avatar: _contact.avatar,
              title: _contact.name,
              groupTitle:
                  _isGroupTitle(index, _contact) ? _contact.nameIndex : null,
            );
          }
        },
        itemCount: _contacts.length + _functionButtons.length,
      ),
      Positioned(
          bottom: 0.0,
          top: 0.0,
          right: 0.0,
          width: Constants.IndexBarWitch,
          child: Container(
            color: _indexBarBG,
            child: LayoutBuilder(builder: _buildIndexBar),
          )),
    ];

    if (_currentLetter != null && _currentLetter.isNotEmpty) {
      _body.add(Center(
        child: Container(
            width: Constants.IndexLetterBoxSize,
            height: Constants.IndexLetterBoxSize,
            decoration: BoxDecoration(
                color: AppColors.IndexLetterBoxBG,
                borderRadius: BorderRadius.all(
                    Radius.circular(Constants.IndexLetterBoxRadius))),
            child: Center(
                child: Text(
              _currentLetter,
              style: AppStyles.IndexLetterBoxTextStyle,
            ))),
      ));
    }

    return Stack(
      children: _body,
    );
  }

  bool _isGroupTitle(int index, Contact _contact) {
    return (index == _functionButtons.length) ||
        ((_contacts[index - _functionButtons.length - 1].nameIndex !=
            _contact.nameIndex));
  }
}