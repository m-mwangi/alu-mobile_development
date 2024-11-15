import 'package:flutter/material.dart';
import '../models/country.dart';
import 'neighbors_screen.dart';

class CountryDetailsScreen extends StatelessWidget {
  final Country country;

  CountryDetailsScreen({required this.country});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          country.name,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal, // Match the AppBar color with NeighborsScreen
      ),
      backgroundColor: Colors.teal[50], // Set a light background color
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(country.flagUrl, height: 150, fit: BoxFit.cover),
                ),
              ),
              SizedBox(height: 16),
              _buildInfoCard('Capital', country.capital),
              _buildInfoCard('Population', country.population.toString()),
              _buildInfoCard('Region', country.region),
              SizedBox(height: 16),
              if (country.borders.isNotEmpty)
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                    ),
                    child: Text(
                      'View Neighbors',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => NeighborsScreen(borderCountries: country.borders),
                        ),
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, String value) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.teal),
            ),
            Text(
              value,
              style: TextStyle(fontSize: 22, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
