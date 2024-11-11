import 'package:flutter/material.dart';

class CustomButtonStyle {
  static ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
      backgroundColor: Colors.amber,
      minimumSize: const Size(180, 50),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12))));
}
