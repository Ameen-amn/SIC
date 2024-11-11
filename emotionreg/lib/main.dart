import 'package:emotionreg/pages/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emotion Recognition from Facial Expression',
      theme: ThemeData(
       scaffoldBackgroundColor: Color(0xfff0f0ee),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        "/": (_) => const HomeScreen(),
        HomeScreen.homeScreen: (_) =>  HomeScreen(),
      },
    );
  }
}
