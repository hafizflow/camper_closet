import 'package:flutter/material.dart';
import 'package:flutter_extension/core/constants/app_logos.dart';
import 'package:flutter_extension/features/splash/controllers/splash_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      Get.find<SplashController>().jumpNextScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(AppLogos.splashlogo, width: 264, height: 195),
      ),
    );
  }
}
