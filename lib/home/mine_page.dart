import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart' show AppColors;
import 'package:flutter_app/widget/full_width_icon_btn.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  static const SEPARATE_SIZE = 20.0;
  static const AVATAR_SIZE = 50.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(AppColors.BackgroundColor),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: SEPARATE_SIZE,
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.only(
                  left: 12.0, top: 10, right: 12.0, bottom: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.network(
                    "https://randomuser.me/api/portraits/men/53.jpg",
                    width: AVATAR_SIZE,
                    height: AVATAR_SIZE,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("fdiiposadj"),
                        SizedBox(height: 5.0),
                        Text("微信号:546f5645465s4f5e")
                      ],
                    ),
                  ),
                  Image.asset(
                    "images/ic_rq_code.png",
                    width: 20.0,
                    height: 20.0,
                  )
                ],
              ),
            ),
            SizedBox(
              height: SEPARATE_SIZE,
            ),
            FullWidthIconBtn(
              iconPath: "images/ic_social_circle.png",
              title: "钱包",
              showDivider: false,
              onPressed: () {},
            ),
            SizedBox(
              height: SEPARATE_SIZE,
            ),
            FullWidthIconBtn(
              iconPath: "images/ic_social_circle.png",
              title: "钱包",
              showDivider: true,
              onPressed: () {},
            ),
            FullWidthIconBtn(
              iconPath: "images/ic_social_circle.png",
              title: "钱包",
              showDivider: true,
              onPressed: () {},
            ),
            FullWidthIconBtn(
              iconPath: "images/ic_social_circle.png",
              title: "钱包",
              showDivider: true,
              onPressed: () {},
            ),
            FullWidthIconBtn(
              iconPath: "images/ic_social_circle.png",
              title: "钱包",
              showDivider: false,
              onPressed: () {},
            ),
            SizedBox(
              height: SEPARATE_SIZE,
            ),
            FullWidthIconBtn(
              iconPath: "images/ic_social_circle.png",
              title: "钱包",
              showDivider: false,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}