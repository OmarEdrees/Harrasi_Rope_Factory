import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harrasi_rope_factory/core/components/custom_text_form_field_with_title.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/features/auth/sign_in/view_models/cubit/sign_in_cubit.dart';
import 'package:harrasi_rope_factory/generated/locale_keys.g.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<SignInCubit>();
    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          CustomTextFormFieldWithTitle(
            title: LocaleKeys.auth_sign_in_form_email.tr(),
            hintText: LocaleKeys.auth_sign_in_form_hint_text_email.tr(),
            prefixIcon: CupertinoIcons.mail,
            controller: cubit.emailController,
          ),
          SizedBox(height: SizeConfig.height * 0.01),
          CustomTextFormFieldWithTitle(
            title: LocaleKeys.auth_sign_in_form_password.tr(),
            hintText: LocaleKeys.auth_sign_in_form_hint_text_password.tr(),
            controller: cubit.passwordController,
            prefixIcon: CupertinoIcons.padlock,
            isPassword: true,
          ),
          SizedBox(height: SizeConfig.height * 0.01),
        ],
      ),
    );
  }
}
