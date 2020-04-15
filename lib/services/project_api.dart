import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kleberandrade/models/project.dart';

class ProjectApi {
  static Future<List<Project>> fetch() async {
    try {
      var url ='https://script.google.com/macros/s/AKfycbzEN7MqHrU-a2V3BBlCbmYoGoR3boH1SZcVWgw9BPI51WrsIDXN/exec';
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        return List<Project>.from(data["projects"].map((x) => Project.fromMap(x)));
      } else {
        return List<Project>();
      }
    } catch (error) {
      return List<Project>();
    }
  }
}
