import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harrasi_rope_factory/core/components/custom_text_form_field_with_title.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/features/auth/sign_up/view_models/cubit/sign_up_cubit.dart';
import 'package:harrasi_rope_factory/generated/locale_keys.g.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<SignUpCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextFormFieldWithTitle(
          title: LocaleKeys.auth_sign_up_form_user_name.tr(),
          hintText: LocaleKeys.auth_sign_up_form_hint_text_user_name.tr(),
          prefixIcon: CupertinoIcons.person,
          keyboardType: TextInputType.name,
          controller: cubit.userNameController,
        ),
        SizedBox(height: SizeConfig.height * 0.01),
        CustomTextFormFieldWithTitle(
          title: LocaleKeys.auth_sign_up_form_full_name.tr(),
          hintText: LocaleKeys.auth_sign_up_form_hint_text_full_name.tr(),
          prefixIcon: CupertinoIcons.person,
          keyboardType: TextInputType.name,
          controller: cubit.fullNameController,
        ),
        SizedBox(height: SizeConfig.height * 0.01),
        CustomTextFormFieldWithTitle(
          title: LocaleKeys.auth_sign_up_form_email.tr(),
          hintText: LocaleKeys.auth_sign_up_form_hint_text_email.tr(),
          prefixIcon: CupertinoIcons.mail,
          keyboardType: TextInputType.emailAddress,
          controller: cubit.emailController,
        ),
        SizedBox(height: SizeConfig.height * 0.01),
        CustomTextFormFieldWithTitle(
          title: LocaleKeys.auth_sign_up_form_phone_number.tr(),
          hintText: LocaleKeys.auth_sign_up_form_hint_text_phone_number.tr(),
          prefixIcon: CupertinoIcons.phone,
          keyboardType: TextInputType.phone,
          controller: cubit.phoneController,
        ),
        SizedBox(height: SizeConfig.height * 0.01),
        CustomTextFormFieldWithTitle(
          title: LocaleKeys.auth_sign_up_form_password.tr(),
          hintText: LocaleKeys.auth_sign_up_form_hint_text_password.tr(),
          prefixIcon: CupertinoIcons.padlock,
          isPassword: true,
          keyboardType: TextInputType.visiblePassword,
          controller: cubit.passwordController,
        ),
      ],
    );
  }
}
