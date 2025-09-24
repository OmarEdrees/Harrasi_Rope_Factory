import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/core/utilies/styles/app_text_styles.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: SizeConfig.height * 0.01,
          horizontal: SizeConfig.width * 0.1),
      decoration: BoxDecoration(
        color: AppColors.kThirdColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(36),
          bottomRight: Radius.circular(36),
        ),
      ),
      child: Text(
        title ,
        textAlign: TextAlign.center,
        style: AppTextStyles.title24PrimaryColorBold,
      ),
    );
  }
}
