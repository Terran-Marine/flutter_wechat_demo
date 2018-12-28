import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:flutter_app/heima/movie_bean.dart';
import 'package:flutter_app/heima/MovieDetailPage.dart';

class CreationMoviePage extends StatefulWidget {
  CreationMoviePage({Key key, @required this.mt}) : super(key: key);

  final String mt;

  @override
  _CreationMoviePageState createState() => _CreationMoviePageState();
}

class _CreationMoviePageState extends State<CreationMoviePage>
    with AutomaticKeepAliveClientMixin {
  Dio _dio = Dio();
  int _page = 1;
  int _pageSize = 20;
  var _mList = <Subjects>[];
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

    var movieBean = MovieBean.fromJson(result);

    setState(() {
      _mList.addAll(movieBean.subjects);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: _mList.length,
          itemBuilder: (BuildContext context, int index) {
            var movie = _mList[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MovieDetailPage(
                    id: movie.id,
                    title: movie.title,
                  );
                }));
              },
              child: Card(
                elevation: 8.0,
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Image.network(
                        movie.images.medium,
                        width: 130,
                        height: 180,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10.0),
                      height: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: 200,
                            child: Text(
                              "电影名称: ${movie.title}",
                              overflow: TextOverflow.fade,
                              softWrap: false,
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Text("上映年份: ${movie.year}"),
                          Text("电影类型: ${movie.genres.join(",")}"),
                          Text("电影评分: ${movie.rating.average}"),
                          Container(
                            width: 200,
                            child: Text(
                              "电影名称: ${movie.title}",
                              overflow: TextOverflow.fade,
                              softWrap: false,
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
