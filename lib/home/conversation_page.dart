import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart'
    show AppColors, AppStyles, Constants;
import 'package:flutter_app/modal/conversation.dart'
    show conversationMockData, Conversation;

class _ConversationItem extends StatelessWidget {
  final Conversation _conversation;

  const _ConversationItem(this._conversation) : assert(_conversation != null);

  @override
  Widget build(BuildContext context) {
    Widget avatar;
    if (_conversation.isAvatarFromNet()) {
      avatar = Image.network(_conversation.avatar,
          width: Constants.ConversationAvatarSize,
          height: Constants.ConversationAvatarSize);
    } else {
      avatar = Image.asset(_conversation.avatar,
          width: Constants.ConversationAvatarSize,
          height: Constants.ConversationAvatarSize);
    }

    Widget unreadMsgCountText = Container(
      width: Constants.UnreadMsgNotifyDotSize,
      height: Constants.UnreadMsgNotifyDotSize,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Color(AppColors.NotifyDotBG),
          borderRadius:
              BorderRadius.circular(Constants.UnreadMsgNotifyDotSize / 2.0)),
      child: Text(
        _conversation.unReadMsgCount.toString(),
        style: AppStyles.UnreadMsgCountDotStyle,
      ),
    );

    //头像和角标
    Widget avatarContainer;
    if (_conversation.unReadMsgCount > 0) {
      avatarContainer = Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          avatar,
          Positioned(
              right: -6.0,
              top: -Constants.UnreadMsgNotifyDotSize / 2,
              child: unreadMsgCountText)
        ],
      );
    } else {
      avatarContainer = Stack(
        overflow: Overflow.visible,
        children: <Widget>[avatar],
      );
    }

    //勿扰图标
    Widget muteIcon = Icon(
      IconData(
        0xe620,
        fontFamily: Constants.IconFontFamily,
      ),
      color: Color(AppColors.ConversationMuteIcon),
      size: Constants.ConversationMuteSize,
    );

    var _right = <Widget>[
      Text(_conversation.updateAt, style: AppStyles.DesStyle),
    ];
    if (_conversation.isMute) {
      _right.add(muteIcon);
    }

    return Container(
      decoration: BoxDecoration(
          color: const Color(AppColors.ConversationItemBbColor),
          border: Border(
              bottom: BorderSide(
                  color: Color(AppColors.DividerColor), width: 1.0))),
      padding: const EdgeInsets.all(10.0),
//      height: 60.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          avatarContainer,
          Container(width: 10.0),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  _conversation.title,
                  style: AppStyles.TitleStyle,
                ),
                Text(_conversation.desc, style: AppStyles.DesStyle),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: _right,
          ),
        ],
      ),
    );
  }
}

class _DeviceInfoItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding:
            EdgeInsets.only(left: 24.0, top: 10.0, right: 24.0, bottom: 10.0),
        decoration: BoxDecoration(
            color: Color(AppColors.DeviceInfoItemBG),
            border: Border(
                bottom: BorderSide(
                    width: 1.0, color: Color(AppColors.DividerColor)))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.computer,
              size: 24.0,
            ),
            SizedBox(
              width: 16.0,
            ),
            Text(
              "微信已登录,手机通知已关闭",
              style: AppStyles.DeviceInfoItemTextStyle,
            )
          ],
        ));
  }
}

class ConversationPage extends StatefulWidget {
  @override
  _ConversationPageState createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return _DeviceInfoItem();
        } else {
          return _ConversationItem(
              conversationMockData['conversation'][index - 1]);
        }
      },
      itemCount: conversationMockData['conversation'].length + 1,
    );
  }
}
