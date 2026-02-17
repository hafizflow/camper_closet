import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final RxBool isLoading = false.obs;

  final RxString passwordError = ''.obs;
  final RxString confirmPasswordError = ''.obs;

  @override
  void onClose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  bool _validate() {
    bool isValid = true;

    final password = passwordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    if (password.isEmpty) {
      passwordError.value = 'Password is required';
      isValid = false;
    } else if (password.length < 8) {
      passwordError.value = 'Password must be at least 8 characters';
      isValid = false;
    } else {
      passwordError.value = '';
    }

    if (confirmPassword.isEmpty) {
      confirmPasswordError.value = 'Please confirm your password';
      isValid = false;
    } else if (confirmPassword != password) {
      confirmPasswordError.value = 'Passwords do not match';
      isValid = false;
    } else {
      confirmPasswordError.value = '';
    }

    return isValid;
  }

  Future<void> validateAndRequestReset() async {
    if (!_validate()) return;

    try {
      isLoading.value = true;

      await Future.delayed(const Duration(seconds: 2)); // Simulated API call

      Get.snackbar(
        'Success',
        'Your password has been reset successfully.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withValues(alpha: 0.8),
        colorText: Colors.white,
      );

      // TODO: Navigate to login or appropriate screen
      // Get.offAllNamed(AppRoutes.login);
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withValues(alpha: 0.8),
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
