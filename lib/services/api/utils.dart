import 'dart:convert';
import 'package:http/http.dart' as http;

Future<dynamic> getJsonResponse(String url) async {
  http.Response response = await http.get(url);
  return jsonDecode(response.body);
}