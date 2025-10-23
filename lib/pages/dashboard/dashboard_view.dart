import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notify_cast/common/app_colors.dart';
import 'package:notify_cast/pages/dashboard/dashboard_controller.dart';

/// A view class representing the dashboard screen with bottom navigation.
class DashboardView extends StatelessWidget {
  DashboardView({super.key});

  final DashboardController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx((){
        return IndexedStack(
          index: controller.selectedIndex.value,
          children: controller.pages,
        );
      }),
      bottomNavigationBar: Obx((){
        return BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          onTap: (index) => controller.changeIndex(index),
          backgroundColor: AppColors.colorWhite,
          selectedIconTheme: IconThemeData(color: AppColors.colorPrimary),
          selectedItemColor: AppColors.colorPrimary,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.notification_add),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.video_camera_solid),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '',
            ),
          ],
        );
      }),
    );
  }
}
