import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/core/utilies/styles/app_text_styles.dart';
import 'package:harrasi_rope_factory/features/expenses_category/models/expenses_category_model.dart';
import 'package:harrasi_rope_factory/features/expenses_category/view_models/edit_expenses_category_cubit/edit_expenses_category_cubit.dart';
import 'package:harrasi_rope_factory/features/expenses_category/view_models/expenses_category_cubit/expenses_category_cubit.dart';
import 'package:harrasi_rope_factory/features/expenses_category/views/widgets/edit_expenses_category_modal_bottom_sheet_body.dart';
import 'package:harrasi_rope_factory/features/expenses_category/views/widgets/expense_category_details_modal_bottom_sheet_body.dart';
import 'package:harrasi_rope_factory/features/products/views/widgets/delete_and_edit_menu_button.dart';

class ExpenseCategoryCard extends StatelessWidget {
  const ExpenseCategoryCard({
    super.key,
    required this.expenseCategory,
  });

  final ExpensesCategoryModel expenseCategory;

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
            return ExpenseCategoryDetailsModalBottomSheetBody(
              expenseCategory: expenseCategory,
            );
          },
        );
      },
      child: Card(
        color: AppColors.kThirdColor,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.width * 0.03,
                vertical: SizeConfig.height * 0.01,
              ),
              child: Center(
                child: Text(
                  expenseCategory.name,
                  style: AppTextStyles.title20PrimaryColorBold,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: DeleteAndEditMenuButton(
                btnKey: btnKey,
                onDeleteTap: () {
                  context
                      .read<ExpensesCategoriesCubit>()
                      .deleteExpenseCategory(
                        id: expenseCategory.id,
                      );
                },
                iconColor: AppColors.kPrimaryColor,
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
                        create: (context) => EditExpensesCategoryCubit(
                          category: expenseCategory,
                        ),
                        child: EditExpensesCategoryModalBottomSheetBody(
                          categoryModel: expenseCategory,
                        ),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
