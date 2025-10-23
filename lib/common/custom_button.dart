import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notify_cast/common/app_colors.dart';
import 'package:notify_cast/common/app_fonts.dart';
import 'package:notify_cast/common/common_ui.dart';
import 'package:notify_cast/common/font_sizes.dart';
import 'package:notify_cast/global.dart';

/// A custom Button widget that can be used throughout the application.
class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  final Color backgroundColor;
  final Color foregroundColor;
  final bool enabled;
  final bool isLoading;
  final double buttonMargin;
  final Color disabledColor;
  final Color disabledTextColor;
  final double borderRadius;
  final bool showBorder;
  final double textFontSize;
  final double buttonHeight;
  final double buttonWidth;
  final Color borderColor;
  final Color textColor;
  final bool isTitleStart;
  final String titleIcon;
  final String textFontFamily;
  final double leftPadding;
  final double rightPadding;

  const CustomButton({
    super.key,
    this.onPressed,
    required this.title,
    this.backgroundColor = AppColors.colorPrimary,
    this.foregroundColor = AppColors.colorPrimary,
    this.enabled = true,
    this.isLoading = false,
    this.buttonMargin = 0,
    this.borderRadius = 10,
    this.textFontSize = AppFontSizes.font18,
    this.disabledColor = AppColors.colorDisabled,
    this.disabledTextColor = AppColors.colorWhite,
    this.showBorder = false,
    this.buttonHeight = 58,
    this.buttonWidth = double.infinity,
    this.borderColor = AppColors.colorSilverGrey,
    this.textColor = AppColors.colorWhite,
    this.isTitleStart = false,
    this.titleIcon = '',
    this.textFontFamily = AppFonts.fontBold,
    this.leftPadding = 0,
    this.rightPadding = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: buttonHeight,
      width: buttonWidth,
      margin: EdgeInsets.symmetric(horizontal: buttonMargin),
      child: ElevatedButton(
        onPressed: enabled
            ? () {
          Global.hapticFeedback();
          Global.hideKeyboard();
          onPressed?.call();
        }
            : null,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.only(left: leftPadding, right: rightPadding),
          surfaceTintColor: backgroundColor,
          disabledBackgroundColor: enabled ? backgroundColor : disabledColor,
          backgroundColor: backgroundColor,
          foregroundColor: backgroundColor,
          shadowColor: Colors.transparent,
          alignment: isTitleStart ? Alignment.centerLeft : Alignment.center,
          shape: RoundedRectangleBorder(
              side: BorderSide(
                color: showBorder ? borderColor : Colors.transparent,
                width: showBorder ? 1.5 : 0,
              ),
              borderRadius: BorderRadius.circular(borderRadius)),
        ),
        child: isLoading
            ? Transform.scale(scale: 0.8, child: CircularProgressIndicator(color: textColor,))
            : Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (titleIcon.isNotEmpty) ...{
              Padding(padding: const EdgeInsets.only(right: 8.0), child: SvgPicture.asset(titleIcon,)),
            },
            Text(title, style: CommonUi.customTextStyle(
              fontSize: textFontSize,
              color: enabled ? textColor : disabledTextColor,
              fontFamily: textFontFamily,
            )),
          ],
        ),
      ),
    );
  }
}
