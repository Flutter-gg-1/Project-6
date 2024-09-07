import 'package:flutter/material.dart';

extension Nav on BuildContext {
  push({required Widget screen, Function(dynamic)? onBack}) {
    Navigator.push(this, MaterialPageRoute(builder: (context) => screen))
        .then((valueReturn) {
      if (onBack != null) {
        onBack(valueReturn);
      }
    });
  }

  pushReplacement({required Widget screen}) {
    Navigator.pushReplacement(
      this,
      MaterialPageRoute(builder: (context) => screen)
    );
  }

  pushRemoveUntil({required Widget screen}) {
    Navigator.pushAndRemoveUntil(
      this,
      MaterialPageRoute(builder: (context) => screen),
      (predicate) => false
    );
  }

  pop() {
    Navigator.pop(this);
  }
}
