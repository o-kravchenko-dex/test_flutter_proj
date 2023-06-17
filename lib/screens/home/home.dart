import 'package:flutter/material.dart';
import 'package:untitled_flutter_pr/models/models.dart';
import 'package:untitled_flutter_pr/routes/helpers/navigation_helper.dart';
import 'package:untitled_flutter_pr/screens/home/widgets/home_floating_button.dart';

class Home extends StatelessWidget {
  final int index;

  Home({super.key, required this.index});

  int _counter = 0;

  String getTitle(int widgetIndex) =>
      NavigationHelper.getTabNameByIndx(widgetIndex);

  // void _incrementCounter() {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Current index is $index'),
          const Text(
            'You have pushed the button this many times:',
          ),
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ],
      ),
    );
  }
}
