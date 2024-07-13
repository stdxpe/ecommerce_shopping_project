import 'package:flutter/services.dart';

class SystemChromeSetup {
  ///
  /// Device Screen Orientation is Portrait Mode Only

  setDeviceOrientation() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }
}
