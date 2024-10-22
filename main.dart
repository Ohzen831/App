import 'package:flutter/material.dart';
import 'home_page.dart'; // Import the home_page.dart file

void main() {
  runApp(BasicInstagramClone());
}

class BasicInstagramClone extends StatelessWidget {
  BasicInstagramClone({super.key});

  final List<String> _stories = [
    "prens 1",
    "prens 2",
    "prens 3",
    "Dili prens 4",
    "test 5",
    "test 6",
    "test 8",
    "test 9",
    "t",
    "gwapoko",
    "Weee",
  ];

  final List<String> _posts = [
    "Post 1",
    "Post 2",
    "Post 3",
    "Post 4",
    "Post 5",
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(stories: _stories, posts: _posts),
    );
  }
}
