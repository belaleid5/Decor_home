import 'package:decor_app/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomToast {
  static void showSuccess(String message) {
    Fluttertoast.showToast(
      msg: "✅ $message",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.green.shade600,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static void showError(String message) {
    Fluttertoast.showToast(
      msg: "❌ $message",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: AppColor.primaryColor,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
