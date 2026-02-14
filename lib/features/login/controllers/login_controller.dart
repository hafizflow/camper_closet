import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final RxString emailError = RxString('');
  final RxString passwordError = RxString('');
  final RxBool rememberMe = RxBool(false);

  void validateAndLogin() {
    // Clear previous errors
    emailError.value = '';
    passwordError.value = '';

    // Validate form
    if (formKey.currentState?.validate() ?? false) {
      // Perform login logic here
      debugPrint('Form is valid, proceed with login');
    }
  }

  void toggleRememberMe() {
    rememberMe.value = !rememberMe.value;
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
