# Appimport 'package:flutter/material.dart';

void main() {
  runApp(BasicInstagramClone());
}

class BasicInstagramClone extends StatelessWidget {
  BasicInstagramClone({super.key});

  final List _stories = [
    "prens 1",
    "prens 2",
    "prens 3",
    "Dili prens 4",
    "test 5",
    "test 6",
    "test 7",
  ];

  void _onStoryTap(String story) {
    print("Tapped on: $story");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
                itemCount: _stories.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(4),
                    child: GestureDetector(
                      onTap: () => _onStoryTap(_stories[index]), // Handle tap
                      child: Container(
                        width: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [Color.fromARGB(255, 70, 55, 138), Colors.red], // Define your gradient colors
                            begin: Alignment.topLeft, // Starting point
                            end: Alignment.bottomRight, // Ending point
                          ),
                        ),
                        child: Center(
                          child: Text(
                            _stories[index],
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: GridView.builder(
                itemCount: 5,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 24, 40, 66),
                        borderRadius: BorderRadius.circular(10),
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
