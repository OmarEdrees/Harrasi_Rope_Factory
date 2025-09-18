import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/features/expenses/views/widgets/add_expense_float_action_button.dart';
import 'package:harrasi_rope_factory/features/expenses/views/widgets/expenses_screen_body.dart';

class ExpensesScreen extends StatelessWidget {
  const ExpensesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ExpensesScreenBody(),
      floatingActionButton: AddExpenseFloatActionButton(),
    );
  }
}




