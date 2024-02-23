import 'dart:math';

class GeneralUtils {
  static String getUniqueAvatar() {
    return "https://avatar.iran.liara.run/public/${Random().nextInt(100)}";
  }
}
