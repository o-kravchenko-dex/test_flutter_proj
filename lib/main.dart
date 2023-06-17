import 'package:flutter/material.dart';
import 'package:untitled_flutter_pr/screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _tabIndex = 0;

  final _tabs = <Widget>[
    Home(index: 0),
    Settings(index: 1)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
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
      body: _tabs[_tabIndex],
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
