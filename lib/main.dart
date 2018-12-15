import 'package:flutter/material.dart';
import 'home/home_screen.dart';

import 'constants.dart' show AppColors;

void main() => runApp(MaApp());

class MaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.light().copyWith(
            primaryColor: Color(AppColors.AppBarColor),
            cardColor: Color(AppColors.AppBarColor)),
        home: HomeScreen());
  }
}