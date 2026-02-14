import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_extension/features/login/controllers/login_controller.dart';
import 'package:flutter_extension/features/onboarding/controllers/onboarding_controller.dart';
import 'package:flutter_extension/features/splash/controllers/splash_controller.dart';
import 'package:flutter_extension/shared/widgets/custom_checkbox.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/localization/localization_controller.dart';
import '../core/theme/theme_controller.dart';
import '../core/localization/language_model.dart';
import '../core/constants/app_constants.dart';

Future<Map<String, Map<String, String>>> init() async {
  // Core
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);

  // Controller
  Get.lazyPut(() => ThemeController(sharedPreferences: Get.find()));
  Get.lazyPut(() => LocalizationController(sharedPreferences: Get.find()));
  Get.lazyPut(() => SplashController());
  Get.lazyPut(() => OnboardingController());
  Get.lazyPut(() => CheckboxController());
  Get.lazyPut(() => LoginController());

  //Retrieving localized data
  Map<String, Map<String, String>> languages = {};
  for (LanguageModel languageModel in AppConstants.languages) {
    String jsonStringValues = await rootBundle.loadString(
      'assets/language/${languageModel.languageCode}.json',
    );
    Map<String, dynamic> mappedJson = json.decode(jsonStringValues);
    Map<String, String> localizedStrings = {};
    mappedJson.forEach((key, value) {
      localizedStrings[key] = value.toString();
    });
    languages['${languageModel.languageCode}_${languageModel.countryCode}'] =
        localizedStrings;
  }
  return languages;
}
