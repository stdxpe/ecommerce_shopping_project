import 'package:flutter/services.dart';

class AppSystemChromeSetups {
  ///
  /// Device Screen Orientation is Portrait Mode Only

  setDeviceOrientation() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }
}
