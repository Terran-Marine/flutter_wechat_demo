import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';

class HttpManager {
  var httpClient = new HttpClient();

  get() async {
    var uri = new Uri.http('http://47.100.46.19/', 'box/api/xxx',
        {'key1': 'value1', 'key2': 'value2'});
    var request = await httpClient.getUrl(uri);

    var response = await request.close();
    var responseBody = await response.transform(utf8.decoder).join();
    var data = json.decode(responseBody);
    var result = data('origin');
  }
}