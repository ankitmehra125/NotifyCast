import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notify_cast/common/app_colors.dart';
import 'package:notify_cast/lang/languages.dart';
import 'package:notify_cast/routes/app_pages.dart';
import 'package:notify_cast/routes/app_routes.dart';

/// The main entry point of the application .
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyD-oV9dlBaq_Ak9A89TwQghLYHJ9ERwMHA",
        appId: "1:893560595813:android:fbccbf19da9dc59099ad8c",
        messagingSenderId: "893560595813",
        projectId: "notifycast-a7a30"
    )
  );
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  runApp(const MyApp());
}

// Function to handle the background message
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async{
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
        child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            getPages: AppPages.pages,
            translations: Languages(),
            theme: ThemeData(
              scaffoldBackgroundColor: AppColors.colorBg,
              splashFactory: NoSplash.splashFactory,
              highlightColor: Colors.transparent,
              textSelectionTheme: TextSelectionThemeData(selectionHandleColor: Colors.transparent),
            ),
            defaultTransition: Transition.rightToLeft,
            initialRoute: AppRoutes.routeSplash,
            locale: Locale('en', 'US')
        )
    );
  }
}




