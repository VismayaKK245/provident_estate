// lib/api_services.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'data_model.dart';

class ApiService {
  final String apiUrl = 'http://localhost:4001/matching-data';

  Future<List<Data>> fetchData() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Data.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
