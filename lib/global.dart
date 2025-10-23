import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:notify_cast/common/app_colors.dart';

/// A class to store all the global constants used in the app.
class Global {
  static const double appHzPadding = 20.0;
  static const double appBottomSpace = 20.0;

  /// Function to hide the keyboard when the user taps outside the text field.
  static hideKeyboard() => FocusManager.instance.primaryFocus?.unfocus();

  /// Function to check if keyboard is open or not
  static bool isKeyboardOpen(BuildContext context) {
    return MediaQuery.of(context).viewInsets.bottom > 0;
  }

  /// Function for haptic feedback
  static void hapticFeedback() {
    if (GetPlatform.isIOS) {
      HapticFeedback.lightImpact();
    } else {
      HapticFeedback.vibrate();
    }
  }

  /// Function for custom toast messages.
  static void customToast({
    required String message,
    ToastGravity gravity = ToastGravity.BOTTOM,
    Color backgroundColor = AppColors.colorRed,
    double fontSize = 16.0,
    Toast toastLength = Toast.LENGTH_SHORT,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: toastLength,
      gravity: gravity,
      backgroundColor: backgroundColor,
      textColor: AppColors.colorWhite,
      fontSize: fontSize,
    );
  }
}
