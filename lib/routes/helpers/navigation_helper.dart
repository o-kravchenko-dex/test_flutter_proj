import 'package:untitled_flutter_pr/routes/routes.dart';

class NavigationHelper {
  static String getTabNameByIndx(int index) {
    return RoutesNames().names[index];
  }
}