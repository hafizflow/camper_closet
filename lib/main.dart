import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_extension/core/routes/app_pages.dart';
import 'package:flutter_extension/core/routes/app_routes.dart';
import 'package:flutter_extension/core/theme/dark_theme.dart';
import 'package:flutter_extension/core/theme/light_theme.dart';
import 'package:flutter_extension/core/constants/app_constants.dart';
import 'package:flutter_extension/shared/utils/message.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'core/localization/localization_controller.dart';
import 'core/theme/theme_controller.dart';
import 'helper/get_di.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  Map<String, Map<String, String>> languages = await di.init();
  runApp(MyApp(languages: languages));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.languages});
  final Map<String, Map<String, String>> languages;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (themeController) {
        return GetBuilder<LocalizationController>(
          builder: (localizeController) {
            return ScreenUtilInit(
              designSize: const Size(375, 812),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (_, child) {
                return GetMaterialApp(
                  title: AppConstants.APP_NAME,
                  debugShowCheckedModeBanner: false,
                  navigatorKey: Get.key,
                  theme: themeController.darkTheme ? dark() : light(),
                  defaultTransition: Transition.topLevel,
                  locale: localizeController.locale,
                  translations: Messages(languages: languages),
                  fallbackLocale: Locale(
                    AppConstants.languages[0].languageCode,
                    AppConstants.languages[0].countryCode,
                  ),
                  transitionDuration: const Duration(milliseconds: 500),
                  getPages: AppRoutes.page,
                  initialRoute: AppPages.navbarScreen,
                );
              },
            );
          },
        );
      },
    );
  }
}
