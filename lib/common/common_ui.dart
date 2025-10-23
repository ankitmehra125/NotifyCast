import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/platform/platform.dart';
import 'package:notify_cast/common/app_colors.dart';
import 'package:notify_cast/common/app_fonts.dart';
import 'package:notify_cast/common/font_sizes.dart';
import 'package:notify_cast/global.dart';

/// A utility class that holds common UI elements used throughout the app.
class CommonUi {
  /// A custom text style that can be used throughout the app.
  static TextStyle customTextStyle({
    double fontSize = AppFontSizes.font14,
    Color color = AppColors.colorBlack,
    String fontFamily = AppFonts.fontMedium,
    double? height,
    Color? decorationColor,
    FontWeight? fontWeight,
    TextDecoration textDecoration = TextDecoration.none,
  }) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      fontFamily: fontFamily,
      decoration: textDecoration,
      decorationColor: decorationColor,
      height: height,
    );
  }

  /// A common bottom padding widget that adjusts its height based on the platform.
  static bottomPadding(BuildContext context) {
    return SizedBox(height: Global.isKeyboardOpen(context) ? Global.appBottomSpace : (GetPlatform.isAndroid ? Global.appBottomSpace : 0));
  }

  /// A custom decoration for containers and other widgets with shadow and rounded corners.
  static BoxDecoration customBoxDecoration({
    Color color = AppColors.colorWhite,
    double borderRadius = 10,
    Color shadowColor = Colors.black12,
    double blurRadius = 7,
    double spreadRadius = 0,
    Offset offset = const Offset(0, 0),
  }) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(borderRadius),
      boxShadow: [
        BoxShadow(
          color: shadowColor,
          blurRadius: blurRadius,
          spreadRadius: spreadRadius,
          offset: offset,
        ),
      ],
    );
  }
}
