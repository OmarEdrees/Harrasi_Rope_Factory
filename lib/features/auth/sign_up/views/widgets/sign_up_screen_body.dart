import 'package:custom_quick_alert/custom_quick_alert.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harrasi_rope_factory/core/components/custom_elevated_button.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/core/utilies/extensions/app_extensions.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/features/auth/sign_in/views/widgets/have_account_or_not.dart';
import 'package:harrasi_rope_factory/features/auth/sign_up/view_models/cubit/sign_up_cubit.dart';
import 'package:harrasi_rope_factory/features/auth/sign_up/views/widgets/pick_image.dart';
import 'package:harrasi_rope_factory/features/auth/sign_up/views/widgets/sign_up_form.dart';
import 'package:harrasi_rope_factory/features/auth/sign_up/views/widgets/social_sign_up.dart';
import 'package:harrasi_rope_factory/generated/locale_keys.g.dart';

class SignUpScreenBody extends StatelessWidget {
  const SignUpScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpCubit>();
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.width * 0.03,
        vertical: SizeConfig.height * 0.01,
      ),
      child: SingleChildScrollView(
        child: BlocListener<SignUpCubit, SignUpState>(
          listener: (context, state) {
            if (state is SignUpSuccess) {
              context.popScreen();
              CustomQuickAlert.success(
                title: LocaleKeys
                    .auth_sign_up_screen_bodys_customQuickAlert_title
                    .tr(),
                message: LocaleKeys
                    .auth_sign_up_screen_bodys_customQuickAlert_message
                    .tr(),
                animationType: CustomQuickAlertAnimationType.scale,
              );
            }
            if (state is SignUpFailure) {
              CustomQuickAlert.error(
                title: LocaleKeys
                    .auth_sign_up_screen_bodys_customQuickAlert_error_title
                    .tr(),
                message: state.errorMessage,
                animationType: CustomQuickAlertAnimationType.slideInDown,
              );
            }
            if (state is PickImageFailure) {
              CustomQuickAlert.info(
                title: LocaleKeys
                    .auth_sign_up_screen_bodys_customQuickAlert_info_title
                    .tr(),
                message: state.errorMessage,
                animationType: CustomQuickAlertAnimationType.slideInDown,
              );
            }
          },
          child: Form(
            key: context.read<SignUpCubit>().formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: SizeConfig.height * 0.02),
                PickImage(),
                SizedBox(height: SizeConfig.height * 0.05),
                SignUpForm(),
                SizedBox(height: SizeConfig.height * 0.05),
                BlocBuilder<SignUpCubit, SignUpState>(
                  buildWhen: (previous, current) =>
                      current is SignUpLoading || previous is SignUpLoading,
                  builder: (context, state) {
                    return state is SignUpLoading
                        ? CircularProgressIndicator(
                            color: AppColors.kThirdColor,
                          )
                        : CustomElevatedButton(
                            name: LocaleKeys
                                .auth_sign_up_screen_bodys_customElevatedButton_name
                                .tr(),
                            onPressed: () {
                              cubit.signUp();
                            },
                            backgroundColor: AppColors.kThirdColor,
                          );
                  },
                ),
                SizedBox(height: SizeConfig.height * 0.03),
                SocialSingUp(),
                SizedBox(height: SizeConfig.height * 0.02),
                HaveAccountOrNot(
                  title: LocaleKeys
                      .auth_sign_up_screen_bodys_haveAccountOrNot_title
                      .tr(),
                  value: LocaleKeys
                      .auth_sign_up_screen_bodys_haveAccountOrNot_value
                      .tr(),
                  onPressed: () {
                    context.popScreen();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
