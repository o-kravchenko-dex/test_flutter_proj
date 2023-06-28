import 'package:appwrite/appwrite.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled_flutter_pr/shared/shared.dart';

class BaseAppwriteApi extends ChangeNotifier {
  Client client = Client();
  late final Account account;

  init() {
    client
        .setEndpoint(APPWRITE_URL)
        .setProject(APPWRITE_PROJECT_ID)
        .setSelfSigned();
  }
}
