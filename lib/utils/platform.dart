import 'dart:io';

class PlatformUtils {
  static bool isMobile() {
    return Platform.isAndroid || Platform.isIOS;
  }

  static bool isDesktop() {
    return Platform.isWindows || Platform.isLinux || Platform.isMacOS;
  }
}
