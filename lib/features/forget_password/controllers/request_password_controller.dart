import 'package:flutter/material.dart';
import 'package:flutter_extension/core/routes/app_pages.dart';
import 'package:get/get.dart';

class RequestPasswordController extends GetxController {
  // Text editing controller
  final TextEditingController emailController = TextEditingController();

  // Observable variables
  final RxBool isLoading = false.obs;
  var emailError = ''.obs;

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }

  // Email validation
  bool _validateEmail() {
    final email = emailController.text.trim();

    if (email.isEmpty) {
      emailError.value = 'Email is required';
      return false;
    }

    // Basic email regex pattern
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegex.hasMatch(email)) {
      emailError.value = 'Please enter a valid email';
      return false;
    }

    emailError.value = '';
    Get.offNamed(AppPages.otpScreen);
    return true;
  }

  // Main validation and request method
  Future<void> validateAndRequestReset() async {
    // Clear previous errors
    emailError.value = '';

    // Validate email
    if (!_validateEmail()) {
      return;
    }

    try {
      isLoading.value = true;

      // TODO: Replace with your actual API call
      await _requestPasswordReset(emailController.text.trim());

      // Show success message
      Get.snackbar(
        'Success',
        'Password reset link has been sent to your email',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );

      // Optional: Navigate back or to another screen
      // Get.back();
    } catch (e) {
      // Show error message
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );
    } finally {
      isLoading.value = false;
    }
  }

  // API call method - replace with your actual implementation
  Future<void> _requestPasswordReset(String email) async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    // TODO: Implement your actual API call here
    // Example:
    // final response = await apiService.requestPasswordReset(email);
    // if (!response.success) {
    //   throw Exception(response.message);
    // }
  }
}
