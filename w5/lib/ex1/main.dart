import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[400],
        appBar: AppBar(
          title: const Text('My Hobbies'),
        ),
        body: const Padding(
          padding: EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HobbyCard(
                title: 'Travelling',
                icon: Icons.search,
                backgroundColor: Colors.green,
              ),
              HobbyCard(
                title: 'Skating', 
                icon: Icons.skateboarding, 
                backgroundColor: Colors.grey
                ),
            ]
          ),
        )
      ),
    )
  );
}

class HobbyCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color? backgroundColor;

  const HobbyCard({
    super.key,
    required this.title,
    required this.icon,
    this.backgroundColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child:  Center(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 20),
                    child: Icon(
                      icon,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                       title,
                       style: const TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                    )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
