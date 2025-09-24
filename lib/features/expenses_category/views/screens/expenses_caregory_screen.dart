
import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/features/expenses_category/views/widgets/add_expenses_category_floating_action_button.dart';
import 'package:harrasi_rope_factory/features/expenses_category/views/widgets/expenses_category_screen_body.dart';

class ExpensesCategoryScreen extends StatelessWidget {
  const ExpensesCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ExpensesCategoryScreenBody(),
      floatingActionButton: AddExpensesCategoryFloatingActionButton(),
    );
  }
}



