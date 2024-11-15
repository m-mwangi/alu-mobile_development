import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() => runApp(WorldInfoApp());

class WorldInfoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WorldInfo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          bodyMedium: TextStyle(fontSize: 14),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
