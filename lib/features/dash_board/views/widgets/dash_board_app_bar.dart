import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/core/components/custom_icon_button.dart';
import 'package:harrasi_rope_factory/core/utilies/assets/images/app_images.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/core/utilies/styles/app_text_styles.dart';
import 'package:harrasi_rope_factory/generated/local_keys.g.dart';

class DashBoardAppBar extends StatelessWidget {
  const DashBoardAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      CircleAvatar(
        radius: SizeConfig.width * 0.06,
        backgroundImage: AssetImage(AppImages.logoWithImageImage),
      ),
      SizedBox(width: SizeConfig.width * 0.02),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.dash_board_Harrasi_Rope_Factory.tr(),
            style: AppTextStyles.title18KThirdColorBold,
          ),
          Text(
            LocaleKeys.dash_board_Admin.tr(),
            style: AppTextStyles.title14White70,
          ),
        ],
      ),
      const Spacer(),
      CustomIconButton(
        iconSize: SizeConfig.width * 0.06,
        backgroundColor: Colors.white24,
        iconColor: AppColors.kThirdColor,
        hPadding: SizeConfig.width * 0.03,
        vPadding: SizeConfig.height * 0.01,
        icon: CupertinoIcons.settings,
        onPressed: () {},
      ),
    ]);
  }
}
