import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/core/utilies/styles/app_text_styles.dart';
import 'package:harrasi_rope_factory/features/products/view_models/products_cubit/products_cubit.dart';
import 'package:harrasi_rope_factory/generated/local_keys.g.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        var cubit = context.read<ProductsCubit>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: SizeConfig.height * 0.05,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                itemCount: cubit.categories.length,
                itemBuilder: (context, index) {
                  final category = cubit.categories[index];
                  final isSelected = cubit.selectedCategoryIds
                      .contains(category.id.toString());
                  return GestureDetector(
                    onTap: () => cubit.toggleCategory(category.id.toString()),
                    child: Container(
                      margin: EdgeInsets.only(right: SizeConfig.width * 0.02),
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.width * 0.04,
                        vertical: SizeConfig.height * 0.006,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.white24),
                        color: isSelected
                            ? AppColors.kThirdColor
                            : Colors.transparent,
                      ),
                      child: Center(
                        child: Text(
                          category.name,
                          style: isSelected
                              ? AppTextStyles.title16PrimaryColorW500
                              : AppTextStyles.title16White70,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: SizeConfig.height * 0.01),
            if (cubit.selectedCategoryIds.isNotEmpty)
              Wrap(
                spacing: SizeConfig.width * 0.02,
                children: [
                  ...cubit.selectedCategoryIds.map((id) {
                    final category = cubit.categories
                        .firstWhere((c) => c.id.toString() == id);
                    return Chip(
                      label: Text(category.name,
                          style: AppTextStyles.title14KThirdColor),
                      backgroundColor: AppColors.kSecondaryColor,
                      deleteIcon:
                          Icon(Icons.close, color: AppColors.kThirdColor),
                      onDeleted: () => cubit.removeCategory(id),
                    );
                  }),
                  ActionChip(
                    label: Text(LocaleKeys.products_add_product_Clear_All.tr(),
                        style: AppTextStyles.title14PrimaryColor),
                    backgroundColor: AppColors.kThirdColor,
                    onPressed: () => cubit.clearAllCategories(),
                  ),
                ],
              ),
          ],
        );
      },
    );
  }
}
