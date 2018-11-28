import 'package:flutter/material.dart';

class AppColors {
  static const AppBarColor = 0xff303030;
  static const TabIconActiveColor = 0xff46c11b;
  static const TabIconNormalColor = 0xff999999;
  static const ConversationTitleColor = 0xff353535;
  static const ConversationDesColor = 0xff9e9e9e;
  static const ConversationItemBbColor = 0xffffffff;
  static const DividerColor = 0xffd9d9d9;
  static const NotifyDotBG = 0xffff3e3e;
  static const NotifyDotText = 0xffffffff;
  static const ConversationMuteIcon = 0xffd8d8d8;
  static const DeviceInfoItemBG = 0xfff5f5f5;
  static const DeviceInfoText = 0xff606062;
  static const TabIconNormal = 0xff999999;
  static const TabIconActive = 0xff46c11b;
  static const AppBarPopupMenuColor = 0xffffffff;
  static const TitleTextColor = 0xff353535;
  static const ConversationItemBg = 0xffffffff;
  static const DesTextColor = 0xff9e9e9e;
  static const NotifyDotBg = 0xffff3e3e;
  static const DeviceInfoItemBg = 0xfff5f5f5;
  static const DeviceInfoItemText = 0xff606062;
  static const DeviceInfoItemIcon = 0xff606062;
  static const ContactGroupTitleBg = 0xffebebeb;
  static const ContactGroupTitleText = 0xff888888;
}

class Constants {
  static const IconFontFamily = "appIconFont";
  static const ConversationAvatarSize = 48.0;
  static const UnreadMsgNotifyDotSize = 18.0;
  static const ConversationMuteSize = 18.0;
  static const DeiceInfoItemHeight = 32.0;
  static const ContactAvatarSize = 36.0;
  static const DividerWidth = 1.0;
}

class AppStyles {
  static const TitleStyle = TextStyle(
    fontSize: 14.0,
    color: Color(AppColors.ConversationTitleColor),
  );

  static const DesStyle = TextStyle(
    fontSize: 12.0,
    color: Color(AppColors.ConversationDesColor),
  );

  static const UnreadMsgCountDotStyle = TextStyle(
    fontSize: 12.0,
    color: Color(AppColors.NotifyDotText),
  );

  static const DeviceInfoItemTextStyle = TextStyle(
    fontSize: 12.0,
    color: Color(AppColors.DeviceInfoText),
  );
}
