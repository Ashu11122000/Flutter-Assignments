import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie.dart';

class ApiService {
  // Asynchronous function fetching a list of movies based on a query string
  Future<List<Movie>> searchMovies(String query) async {
    final encodedQuery = Uri.encodeComponent(query);
    final url = Uri.parse('https://api.tvmaze.com/search/shows?q=$encodedQuery');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> decodedData = json.decode(response.body);
        return decodedData.map((jsonItem) => Movie.fromJson(jsonItem)).toList();
      } else {
        throw Exception('Failed to load movies. Server error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error occurred: $e');
    }
  }
}