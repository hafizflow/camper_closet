import 'package:exui/exui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_extension/core/constants/app_sizes.dart';
import 'package:flutter_extension/shared/widgets/custom_button.dart';
import 'package:flutter_extension/shared/widgets/custom_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/logos/applogo.svg',
              width: 100.w,
              height: 65.h,
            ),
            Text("Welcome Back!"),
            Text("Login to your account"),
            Align(alignment: Alignment.centerLeft, child: Text("Email")),
            CustomTextField(
              controller: TextEditingController(),
              hintText: "Enter your email",
            ),
            Align(alignment: Alignment.centerLeft, child: Text("Password")),
            CustomTextField(
              controller: TextEditingController(),
              hintText: "Enter your password",
              // obscureText: true,
            ),
            Row(
              children: [
                Checkbox(value: false, onChanged: (value) {}),
                Text("Remember me"),
                Spacer(),
                Text("Forgot Password?"),
              ],
            ),
            SizedBox(height: 20.h),
            CustomButton(
              onTap: () {},
              text: 'Sign In',
              height: 44.h,
              radius: 16.r,
            ),
            Row(children: [Divider(), Text('Or'), Divider()]),
          ],
        ).paddingHorizontal(AppSizes.defaultPadding),
      ),
    );
  }
}
