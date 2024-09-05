import 'package:flutter/material.dart';

extension GetSize on BuildContext {
  getScreenSize({double? multiplyWidth = 1}) {
    return MediaQuery.of(this).size.width * multiplyWidth!;
  }
}