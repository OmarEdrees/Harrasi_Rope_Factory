import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harrasi_rope_factory/core/components/custom_icon_button.dart';
import 'package:harrasi_rope_factory/core/utilies/assets/images/app_images.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/features/auth/sign_up/view_models/cubit/sign_up_cubit.dart';

class PickImage extends StatelessWidget {
  const PickImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) =>
          current is PickImageSuccess,
      builder: (context, state) {
        var cubit = context.read<SignUpCubit>();
        return Stack(
          children: [
            Center(
              child: CircleAvatar(
                radius: SizeConfig.width * 0.18,
                backgroundImage: cubit.image == null
                    ? AssetImage(AppImages.profileImage)
                    : FileImage(cubit.image!),
              ),
            ),
            Positioned(
              bottom: -SizeConfig.height * 0.01,
              right: SizeConfig.width * 0.3,
              child: CustomIconButton(
                iconSize: SizeConfig.width * 0.06,
                backgroundColor: AppColors.kThirdColor,
                iconColor: AppColors.kPrimaryColor,
                icon: Icons.camera_alt_outlined,
                onPressed: () {
                  cubit.pickProfileImage();
                },
                hPadding: SizeConfig.width * 0.02,
                vPadding: SizeConfig.height * 0.02,
              ),
            ),
          ],
        );
      },
    );
  }
}
