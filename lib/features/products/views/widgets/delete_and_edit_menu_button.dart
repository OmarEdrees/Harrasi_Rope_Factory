import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/core/utilies/styles/app_text_styles.dart';
import 'package:harrasi_rope_factory/generated/local_keys.g.dart';
import 'package:popup_menu_plus/popup_menu_plus.dart';

class DeleteAndEditMenuButton extends StatelessWidget {
  const DeleteAndEditMenuButton({
    super.key,
    this.onDeleteTap,
    this.onEditTap,
    required this.btnKey,
    this.iconColor,
  });

  final GlobalKey<State<StatefulWidget>> btnKey;
  final Function()? onDeleteTap;
  final Function()? onEditTap;
  final Color? iconColor;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      key: btnKey,
      icon: Icon(CupertinoIcons.ellipsis_circle),
      color: iconColor ?? AppColors.kPrimaryColor,
      onPressed: () {
        PopupMenu(
          context: context,
          config: MenuConfig(
            backgroundColor: AppColors.kThirdColor,
            lineColor: AppColors.kPrimaryColor,
            highlightColor: AppColors.kPrimaryColor,
          ),
          items: [
            PopUpMenuItem(
              textStyle: AppTextStyles.title14PrimaryColor,
              title: LocaleKeys.products_add_product_Delete.tr(),
              image: GestureDetector(
                onTap: onDeleteTap,
                child: Icon(
                  FontAwesomeIcons.remove,
                  color: AppColors.kPrimaryColor,
                ),
              ),
            ),
            PopUpMenuItem(
              textStyle: AppTextStyles.title16PrimaryColorW500,
              title: LocaleKeys.products_add_product_Update.tr(),
              image: GestureDetector(
                onTap: onEditTap,
                child: Icon(
                  FontAwesomeIcons.edit,
                  color: AppColors.kPrimaryColor,
                ),
              ),
            ),
          ],
        ).show(widgetKey: btnKey);
      },
    );
  }
}
