import 'package:flutter/material.dart';
import '../services/api_service.dart'; // Make sure this service is correctly implemented
import '../models/country.dart'; // Ensure this model is correctly defined

class NeighborsScreen extends StatelessWidget {
  final List<String> borderCountries;

  NeighborsScreen({required this.borderCountries});

  final ApiService _apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Neighboring Countries', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.teal, // Change the AppBar color
      ),
      body: FutureBuilder<List<Country>>(
        future: _apiService.fetchNeighbors(borderCountries),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Error loading neighbors: ${snapshot.error}',
                  style: TextStyle(fontSize: 18, color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text(
                'No neighbors found',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            );
          } else {
            final neighbors = snapshot.data!;
            return ListView.builder(
              itemCount: neighbors.length,
              itemBuilder: (context, index) {
                final neighbor = neighbors[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  elevation: 4,
                  child: ListTile(
                    contentPadding: EdgeInsets.all(16),
                    leading: Icon(Icons.flag, size: 40, color: Colors.teal),
                    title: Text(
                      neighbor.name,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'Capital: ${neighbor.capital ?? "N/A"}',
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}