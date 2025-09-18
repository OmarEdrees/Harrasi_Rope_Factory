import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/core/components/custom_text_button.dart';
import 'package:harrasi_rope_factory/core/utilies/styles/app_text_styles.dart';

class HaveAccountOrNot extends StatelessWidget {
  const HaveAccountOrNot({
    super.key,
    required this.title,
    required this.value,
    required this.onPressed,
  });
  final String title, value;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: AppTextStyles.title16WhiteColor,
        ),
        CustomTextButton(
          title: value,
          style: AppTextStyles.title18KThirdColorBold,
          onPressed: onPressed,
        ),
      ],
    );
  }
}
