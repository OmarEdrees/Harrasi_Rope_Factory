import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:harrasi_rope_factory/core/components/custom_icon_button.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/features/auth/sign_in/view_models/cubit/sign_in_cubit.dart';
import 'package:harrasi_rope_factory/features/categories/views/widgets/custom_circular_progress_indecator.dart';

class SocialSignIn extends StatelessWidget {
  const SocialSignIn({
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
        BlocBuilder<SignInCubit, SignInState>(
          buildWhen: (previous, current) =>
              current is SignInLoading || previous is SignInLoading,
          builder: (context, state) {
            return state is SignInLoading
                ? const CustomCircularProgresIndecator()
                : CustomIconButton(
                    iconSize: SizeConfig.width * 0.07,
                    backgroundColor: Colors.white24,
                    iconColor: AppColors.kThirdColor,
                    icon: FontAwesomeIcons.google,
                    onPressed: () {
                      context.read<SignInCubit>().signInWithGoogle();
                    },
                  );
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
