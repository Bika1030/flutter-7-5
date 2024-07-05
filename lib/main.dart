import 'package:flutter/material.dart';
import 'package:my_first_app/home_page.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage()
    );  
  }
}
