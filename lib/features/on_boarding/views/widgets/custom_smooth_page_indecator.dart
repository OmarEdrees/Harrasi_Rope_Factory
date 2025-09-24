import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomSmoothPageIndecator extends StatelessWidget {
  const CustomSmoothPageIndecator({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: pageController,
      count: 6,
      effect: ExpandingDotsEffect(
        dotWidth: SizeConfig.height * 0.015,
        dotHeight: SizeConfig.height * 0.015,
        dotColor: Colors.grey,
        activeDotColor: AppColors.kSecondaryColor,
      ),
    );
  }
}
