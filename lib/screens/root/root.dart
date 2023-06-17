import 'package:flutter/material.dart';
import 'package:untitled_flutter_pr/routes/routes.dart';
import 'package:untitled_flutter_pr/screens/screens.dart';
class RootWidget extends StatefulWidget {
  const RootWidget({super.key});

  @override
  State<RootWidget> createState() => _RootWidgetState();
}

class _RootWidgetState extends State<RootWidget> {
  int _tabIndex = 0;
  String getTitle(int tabIndex) =>  NavigationHelper.getTabNameByIndx(tabIndex);

  final _tabs = <Widget>[
    const Home(index: 0),
    Settings(index: 1)
  ];


  @override
  Widget build(BuildContext context) {
    final title = getTitle(_tabIndex);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home" ),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings" ),
        ],
        currentIndex: _tabIndex,

        onTap: (index) {
          if (index != _tabIndex) {
            setState(() {
              _tabIndex = index;
            });
          }
        },
      ),
      body: IndexedStack(
        index: _tabIndex,
        children: _tabs,
      ),
      // floatingActionButton: Row(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     HomeFloatingButton(type: FloatingButtonType.increment, onTap: _incrementCounter),
      //     HomeFloatingButton(type: FloatingButtonType.decrement, onTap: _decrementCounter),
      //   ],
      // ),
    );
  }
}
