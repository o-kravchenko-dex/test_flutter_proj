import 'package:flutter/material.dart';
import 'package:untitled_flutter_pr/routes/app_router.dart';

void main() {
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




