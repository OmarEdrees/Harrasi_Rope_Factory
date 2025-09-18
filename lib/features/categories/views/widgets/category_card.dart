import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/core/utilies/styles/app_text_styles.dart';
import 'package:harrasi_rope_factory/features/categories/models/category_model.dart';
import 'package:harrasi_rope_factory/features/categories/views/widgets/category_details_modal_bottom_sheet_body..dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.categoryModel,
  });

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: AppColors.kPrimaryColor,
          builder: (context) {
            return CategoryDetailsModalBottomSheetBody(
              categoryModel: categoryModel,
            );
          },
        );
      },
      child: Card(
        color: AppColors.kThirdColor,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.width * 0.03,
            vertical: SizeConfig.height * 0.01,
          ),
          child: Center(
            child: Text(
              categoryModel.name,
              style: AppTextStyles.title24PrimaryColorBold,
              maxLines: 2,
            ),
          ),
        ),
      ),
    );
  }
}

