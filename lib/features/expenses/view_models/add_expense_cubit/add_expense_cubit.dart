import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/core/network/supabase/database/add_data.dart';
import 'package:harrasi_rope_factory/core/network/supabase/database/get_data.dart';
import 'package:harrasi_rope_factory/features/expenses_category/models/expenses_category_model.dart';
import 'package:meta/meta.dart';

part 'add_expense_state.dart';

class AddExpenseCubit extends Cubit<AddExpenseState> {
  AddExpenseCubit() : super(AddExpenseInitial()){
    getExpensesCategories();
  }
  final formKey = GlobalKey<FormState>();
  final categoryIdController = TextEditingController();
  final amountController = TextEditingController();
  final paymentMethodController = TextEditingController();
  final referenceController = TextEditingController();
  final notesController = TextEditingController();
  DateTime? expenseDate;
  List<ExpensesCategoryModel> expensesCategories = [];

  // get expenses categories
  getExpensesCategories() async {
    try {
      emit(GetExpensesCategoriesLoading());
      final response = await getData(tableName: 'expense_categories');
      expensesCategories =
          response.map((e) => ExpensesCategoryModel.fromJson(e)).toList();
      emit(GetExpensesCategoriesSuccess());
    } catch (e) {
      emit(GetExpensesCategoriesFailure(message: e.toString()));
    }
  }

  // add expense
  addExpense() async {
    if (formKey.currentState!.validate()) {
      if (expenseDate == null) {
        emit(SelectExpenseDate());
        return;
      }
      if (categoryIdController.text.isEmpty) {
        emit(SelectExpenseCategory());
        return;
      }
      if (paymentMethodController.text.isEmpty) {
        emit(SelectPaymentMethod());
        return;
      }
      try {
        emit(AddExpenseLoading());
        await addData(
          tableName: 'expenses',
          data: {
            'category_id': categoryIdController.text,
            'amount': double.parse(amountController.text),
            'payment_method': paymentMethodController.text,
            'reference': referenceController.text,
            'notes': notesController.text,
            'expense_date': expenseDate!.toIso8601String(),
            'created_at': DateTime.now().toIso8601String(),
            'updated_at': DateTime.now().toIso8601String(),
          },
        );
        emit(AddExpenseSuccess());
      } catch (e) {
        emit(AddExpenseFailure(message: e.toString()));
      }
    }
  }
}
