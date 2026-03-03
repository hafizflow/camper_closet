// features/otp/controllers/otp_controller.dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_extension/core/routes/app_pages.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  // Text editing controller for Pinput
  final TextEditingController otpController = TextEditingController();

  // Observable variables
  final RxBool isLoading = false.obs;
  final RxString otpCode = ''.obs;
  final RxBool isOtpValid = false.obs;

  // Timer variables
  final RxInt remainingSeconds = 30.obs;
  final RxBool canResend = false.obs;
  Timer? _timer;

  // Default/Expected OTP
  static const String defaultOtp = '';

  // Email (you can pass this from previous screen)
  final RxString userEmail = ''.obs;

  @override
  void onInit() {
    super.onInit();
    // Get email from arguments if passed from previous screen
    if (Get.arguments != null && Get.arguments['email'] != null) {
      userEmail.value = Get.arguments['email'];
    }

    // Start timer when screen loads
    startTimer();
  }

  // Start countdown timer
  void startTimer() {
    canResend.value = false;
    remainingSeconds.value = 30;

    _timer?.cancel(); // Cancel any existing timer

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds.value > 0) {
        remainingSeconds.value--;
      } else {
        canResend.value = true;
        timer.cancel();
      }
    });
  }

  // Format time as MM:SS
  String get formattedTime {
    int minutes = remainingSeconds.value ~/ 60;
    int seconds = remainingSeconds.value % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  // Handle OTP change
  void onOtpChanged(String value) {
    otpCode.value = value;
    isOtpValid.value = value.length == 4;
  }

  // Validate and submit OTP
  Future<void> validateAndSubmitOtp() async {
    // Check if OTP is complete
    // if (otpCode.value.length != 4) {
    //   Get.snackbar(
    //     'Invalid OTP',
    //     'Please enter a 4-digit code',
    //     snackPosition: SnackPosition.BOTTOM,
    //     backgroundColor: Colors.red.withValues(alpha: 0.1),
    //     colorText: Colors.red,
    //   );
    //   return;
    // }

    try {
      isLoading.value = true;

      // Simulate API call delay
      await Future.delayed(const Duration(seconds: 2));

      // Validate OTP
      if (otpCode.value == defaultOtp) {
        // OTP is correct
        Get.snackbar(
          'Success',
          'OTP verified successfully!',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.withValues(alpha: 0.1),
          colorText: Colors.green,
        );

        Get.offNamed(AppPages.resetPasswordScreen);
      } else {
        // OTP is incorrect
        Get.snackbar(
          'Invalid OTP',
          'The code you entered is incorrect. Please try again.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withValues(alpha: 0.1),
          colorText: Colors.red,
        );

        // Clear the OTP field
        otpController.clear();
        otpCode.value = '';
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Something went wrong. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withValues(alpha: 0.1),
        colorText: Colors.red,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Resend OTP
  Future<void> resendOtp() async {
    if (!canResend.value) return;

    try {
      isLoading.value = true;

      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      Get.snackbar(
        'Code Sent',
        'A new verification code has been sent to ${userEmail.value}',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withValues(alpha: 0.1),
        colorText: Colors.green,
      );

      // Clear current OTP
      otpController.clear();
      otpCode.value = '';

      // Restart timer
      startTimer();
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to resend code. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withValues(alpha: 0.1),
        colorText: Colors.red,
      );
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    _timer?.cancel();
    otpController.dispose();
    super.onClose();
  }
}
