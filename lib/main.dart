import 'package:flutter/material.dart';
import 'package:moview_news/movies_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies Challenge',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MoviewsReview(),
    );
  }
}
