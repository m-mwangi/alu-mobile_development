import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/country.dart';

class ApiService {
  static const String apiUrl = "https://restcountries.com/v3.1";

  /// Searches for countries based on a query string.
  Future<List<Country>> searchCountries(String query) async {
    final response = await http.get(Uri.parse('$apiUrl/name/$query'));
    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((json) => Country.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load countries');
    }
  }

  /// Fetches a single country by its name or code.
  Future<Country> fetchCountry(String code) async {
    final response = await http.get(Uri.parse('$apiUrl/alpha/$code'));
    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return Country.fromJson(data[0]);
    } else {
      throw Exception('Failed to load country details for code: $code');
    }
  }

  /// Fetches neighboring countries based on a list of border country codes.
  Future<List<Country>> fetchNeighbors(List<String> borderCountries) async {
    try {
      final neighbors = await Future.wait(
        borderCountries.map((code) async {
          try {
            final country = await fetchCountry(code);
            print('Fetched country for $code: ${country.name}'); // Debugging
            return country;
          } catch (e) {
            print('Error fetching country $code: $e');
            return null; // Return null if fetching fails
          }
        }),
      );

      // Filter out null values and return the valid neighbors
      return neighbors.whereType<Country>().toList();
    } catch (e) {
      print('Error fetching neighbors: $e');
      return []; // Return an empty list if an error occurs
    }
  }
}
