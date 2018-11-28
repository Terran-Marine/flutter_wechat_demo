import 'package:flutter/material.dart';
import 'package:flutter_app/modal/contacts.dart' show Contact, ContactsPageData;
import 'package:flutter_app/constants.dart' show Constants, AppColors;

//1.熟悉rxjava,rxandroid,retrofit, 熟悉okhttp+rxjava+retrofit封装
//2.了解android7.0/8.0/9.0 的特性
//3.熟悉view绘制流程,自定义view,touch事件
//4.熟悉kotlin,arcore优先

class _ContactItem extends StatelessWidget {
//  final Contact _contact = ContactsPageData.mock().contacts[0];

  final String avatar;
  final String title;
  final String groupTitle;

  _ContactItem({this.avatar, this.title, this.groupTitle});

  @override
  Widget build(BuildContext context) {
    var _avatarIcon =Image.network(avatar,
        width: Constants.ContactAvatarSize,
        height: Constants.ContactAvatarSize);


    return Container(
      padding: EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        top: 10.0,
        bottom: 10.0,
      ),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  style:BorderStyle.solid ,
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
  }
}

class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  final List<Contact> _contacts = ContactsPageData.mock().contacts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        Contact _contact = _contacts[index];

        return _ContactItem(
          avatar: _contact.avatar,
          title: _contact.name,
        );
      },
      itemCount: _contacts.length,
    );
  }
}
