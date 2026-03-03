import 'package:flutter/material.dart';
import 'package:flutter_extension/core/routes/app_pages.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  // Text Controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Error Messages
  var emailError = ''.obs;
  var passwordError = ''.obs;

  // Remember me
  var rememberMe = false.obs;

  // Loading state
  var isLoading = false.obs;

  void toggleRememberMe() {
    rememberMe.value = !rememberMe.value;
  }

  bool _validateAllFields() {
    bool isValid = true;

    // Clear previous errors
    // emailError.value = '';
    // passwordError.value = '';

    // // Validate Email
    // if (emailController.text.trim().isEmpty) {
    //   emailError.value = 'Please enter your email';
    //   isValid = false;
    // } else if (!GetUtils.isEmail(emailController.text.trim())) {
    //   emailError.value = 'Please enter a valid email';
    //   isValid = false;
    // }

    // // Validate Password
    // if (passwordController.text.isEmpty) {
    //   passwordError.value = 'Please enter a password';
    //   isValid = false;
    // } else if (passwordController.text.length < 8) {
    //   passwordError.value = 'Password must be at least 8 characters';
    //   isValid = false;
    // }

    return isValid;
  }

  Future<void> validateAndLogin() async {
    if (!_validateAllFields()) {
      return;
    }

    try {
      isLoading.value = true;

      // TODO: Implement your login API call here
      // Example:
      // await authService.login(
      //   email: emailController.text.trim(),
      //   password: passwordController.text,
      //   rememberMe: rememberMe.value,
      // );

      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      Get.snackbar(
        'Success',
        'Logged in successfully!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withValues(alpha: 0.1),
        colorText: Colors.green,
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 2),
      );

      Get.offAllNamed(AppPages.navbarScreen);
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to login: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withValues(alpha: 0.1),
        colorText: Colors.red,
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 3),
      );
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
