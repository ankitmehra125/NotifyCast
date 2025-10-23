import 'package:get/get.dart';
import 'package:notify_cast/lang/strings.dart';

/// This class is used to store all the translations used in the app
class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          Strings.textAppName: "NotifyCast",
        },
      };
}
