import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  // final formKey = GlobalKey<FormState>();

  // Text Controllers
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final dobController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // Error Messages
  var fullNameError = ''.obs;
  var emailError = ''.obs;
  var dobError = ''.obs;
  var passwordError = ''.obs;
  var confirmPasswordError = ''.obs;

  // Terms acceptance
  var acceptedTerms = false.obs;

  // Loading state
  var isLoading = false.obs;

  void toggleTermsAcceptance() {
    acceptedTerms.value = !acceptedTerms.value;
  }

  bool _validateAllFields() {
    bool isValid = true;

    // Clear previous errors
    fullNameError.value = '';
    emailError.value = '';
    dobError.value = '';
    passwordError.value = '';
    confirmPasswordError.value = '';

    // Validate Full Name
    if (fullNameController.text.trim().isEmpty) {
      fullNameError.value = 'Please enter your full name';
      isValid = false;
    } else if (fullNameController.text.trim().length < 3) {
      fullNameError.value = 'Name must be at least 3 characters';
      isValid = false;
    }

    // Validate Email
    if (emailController.text.trim().isEmpty) {
      emailError.value = 'Please enter your email';
      isValid = false;
    } else if (!GetUtils.isEmail(emailController.text.trim())) {
      emailError.value = 'Please enter a valid email';
      isValid = false;
    }

    // Validate Date of Birth
    if (dobController.text.trim().isEmpty) {
      dobError.value = 'Please enter your date of birth';
      isValid = false;
    }

    // Validate Password
    if (passwordController.text.isEmpty) {
      passwordError.value = 'Please enter a password';
      isValid = false;
    } else if (passwordController.text.length < 8) {
      passwordError.value = 'Password must be at least 8 characters';
      isValid = false;
    }

    // Validate Confirm Password
    if (confirmPasswordController.text.isEmpty) {
      confirmPasswordError.value = 'Please confirm your password';
      isValid = false;
    } else if (confirmPasswordController.text != passwordController.text) {
      confirmPasswordError.value = 'Passwords do not match';
      isValid = false;
    }

    // Validate Terms Acceptance
    if (!acceptedTerms.value) {
      Get.snackbar(
        'Terms Required',
        'Please accept the terms & conditions and privacy policy',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withValues(alpha: 0.1),
        colorText: Colors.red,
        margin: const EdgeInsets.all(16),
      );
      isValid = false;
    }

    return isValid;
  }

  Future<void> validateAndSignup() async {
    // if (!_validateAllFields()) {
    //   return;
    // }

    try {
      isLoading.value = true;

      // TODO: Implement your signup API call here
      // Example:
      // await authService.signup(
      //   fullName: fullNameController.text.trim(),
      //   email: emailController.text.trim(),
      //   dob: dobController.text.trim(),
      //   password: passwordController.text,
      // );

      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      Get.snackbar(
        'Success',
        'Account created successfully!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withValues(alpha: 0.1),
        colorText: Colors.green,
        margin: const EdgeInsets.all(16),
      );

      // Navigate to next screen (e.g., home or verification)
      // Get.offAllNamed(AppPages.homeScreen);
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to create account: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withValues(alpha: 0.1),
        colorText: Colors.red,
        margin: const EdgeInsets.all(16),
      );
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    fullNameController.dispose();
    emailController.dispose();
    dobController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
