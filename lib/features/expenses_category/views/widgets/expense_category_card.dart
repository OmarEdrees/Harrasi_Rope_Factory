import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/core/utilies/styles/app_text_styles.dart';
import 'package:harrasi_rope_factory/features/expenses_category/models/expenses_category_model.dart';
import 'package:harrasi_rope_factory/features/expenses_category/views/widgets/expense_category_details_modal_bottom_sheet_body.dart';

class ExpenseCategoryCard extends StatelessWidget {
  const ExpenseCategoryCard({
    super.key,
    required this.expenseCategory,
  });

  final ExpensesCategoryModel expenseCategory;

  @override
  Widget build(BuildContext context) {
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
        child: Padding(
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
      ),
    );
  }
}

