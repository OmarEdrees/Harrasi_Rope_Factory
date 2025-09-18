import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/core/utilies/styles/app_text_styles.dart';

class DetailsListTile extends StatelessWidget {
  const DetailsListTile({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  final String title, value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: SizeConfig.height * 0.02,
      ),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: AppColors.kThirdColor,
            width: 1,
          ),
        ),
        leading: Icon(
          icon,
          color: AppColors.kThirdColor,
        ),
        title: Text(
          title,
          style: AppTextStyles.title18KThirdColorBold,
        ),
        subtitle: Text(
          value,
          style: AppTextStyles.title16White500,
        ),
      ),
    );
  }
}
