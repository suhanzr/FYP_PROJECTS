import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomToast {
  static void success(String text) {
    _showToast(text, const Color.fromARGB(255, 2, 212, 62), Icons.check);
  }

  static void warn(String text) {
    _showToast(text, const Color.fromARGB(255, 245, 192, 101),
        Icons.info_outline_rounded);
  }

  static void error(String text) {
    _showToast(text, const Color.fromARGB(255, 255, 21, 0), Icons.cancel);
  }

  static void _showToast(String text, Color color, IconData icon) {
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 14.0,
    );
  }
}
