import 'package:flutter/material.dart';
import 'package:untitled_flutter_pr/api/api.dart';
import 'package:untitled_flutter_pr/routes/app_router.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> initAppTools() async{
  await Hive.initFlutter();
  await MockDataGenerator().init();
}

void main() async {
  await initAppTools();

  runApp(const FlutterTest());
}

class FlutterTest extends StatelessWidget {
  const FlutterTest({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Flutter Test Project",
      routerConfig: AppRouter().router,
    );
  }
}




