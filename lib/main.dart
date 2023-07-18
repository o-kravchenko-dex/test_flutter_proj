import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Welcome to Flutter',
      home: RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({super.key});

  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.blueGrey,
      child:InteractiveViewer(
        child: Column(
          children: [
            Image.network('https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D&w=1000&q=80', height: 500,),
            OutlinedButton(onPressed: () {}, child: const Text("hellot"))
          ],
        ),
      ));
  }
}
