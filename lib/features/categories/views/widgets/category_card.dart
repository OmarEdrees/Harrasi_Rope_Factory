import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/core/utilies/styles/app_text_styles.dart';
import 'package:harrasi_rope_factory/features/categories/models/category_model.dart';
import 'package:harrasi_rope_factory/features/categories/view_models/categories_cubit/categories_cubit.dart';
import 'package:harrasi_rope_factory/features/categories/view_models/edit_category/edit_category_cubit.dart';
import 'package:harrasi_rope_factory/features/categories/views/widgets/category_details_modal_bottom_sheet_body..dart';
import 'package:harrasi_rope_factory/features/categories/views/widgets/edit_category_modal_bottom_sheet_body.dart';
import 'package:harrasi_rope_factory/features/products/views/widgets/delete_and_edit_menu_button.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.categoryModel,
  });

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    final GlobalKey btnKey = GlobalKey();
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
      child: Stack(
        children: [
          Card(
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
          Align(
            alignment: Alignment.topRight,
            child: DeleteAndEditMenuButton(
              btnKey: btnKey,
              onDeleteTap: () {
                context
                    .read<CategoriesCubit>()
                    .deleteCategory(id: categoryModel.id);
              },
              onEditTap: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: AppColors.kPrimaryColor,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  builder: (context) {
                    return BlocProvider(
                      create: (context) => EditCategoryCubit(
                        category: categoryModel,
                      ),
                      child: EditCategoryModalBottomSheetBody(
                        categoryModel: categoryModel,
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
