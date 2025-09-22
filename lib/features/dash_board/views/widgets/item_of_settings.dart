import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/core/utilies/styles/app_text_styles.dart';

class ItemOfSettings extends StatelessWidget {
  final String? title;
  final dynamic trealing;
  const ItemOfSettings({
    super.key,
    this.title,
    this.trealing,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.height * 0.015,
        horizontal: SizeConfig.width * 0.02,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.kThirdColor,
            width: 1,
          ),
        ),
        width: double.infinity,
        height: SizeConfig.height * 0.08,
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.width * 0.005,
        ),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Text(
                title!,
                style: AppTextStyles.title18KThirdColorBold,
              ),
              Spacer(),
              trealing!,
            ],
          ),
        ),
      ),
    );
  }
}
