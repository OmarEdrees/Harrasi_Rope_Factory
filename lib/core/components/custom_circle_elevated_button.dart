import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:flutter/material.dart';

class CustomCircleElevatedButton extends StatelessWidget {
  const CustomCircleElevatedButton({
    super.key, required this.icon, this.onPressed,
  });
  final IconData icon;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 6),
        backgroundColor: AppColors.kPrimaryColor,
        shape: CircleBorder(),
      ),
      child: Icon(
        icon,
        size: 20,
        color: Colors.white,
      ),
    );
  }
}
