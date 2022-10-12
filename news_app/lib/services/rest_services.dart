// https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=7c1625295a414443b68d4f6897cb892e
import 'dart:convert';

import 'package:http/http.dart' as http;

String _apiKey = "7c1625295a414443b68d4f6897cb892e";

class RestService {
  final String _baseUrl =
      "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=$_apiKey";

  Future get() async {
    final response = await http.get(
      Uri.parse(_baseUrl),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    throw response.statusCode;
  }
}
