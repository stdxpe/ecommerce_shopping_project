import 'package:flutter/services.dart';

/// Device Screen Orientation is Portrait Mode Only
void setDeviceOrientation() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}
