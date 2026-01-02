import 'package:flutter/material.dart%20';
import 'package:untitled7/wetherapp.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  const MyApp({super.key});


  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
          brightness: Brightness.dark,
        ),
      ),
      home: WeatherAppScreen(),
    );
  }
}
