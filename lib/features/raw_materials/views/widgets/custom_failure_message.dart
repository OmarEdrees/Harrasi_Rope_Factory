import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/core/utilies/styles/app_text_styles.dart';

class CustomFailureMessage extends StatelessWidget {
  const CustomFailureMessage({
    super.key,
    required this.message,
  });
  final String message;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.error,
          color: AppColors.kThirdColor,
          size: SizeConfig.height * 0.05,
        ),
        SizedBox(
          height: SizeConfig.height * 0.01,
        ),
        Text(
          message,
          style: AppTextStyles.title20KThirdColorBold,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
