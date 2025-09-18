import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/core/utilies/extensions/app_extensions.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/core/utilies/styles/app_text_styles.dart';
import 'package:harrasi_rope_factory/features/dash_board/models/dash_board_item_model.dart';

class DashBoardCard extends StatelessWidget {
  const DashBoardCard({super.key, required this.item});
  final DashBoardItemModel item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (item.route != null) {
          context.pushScreen(item.route!);
        }
      },
      child: Card(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(color: AppColors.kThirdColor, width: 1),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.width * 0.03,
            vertical: SizeConfig.height * 0.01,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                item.icon,
                size: SizeConfig.width * 0.1,
                color: AppColors.kThirdColor,
              ),
              Text(
                item.title,
                textAlign: TextAlign.center,
                style: AppTextStyles.title18KThirdColorBold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
