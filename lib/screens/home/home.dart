import 'package:flutter/material.dart';
import 'package:untitled_flutter_pr/common/common.dart';
import 'package:untitled_flutter_pr/models/models.dart';
import 'package:untitled_flutter_pr/routes/helpers/navigation_helper.dart';
import 'package:untitled_flutter_pr/services/services.dart';

class Home extends StatefulWidget {
  final int index;

  const Home({super.key, required this.index});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _counter = 0;

  String getButtonName(FloatingButtonType type) {
    return FloatingButtonService.getButtonNameByType(type);
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  String getTitle(int widgetIndex) =>
      NavigationHelper.getTabNameByIndx(widgetIndex);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Current index is ${widget.index}'),
          const Text(
            'You have pushed the button this many times:',
          ),
          Text(
            _counter.toString(),
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingButton(
                type: FloatingButtonType.decrement,
                onTap: _decrementCounter,
                title: getButtonName(FloatingButtonType.decrement),
              ),
              FloatingButton(
                type: FloatingButtonType.increment,
                onTap: _incrementCounter,
                title: getButtonName(FloatingButtonType.increment),
              ),
            ],
          )
        ],
      ),
    );
  }
}
