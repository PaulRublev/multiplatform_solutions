import 'dart:io';

import 'package:flutter/foundation.dart';

class AppPlatform {
  static const Map<String, CustomPlatform> _platformMap = {
    'linux': CustomPlatform.linux,
    'macos': CustomPlatform.macos,
    'windows': CustomPlatform.windows,
    'ios': CustomPlatform.ios,
    'fuchsia': CustomPlatform.fuchsia,
    'android': CustomPlatform.android,
  };

  static CustomPlatform _getPlatform() {
    if (kIsWeb) {
      return CustomPlatform.web;
    }

    return _platformMap[Platform.operatingSystem] ?? CustomPlatform.undefined;
  }

  static CustomPlatform get platform => _getPlatform();

  static bool get isMobile {
    if (_getPlatform() == CustomPlatform.android ||
        _getPlatform() == CustomPlatform.ios) {
      return true;
    }

    return false;
  }
}

enum CustomPlatform {
  linux,
  macos,
  windows,
  ios,
  fuchsia,
  android,
  web,
  undefined;

  @override
  String toString() => name;
}
