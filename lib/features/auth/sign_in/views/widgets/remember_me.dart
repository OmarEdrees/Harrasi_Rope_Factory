import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/core/components/custom_text_button.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/core/utilies/styles/app_text_styles.dart';
import 'package:harrasi_rope_factory/generated/local_keys.g.dart';

class RememberMe extends StatelessWidget {
  const RememberMe({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: false,
          fillColor: MaterialStateProperty.all(AppColors.kThirdColor),
          activeColor: AppColors.kThirdColor,
          checkColor: AppColors.kPrimaryColor,
          onChanged: (value) {},
        ),
        Text(
          LocaleKeys.auth_sign_in_remember_me_title.tr(),
          style: AppTextStyles.title16WhiteColor,
        ),
        const Spacer(),
        CustomTextButton(
          title: LocaleKeys.auth_sign_in_remember_me_forgot_password.tr(),
          style: AppTextStyles.title18KThirdColorBold,
        ),
      ],
    );
  }
}
