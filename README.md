import 'package:flutter/material.dart';

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
    "test 7",
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

class HomeScreen extends StatefulWidget {
  final List<String> stories;
  final List<String> posts;

  HomeScreen({required this.stories, required this.posts});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Color> _storyColors;

  @override
  void initState() {
    super.initState();
    _storyColors = List<Color>.filled(widget.stories.length, Colors.red);
  }

  void _onStoryTap(int index) {
    setState(() {
      _storyColors[index] =
          _storyColors[index] == Colors.red ? Colors.blue : Colors.red;
    });
    print("Tapped on: ${widget.stories[index]}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.0),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 138, 77, 179),
                Color.fromARGB(255, 207, 149, 94),
                Color.fromARGB(255, 238, 177, 212),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            title: Text("Insta-gramy"),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.stories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(4),
                  child: GestureDetector(
                    onTap: () => _onStoryTap(index),
                    child: Container(
                      width: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _storyColors[index],
                      ),
                      child: Center(
                        child: Text(
                          widget.stories[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.posts.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 2, bottom: 4),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.posts.removeAt(index);
                      });
                    },
                    child: Container(
                      height: 200,
                      color: Colors.red,
                      child: Center(
                        child: Text(widget.posts[index]),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
