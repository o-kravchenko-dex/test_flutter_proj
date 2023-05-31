

import 'package:flutter/material.dart';
import 'package:untitled_flutter_pr/shared/widgets/label/label.dart';

class GraphScreen extends StatefulWidget {
  final String title;
  const GraphScreen({super.key, required this.title});

  @override
  State<StatefulWidget> createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Label(widget.title)),
      body: const Text("Donut graph"),
    );
  }

}