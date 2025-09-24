import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/core/helper/get_responsive_font_size.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/core/utilies/styles/app_text_styles.dart';

class ItemOfSettings extends StatelessWidget {
  final String? title;
  final Widget trealing;
  final void Function()? ontap;
  final IconData? leading;
  ItemOfSettings({
    super.key,
    this.title,
    this.trealing = const SizedBox.shrink(),
    this.ontap,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.height * 0.015,
        horizontal: SizeConfig.width * 0.02,
      ),
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.kThirdColor,
              width: 1,
            ),
          ),
          width: double.infinity,
          height: SizeConfig.height * 0.07,
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.width * 0.005,
          ),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Icon(
                  leading,
                  size: getResponsiveFontSize(fontSize: 24),
                  color: AppColors.kThirdColor,
                ),
                SizedBox(width: 15),
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
      ),
    );
  }
}
