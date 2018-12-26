import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:flutter_app/heima/movie_bean.dart';

class CreationMoviePage extends StatefulWidget {
  CreationMoviePage({Key key, @required this.mt}) : super(key: key);

  final String mt;

  @override
  _CreationMoviePageState createState() => _CreationMoviePageState();
}

class _CreationMoviePageState extends State<CreationMoviePage> {
  Dio _dio = Dio();
  int _page = 1;
  int _pageSize = 20;
  var _mList = [];
  var total = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMovieList();
  }

  void getMovieList() async {
    int _offset = (_page - 1) * _pageSize;
    var response = await _dio.get(
        "http://www.liulongbin.top:3005/api/v2/movie/${widget.mt}?start=$_offset&count=$_pageSize");
    var result = response.data;
//    print(result);

    Map movieMap = json.decode(result);
    var movieBean = MovieBean.fromJson(movieMap);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(widget.mt),
    );
  }
}
