import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kleberandrade/models/course.dart';

class CourseApi {
  static Future<List<Course>> fetch() async {
    try {
      var url =
          'https://script.google.com/macros/s/AKfycbyDkS6x-yBzYtD2caq-gMbDu40UFQQa1jOARzmAqMgztmh-AeYv/exec';
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        return List<Course>.from(data["courses"].map((x) => Course.fromMap(x)));
      } else {
        return <Course>[];
      }
    } catch (error) {
      return <Course>[];
    }
  }
}
