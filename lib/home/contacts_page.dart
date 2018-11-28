import 'package:flutter/material.dart';
import 'package:flutter_app/modal/contacts.dart' show Contact, ContactsPageData;
import 'package:flutter_app/constants.dart' show Constants, AppColors,AppStyles;

class _ContactItem extends StatelessWidget {
//  final Contact _contact = ContactsPageData.mock().contacts[0];

  final String avatar;
  final String title;
  final String groupTitle;
  final VoidCallback onPressed;

  bool get _isAvatarFromNet {
    return this.avatar.startsWith("http");
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
    Widget _Button = Container(
      padding: EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        top: 10.0,
        bottom: 10.0,
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
            padding: EdgeInsets.only(left:10.0,top:5.0,bottom: 5.0),
            alignment: Alignment.centerLeft,
            color: Color(AppColors.ContactGroupTitleBg),
            child: Text(
              this.groupTitle,
              style: AppStyles.GroupTitleItemTextStyle,
            ),
          ),
          _Button
        ],
      );
    } else {
      _itemBody = _Button;
    }

    return Container(
      child: _itemBody,
    );
  }
}

class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
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
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        if (index < _functionButtons.length) {
          return _functionButtons[index];
        } else {
          Contact _contact = _contacts[index - _functionButtons.length];

          return _ContactItem(
            avatar: _contact.avatar,
            title: _contact.name,
            groupTitle: _contact.nameIndex,
          );
        }
      },
      itemCount: _contacts.length + _functionButtons.length,
    );
  }
}
