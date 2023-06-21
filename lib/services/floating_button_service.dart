import 'package:untitled_flutter_pr/models/models.dart';

class FloatingButtonService {
  static String getButtonNameByType(FloatingButtonType type) =>
      type == FloatingButtonType.decrement ? "Decrement" : "Increment";
}
