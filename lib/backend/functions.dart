import 'dart:convert';

import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> searchFunctionBackend(String ticker) async {
  Map<String, dynamic> request = {"quote": ticker};

  print(request);
  print(10);
  try {
    print(14);
    final response = await http.post(
      Uri.parse(
          "https://stock-price-prediction-ml.onrender.com/search?quote=$ticker"),
    );

    print(13);
    print(response.body);
    print(18);
    return jsonDecode(response.body);
  } catch (e) {
    print(31);
    print(e.toString());
  }
  return {};
}

Future<Map<String,dynamic>> getSentimentForNews(String news) async{
  Map<String, dynamic> request = {"news": news};

  print(request);
  print(10);
  try {
    print(14);
    final response = await http.post(
      Uri.parse(
          "https://stock-price-prediction-ml.onrender.com/get_sentiment?news=$news"),
    );

    print(13);
    print(response.body);
    print(18);
    return jsonDecode(response.body);
  } catch (e) {
    print(31);
    print(e.toString());
  }
  return {};
}
