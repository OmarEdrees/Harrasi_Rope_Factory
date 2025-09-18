import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/features/expenses_category/models/expenses_category_model.dart';
import 'package:harrasi_rope_factory/features/expenses_category/views/widgets/expense_category_card.dart';

class ExpensesCategoriesList extends StatelessWidget {
  const ExpensesCategoriesList({
    super.key,
    required this.expensesCategories,
  });

  final List<ExpensesCategoryModel> expensesCategories;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.width * 0.03,
      ),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return ExpenseCategoryCard(
              expenseCategory: expensesCategories[index],
            );
          },
          childCount: expensesCategories.length,
        ),
      ),
    );
  }
}
