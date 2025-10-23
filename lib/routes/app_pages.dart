import 'package:get/get.dart';
import 'package:notify_cast/pages/dashboard/dashboard_binding.dart';
import 'package:notify_cast/pages/dashboard/dashboard_view.dart';
import 'package:notify_cast/pages/splash/splash_binding.dart';
import 'package:notify_cast/pages/splash/splash_view.dart';
import 'package:notify_cast/routes/app_routes.dart';

/// A class that manages the routes of the application.
class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.routeSplash,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.routeDashboard,
      page: () => DashboardView(),
      binding: DashboardBinding()
    )
  ];
}
