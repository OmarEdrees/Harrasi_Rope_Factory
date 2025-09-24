import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:harrasi_rope_factory/core/components/custom_icon_button.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/features/auth/sign_up/view_models/cubit/sign_up_cubit.dart';

class SocialSingUp extends StatelessWidget {
  const SocialSingUp({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomIconButton(
          iconSize: SizeConfig.width * 0.07,
          backgroundColor: Colors.white24,
          iconColor: AppColors.kThirdColor,
          icon: FontAwesomeIcons.facebookF,
          onPressed: () {},
        ),
        CustomIconButton(
          iconSize: SizeConfig.width * 0.07,
          backgroundColor: Colors.white24,
          iconColor: AppColors.kThirdColor,
          icon: FontAwesomeIcons.google,
          onPressed: () {
            context.read<SignUpCubit>().signUpWithGoogle();
          },
        ),
        CustomIconButton(
          iconSize: SizeConfig.width * 0.07,
          backgroundColor: Colors.white24,
          iconColor: AppColors.kThirdColor,
          icon: FontAwesomeIcons.apple,
          onPressed: () {},
        ),
      ],
    );
  }
}
