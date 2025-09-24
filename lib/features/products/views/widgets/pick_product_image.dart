import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harrasi_rope_factory/core/components/custom_icon_button.dart';
import 'package:harrasi_rope_factory/core/utilies/assets/images/app_images.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/core/utilies/styles/app_text_styles.dart';
import 'package:harrasi_rope_factory/features/products/view_models/add_products_cubit/add_product_cubit.dart';
import 'package:harrasi_rope_factory/generated/locale_keys.g.dart';

class PickProductImage extends StatelessWidget {
  const PickProductImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(LocaleKeys.products_add_product_Pick_Image.tr(),
            style: AppTextStyles.title18White70),
        SizedBox(height: SizeConfig.height * 0.01),
        BlocBuilder<AddProductCubit, AddProductState>(
          buildWhen: (previous, current) =>
              current is PickProductImageSuccess ||
              current is PickProductImageFailure,
          builder: (context, state) {
            var cubit = context.read<AddProductCubit>();
            return Stack(
              children: [
                Center(
                  child: SizedBox(
                    height: SizeConfig.height * 0.2,
                    width: SizeConfig.width * 0.8,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(36),
                      child: cubit.imageFile == null
                          ? Image.asset(AppImages.noProductImage,
                              fit: BoxFit.fill)
                          : Image.file(cubit.imageFile!, fit: BoxFit.fill),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -SizeConfig.height * 0.00,
                  right: SizeConfig.width * 0.09,
                  child: CustomIconButton(
                    iconSize: SizeConfig.width * 0.06,
                    backgroundColor: AppColors.kThirdColor,
                    iconColor: AppColors.kPrimaryColor,
                    icon: Icons.camera_alt_outlined,
                    onPressed: () {
                      cubit.pickProductImage();
                    },
                    hPadding: SizeConfig.width * 0.02,
                    vPadding: SizeConfig.height * 0.02,
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
