import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/features/bill_of_materials/views/widgets/custom_empty_list.dart';
import 'package:harrasi_rope_factory/features/expenses/models/expense_model.dart';
import 'package:harrasi_rope_factory/features/expenses/views/widgets/expense_list_tile.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
  });
  final List<ExpenseModel> expenses;
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(
        top: SizeConfig.height * 0.03,
        bottom: SizeConfig.height * 0.01,
      ),
      sliver: expenses.isEmpty
          ? SliverFillRemaining(child: CustomEmptyList())
          : SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return ExpenseListTile(
                    expense: expenses[index],
                  );
                },
                childCount: expenses.length,
              ),
            ),
    );
  }
}
