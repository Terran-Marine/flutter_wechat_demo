import 'package:flutter/material.dart';
import 'package:flutter_app/widget/full_width_icon_btn.dart';
import 'package:flutter_app/constants.dart' show AppColors;

class DiscoverPage extends StatefulWidget {
  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  static const SEPARATE_SIZE = 20.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(AppColors.BackgroundColor),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        reverse: false,
        child: Column(
          children: <Widget>[
            SizedBox(height: SEPARATE_SIZE),
            FullWidthIconBtn(
              iconPath: "images/ic_social_circle.png",
              title: "朋友圈",
              showDivider: false,
              onPressed: () {},
            ),
            SizedBox(height: SEPARATE_SIZE),
            FullWidthIconBtn(
              iconPath: "images/ic_quick_scan.png",
              title: "扫一扫",
              showDivider: true,
              onPressed: () {
                print('点击了扫一扫');
              },
            ),
            FullWidthIconBtn(
              iconPath: "images/ic_shake_phone.png",
              title: "摇一摇",
              showDivider: false,
              onPressed: () {},
            ),
            SizedBox(height: SEPARATE_SIZE),
            FullWidthIconBtn(
              iconPath: "images/ic_feeds.png",
              title: "看一看",
              showDivider: true,
              onPressed: () {},
            ),
            FullWidthIconBtn(
              iconPath: "images/ic_quick_search.png",
              title: "搜一搜",
              showDivider: false,
              onPressed: () {},
            ),
            SizedBox(height: SEPARATE_SIZE),
            FullWidthIconBtn(
              iconPath: "images/ic_people_nearby.png",
              title: "附近的人",
              showDivider: true,
              onPressed: () {},
            ),
            FullWidthIconBtn(
              iconPath: "images/ic_bottle_msg.png",
              title: "漂流瓶",
              showDivider: false,
              onPressed: () {},
            ),
            SizedBox(height: SEPARATE_SIZE),
            FullWidthIconBtn(
              iconPath: "images/ic_shopping.png",
              title: "购物",
              showDivider: true,
              onPressed: () {},
            ),
            FullWidthIconBtn(
              iconPath: "images/ic_game_entry.png",
              title: "游戏",
              showDivider: false,
              onPressed: () {},
            ),
            SizedBox(height: SEPARATE_SIZE),
            FullWidthIconBtn(
              iconPath: "images/ic_mini_program.png",
              title: "小程序",
              showDivider: false,
              onPressed: () {},
            ),
            SizedBox(height: SEPARATE_SIZE),
          ],
        ),
      ),
    );
  }
}