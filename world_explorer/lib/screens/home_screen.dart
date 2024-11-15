import 'package:flutter/material.dart';
import '../models/country.dart';
import '../services/api_service.dart';
import 'country_details_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  final ApiService _apiService = ApiService();
  List<Country> _countries = [];
  bool _isLoading = false;

  void _searchCountry() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final countries = await _apiService.searchCountries(_controller.text);
      setState(() {
        _countries = countries;
      });
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'World Explorer',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.teal, // Match the AppBar color with other screens
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.teal[50], // Light background color to match other screens
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Enlarged search input field with bold hint text
            TextField(
              controller: _controller,
              style: TextStyle(
                color: Colors.black, // Changed to black for better contrast
                fontSize: 18,
              ),
              decoration: InputDecoration(
                hintText: 'Enter a country name...',
                hintStyle: TextStyle(
                  color: Colors.black54,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal), // Teal border
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                suffixIcon: IconButton(
                  icon: Icon(Icons.search, color: Colors.teal),
                  onPressed: _searchCountry,
                ),
              ),
            ),
            SizedBox(height: 16),

            // Country List
            _isLoading
                ? Center(
                    child: CircularProgressIndicator(), // Corrected typo here
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: _countries.length,
                      itemBuilder: (context, index) {
                        final country = _countries[index];
                        return Card(
                          margin: EdgeInsets.symmetric(vertical: 8),
                          color: Colors.white, // White card color for consistency
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 4,
                          child: ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(country.flagUrl, width: 50, fit: BoxFit.cover),
                            ),
                            title: Text(
                              country.name,
                              style: TextStyle(
                                color: Colors.teal, // Teal color for the title
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              country.region,
                              style: TextStyle(
                                color: Colors.black54, // Darker subtitle color
                                fontSize: 18,
                              ),
                            ),
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => CountryDetailsScreen(country: country),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}