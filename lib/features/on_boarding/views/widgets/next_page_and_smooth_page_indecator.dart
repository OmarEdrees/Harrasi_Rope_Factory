import 'package:easy_localization/easy_localization.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/features/on_boarding/view_models/cubit/on_boarding_cubit.dart';
import 'package:harrasi_rope_factory/features/on_boarding/views/widgets/custom_smooth_page_indecator.dart';
import 'package:flutter/material.dart';

class NextPageAndSmoothPageIndecator extends StatelessWidget {
  const NextPageAndSmoothPageIndecator({
    super.key,
    required this.cubit,
  });

  final OnBoardingCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.width * 0.05,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomSmoothPageIndecator(
              pageController: cubit.pageController,
            ),
            SizedBox(
              height: SizeConfig.height * 0.09,
              width: SizeConfig.height * 0.09,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: SizeConfig.height * 0.08,
                    width: SizeConfig.height * 0.08,
                    child: CircularProgressIndicator(
                      strokeWidth: SizeConfig.width * 0.01,
                      value: cubit.percentage,
                      backgroundColor: Colors.white,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(AppColors.kThirdColor),
                    ),
                  ),
                  Container(
                    height: SizeConfig.height * 0.065,
                    width: SizeConfig.height * 0.065,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.kSecondaryColor,
                    ),
                    child: IconButton(
                      icon: Icon(
                        context.locale.languageCode == 'ar'
                            ? Icons.keyboard_arrow_left_outlined
                            : Icons.keyboard_arrow_right_outlined,
                        size: SizeConfig.height * 0.045,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        cubit.nextPage();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
