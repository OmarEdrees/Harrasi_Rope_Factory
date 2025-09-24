import 'package:custom_quick_alert/custom_quick_alert.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harrasi_rope_factory/core/app_route/route_names.dart';
import 'package:harrasi_rope_factory/core/components/custom_elevated_button.dart';
import 'package:harrasi_rope_factory/core/utilies/assets/images/app_images.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/core/utilies/extensions/app_extensions.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/features/auth/sign_in/view_models/cubit/sign_in_cubit.dart';
import 'package:harrasi_rope_factory/features/auth/sign_in/views/widgets/have_account_or_not.dart';
import 'package:harrasi_rope_factory/features/auth/sign_in/views/widgets/remember_me.dart';
import 'package:harrasi_rope_factory/features/auth/sign_in/views/widgets/sign_in_form.dart';
import 'package:harrasi_rope_factory/features/auth/sign_in/views/widgets/social_sign_in.dart';
import 'package:harrasi_rope_factory/features/categories/views/widgets/custom_circular_progress_indecator.dart';
import 'package:harrasi_rope_factory/generated/locale_keys.g.dart';

class SignInScreenBody extends StatelessWidget {
  const SignInScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.width * 0.03,
          vertical: SizeConfig.height * 0.01,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: SizeConfig.height * 0.04),
              Image.asset(
                AppImages.logoImage,
                width: SizeConfig.width * 0.4,
              ),
              SizedBox(height: SizeConfig.height * 0.07),
              BlocListener<SignInCubit, SignInState>(
                listener: (context, state) {
                  if (state is SignInSuccess) {
                    context.pushAndRemoveUntilScreen(
                      RouteNames.homeScreen,
                    );
                    CustomQuickAlert.success(
                      title: LocaleKeys
                          .auth_sign_in_screen_body_customQuickAlert_title
                          .tr(),
                      message: LocaleKeys
                          .auth_sign_in_screen_body_customQuickAlert_message
                          .tr(),
                      animationType: CustomQuickAlertAnimationType.scale,
                    );
                  }
                  if (state is SignInFailure) {
                    CustomQuickAlert.error(
                      title: LocaleKeys
                          .auth_sign_in_screen_body_customQuickAlert_error_title
                          .tr(),
                      message: state.message,
                      animationType: CustomQuickAlertAnimationType.slideInDown,
                    );
                  }
                },
                child: SignInForm(),
              ),
              RememberMe(),
              SizedBox(height: SizeConfig.height * 0.05),
              BlocBuilder<SignInCubit, SignInState>(
                builder: (context, state) {
                  return state is SignInLoading
                      ? const CustomCircularProgresIndecator()
                      : CustomElevatedButton(
                          name: LocaleKeys
                              .auth_sign_in_screen_body_customElevatedButton_name
                              .tr(),
                          onPressed: () {
                            context.read<SignInCubit>().signIn();
                          },
                          backgroundColor: AppColors.kThirdColor,
                        );
                },
              ),
              SizedBox(height: SizeConfig.height * 0.03),
              SocialSignIn(),
              SizedBox(height: SizeConfig.height * 0.02),
              HaveAccountOrNot(
                title: LocaleKeys
                    .auth_sign_in_screen_body_haveAccountOrNot_title
                    .tr(),
                value: LocaleKeys
                    .auth_sign_in_screen_body_haveAccountOrNot_value
                    .tr(),
                onPressed: () => context.pushScreen(RouteNames.signUpScreen),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
