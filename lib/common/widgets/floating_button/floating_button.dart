import 'package:flutter/material.dart';
import 'package:untitled_flutter_pr/models/models.dart';

class FloatingButton extends StatelessWidget {
  final FloatingButtonType type;
  final GestureTapCallback onTap;
  final String title;

  const FloatingButton({super.key, required this.type, required this.onTap, required this.title});

  @override
  Widget build(context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(16),
        decoration: const BoxDecoration(color: Colors.deepPurpleAccent),
        height: 40,
        width: 100,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
