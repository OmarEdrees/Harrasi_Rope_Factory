import 'package:easy_localization/easy_localization.dart';
import 'package:harrasi_rope_factory/app/cubit/localization_cubit.dart';
import 'package:harrasi_rope_factory/core/app_route/route_names.dart';
import 'package:harrasi_rope_factory/core/components/custom_text_button.dart';
import 'package:harrasi_rope_factory/core/di/dependancy_injection.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/core/utilies/extensions/app_extensions.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/core/utilies/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/generated/local_keys.g.dart';

class CustomOnBoardingAppBar extends StatelessWidget {
  const CustomOnBoardingAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.width * 0.03,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.kSecondaryColor),
            borderRadius: BorderRadius.circular(32),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "EN",
                style: AppTextStyles.title14White,
              ),
              SizedBox(width: SizeConfig.width * 0.03),
              Switch(
                padding: EdgeInsets.zero,
                value: context.locale.languageCode == 'en' ? true : false,
                onChanged: (value) async {
                  await getIt<TranslationCubit>().changeLanguage(context,
                      context.locale.languageCode == 'en' ? 'ar' : 'en');
                  context.pushReplacementScreen(RouteNames.onBoardingScreen);
                },
                activeColor: AppColors.kSecondaryColor,
              ),
            ],
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          color: AppColors.kSecondaryColor,
          margin: EdgeInsets.zero,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.width * 0.04,
              vertical: SizeConfig.height * 0.008,
            ),
            child: CustomTextButton(
              title: LocaleKeys.skip.tr(),
              onPressed: () {
                context.pushReplacementScreen(RouteNames.signInScreen);
              },
              alignment: Alignment.center,
              style: AppTextStyles.title18WhiteW500,
            ),
          ),
        ),
      ],
    );
  }
}
