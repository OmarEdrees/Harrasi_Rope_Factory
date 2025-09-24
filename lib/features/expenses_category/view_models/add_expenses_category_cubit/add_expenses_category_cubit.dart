import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/core/network/supabase/database/add_data.dart';
import 'package:meta/meta.dart';

part 'add_expenses_category_state.dart';

class AddExpensesCategoriesCubit extends Cubit<AddExpensesCategoryState> {
  AddExpensesCategoriesCubit() : super(AddExpensesCategoryInitial());
  //
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  // add expenses category
  addExpensesCategory() async {
    if (formKey.currentState!.validate()) {
      try {
        emit(AddExpensesCategoryLoading());
        await addData(tableName: 'expense_categories', data: {
          'name': nameController.text,
          'description': descriptionController.text,
          'created_at': DateTime.now().toIso8601String(),
          'updated_at': DateTime.now().toIso8601String(),
        });
        emit(AddExpensesCategorySuccess());
      } catch (e) {
        emit(AddExpensesCategoryFailure(message: e.toString()));
      }
    }
  }
}
