import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// class CheckboxController extends GetxController {
//   var isChecked = false.obs;

//   void toggle() {
//     isChecked.value = !isChecked.value;
//   }
// }

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final double size;

  const CustomCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.size = 16,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!value),
      borderRadius: BorderRadius.circular(4.r),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue, width: 1.5),
          borderRadius: BorderRadius.circular(4.r),
          color: Colors.transparent,
        ),
        child: value
            ? Icon(Icons.check, size: 14.sp, color: Colors.black)
            : null,
      ),
    );
  }
}
