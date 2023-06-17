import 'package:flutter/material.dart';
import 'package:untitled_flutter_pr/routes/helpers/navigation_helper.dart';

class Settings extends StatelessWidget {
  final int index;

  Settings({super.key, required this.index});

  late final String title = NavigationHelper.getTabNameByIndx(index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Text('Current tab index is $index'),
      ),
    );
  }
}
