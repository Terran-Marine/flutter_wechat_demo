import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app/heima/movie_detail_bean.dart';

class MovieDetailPage extends StatefulWidget {
  final String id;

  final String title;

  MovieDetailPage({Key key, @required this.id, @required this.title})
      : super(key: key);

  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  Dio _dio = Dio();

  @override
  void initState() {
    super.initState();
  }

  void getMovieDetail() async {
    var response = await _dio.get(
        "http://www.liulongbin.top:3005/api/v2/movie/subject/${widget.id}");
    var result = response.data;
    var movieBetailBean = MovieDetailBean.fromJson(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title),),
      body: Text(widget.id),
    );
  }
}
