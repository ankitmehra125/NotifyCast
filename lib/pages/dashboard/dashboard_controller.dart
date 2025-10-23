import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

/// A controller for managing dashboard-related logic and state.
class DashboardController extends GetxController {
  var selectedIndex = 0.obs;

  final List<Widget> pages = [
    Container(),
    Container(),
    Container(),
  ];

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}