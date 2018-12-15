import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart' show Constants, AppColors;

class FullWidthIconBtn extends StatelessWidget {
  static const HORIZONTAL_PADDING = 20.0;
  static const VERTICAL_PADDING = 13.0;

  FullWidthIconBtn({
    @required this.iconPath,
    @required this.title,
    this.onPressed,
    this.showDivider: false,
  }) : assert(iconPath != null, title != null);

  final String title;
  final String iconPath;
  final VoidCallback onPressed;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    final item = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          iconPath,
          width: Constants.FullWidthIconBtnIconSize,
          height: Constants.FullWidthIconBtnIconSize,
        ),
        SizedBox(
          width: HORIZONTAL_PADDING,
        ),
        Text(title),
      ],
    );

    return FlatButton(
        color: Colors.white,
        onPressed: onPressed,
        padding: EdgeInsets.only(
            left: HORIZONTAL_PADDING,
            right: HORIZONTAL_PADDING,
            top: VERTICAL_PADDING,
            bottom: 0.0),
        child: Container(
          padding: EdgeInsets.only(bottom: VERTICAL_PADDING),
          decoration: showDivider
              ? BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: Color(AppColors.DividerColor),
                          width: Constants.DividerWidth)))
              : BoxDecoration(
                  color: Colors.transparent,
                ),
          child: item,
        ));
  }
}
