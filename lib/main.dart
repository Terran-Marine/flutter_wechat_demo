import 'package:flutter/material.dart';
import 'home/home_screen.dart';
import 'bilibili/page/HomePage.dart';
import 'heima/HeimaHomePage.dart';

import 'constants.dart' show AppColors;

void main() => runApp(MyApp());

//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//        theme: ThemeData.light().copyWith(
//            primaryColor: Color(AppColors.AppBarColor),
//            cardColor: Color(AppColors.AppBarColor)),
//        home: HomeScreen());
//  }
//}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HeimaHomePage(),
    );
  }
}
