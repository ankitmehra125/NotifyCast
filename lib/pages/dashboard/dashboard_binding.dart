import 'package:get/get.dart';
import 'package:notify_cast/pages/dashboard/dashboard_controller.dart';

/// A binding class to manage dependencies for the Dashboard module.
class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());
  }
}