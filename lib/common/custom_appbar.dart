import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:notify_cast/common/app_colors.dart';
import 'package:notify_cast/common/app_fonts.dart';
import 'package:notify_cast/common/common_ui.dart';
import 'package:notify_cast/common/font_sizes.dart';
import 'package:notify_cast/global.dart';

/// A custom app bar widget that supports a back button, title, and title image.
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.appBarHeight = 56,
    this.backgroundColor = AppColors.colorPrimary,
    this.showBackButton = false,
    this.title = "",
    this.titleFontSize = AppFontSizes.font16,
    this.titleColor = AppColors.colorWhite,
    this.trailingIcon = "",
    this.onTrailingIconTap,
    this.isCenterTitle = true,
    this.isTrailingText = false,
    this.trailingText = "",
    this.onTapBack,
    this.isLeadingText = false,
    this.onLeadingTap, this.onWalletTap,
  });

  final double appBarHeight;
  final Color backgroundColor;
  final bool showBackButton;
  final String title;
  final double titleFontSize;
  final Color titleColor;
  final String trailingIcon;
  final bool isCenterTitle;
  final Function()? onTrailingIconTap;
  final bool isTrailingText;
  final String trailingText;
  final void Function()? onTapBack;
  final bool isLeadingText;
  final void Function()? onLeadingTap;
  final void Function()? onWalletTap;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      backgroundColor: backgroundColor,
      surfaceTintColor: backgroundColor,
      toolbarHeight: appBarHeight,
      iconTheme: IconThemeData(color: AppColors.colorWhite),
      centerTitle: isCenterTitle,
      title: Text(title, style: CommonUi.customTextStyle(
          color: AppColors.colorWhite,
          fontSize: AppFontSizes.font18,
          fontFamily: AppFonts.fontBold
      ),),
      leading: showBackButton ? GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            Global.hapticFeedback();
            Global.hideKeyboard();
            Get.back();
            onLeadingTap?.call();
          },
          child: Padding(padding: EdgeInsets.only(left: Global.appHzPadding), child: Icon(Icons.arrow_back_ios))
      ) : null,
      titleSpacing: Global.appHzPadding,
      actionsPadding: EdgeInsets.only(right: Global.appHzPadding),
      leadingWidth: 40,
      actions: [
        trailingIcon.isEmpty ? SizedBox() : GestureDetector(
            onTap: () {
              Global.hapticFeedback();
              onTrailingIconTap?.call();
            },
            child: SvgPicture.asset(trailingIcon)
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
}


