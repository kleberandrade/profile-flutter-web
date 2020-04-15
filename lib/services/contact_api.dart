import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:kleberandrade/models/contact.dart';

class ContactApi {
  static Future<Response> fetch(Contact contact) async {
    try {
      var url =
          'https://script.google.com/macros/s/AKfycbxOjOnonM8anZ4MD1ZxI7OHe4kXmoqC6SUtPUdhEKxpYP-3Mw4/exec';
      var response = await http.get(url + contact.toParams());
      return response;
    } catch (error) {
      return null;
    }
  }
}
