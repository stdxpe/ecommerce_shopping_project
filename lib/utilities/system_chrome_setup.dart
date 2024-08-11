import 'package:flutter/services.dart';

/// Device Screen Orientation is Portrait Mode Only

void setDeviceOrientationToPortraitModeOnly() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}
