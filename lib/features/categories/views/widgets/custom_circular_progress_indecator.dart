import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';

class CustomCircularProgresIndecator extends StatelessWidget {
  const CustomCircularProgresIndecator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
          color: AppColors.kThirdColor,
        ),
      );
  }
}