
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:Exam309/lib/models/place.dart';

class ApiService {
  static Future<List<Place>> getAllPlaces() async {
    final response = await http.get(Uri.parse('https://exam309.com/api/places'));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return jsonData.map((place) => Place.fromJson(place)).toList();
    } else {
      throw Exception('Failed to load places');
    }
  }
}