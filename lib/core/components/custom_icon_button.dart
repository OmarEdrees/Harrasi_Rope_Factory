import 'package:harrasi_rope_factory/core/utilies/extensions/app_extensions.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    this.icon,
    this.onPressed,
    this.iconColor,
    this.iconSize,
    this.weight,
    this.child,
    this.backgroundColor,
    this.hPadding,
    this.vPadding,
  });

  final IconData? icon;
  final Function()? onPressed;
  final Color? iconColor;
  final Widget? child;
  final double? iconSize;
  final double? weight;
  final Color? backgroundColor;
  final double? hPadding;
  final double? vPadding;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: hPadding ?? context.screenWidth * 0.04,
                vertical: vPadding ?? context.screenWidth * 0.04),
            child: child ??
                Icon(
                  icon,
                  size: iconSize ?? context.screenWidth * 0.06,
                  color: iconColor ?? Colors.white,
                  weight: weight,
                ),
          ),
        ),
      ),
    );
  }
}
