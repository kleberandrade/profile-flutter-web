import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kleberandrade/models/course.dart';

class CourseApi {
  static Future<List<Course>> fetch() async {
    try {
      var url ='https://script.google.com/macros/s/AKfycbyDkS6x-yBzYtD2caq-gMbDu40UFQQa1jOARzmAqMgztmh-AeYv/exec';
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        var list = List<Course>.from( data["courses"].map((x) => Course.fromMap(x)));
        list.shuffle();
        return list;
      } else {
        return List<Course>();
      }
    } catch (error) {
      return List<Course>();
    }
  }
}
