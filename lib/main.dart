import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:untitled_flutter_pr/api/api.dart';
import 'package:untitled_flutter_pr/bloc/bloc.dart';
import 'package:untitled_flutter_pr/models/detailed_transaction.dart';
import 'package:untitled_flutter_pr/models/models.dart';
import 'package:untitled_flutter_pr/routes/app_router.dart';

Future<void> initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BaseTransactionAdapter());
  Hive.registerAdapter(DetailedTransactionAdapter());
  Hive.registerAdapter(TransactionTypeAdapter());
}

Future<void> initAppTools() async {
  await initHive();
  await MockDataGenerator().init();
}

void main() async {
  await initAppTools();

  final storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );
  HydratedBloc.storage = storage;

  runApp(const FlutterTest());
}

class FlutterTest extends StatelessWidget {
  const FlutterTest({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TransactionsBloc()),
      ],
      child: MaterialApp.router(
        title: "Flutter Test Project",
        routerConfig: AppRouter().router,
      ),
    );
  }
}
