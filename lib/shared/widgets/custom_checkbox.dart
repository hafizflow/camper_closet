import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckboxController extends GetxController {
  var isChecked = false.obs;

  void toggle() {
    isChecked.value = !isChecked.value;
  }
}

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final double size;

  const CustomCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.size = 20,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!value),
      borderRadius: BorderRadius.circular(4),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue, width: 1.5),
          borderRadius: BorderRadius.circular(4),
          color: Colors.transparent,
        ),
        child: value
            ? const Icon(Icons.check, size: 16, color: Colors.black)
            : null,
      ),
    );
  }
}
