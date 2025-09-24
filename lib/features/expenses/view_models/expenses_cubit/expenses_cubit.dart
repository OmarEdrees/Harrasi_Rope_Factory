import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:harrasi_rope_factory/core/di/dependancy_injection.dart';
import 'package:harrasi_rope_factory/core/network/supabase/database/get_data.dart';
import 'package:harrasi_rope_factory/features/expenses/models/expense_model.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'expenses_state.dart';

class ExpensesCubit extends Cubit<ExpensesState> {
  ExpensesCubit() : super(ExpensesInitial()){
    getExpenses();
  }
  List<ExpenseModel> expenses = [];
  List<ExpenseModel> filteredExpenses = [];

  getExpenses() async {
    try {
      emit(GetExpensesLoading());
      final response = await getData(tableName: 'expenses');
      expenses = response.map((e) => ExpenseModel.fromJson(e)).toList();
      filteredExpenses = expenses;
      log(filteredExpenses.toString());
      emit(GetExpensesSuccess());
    } catch (e) {
      emit(GetExpensesFailure(message: e.toString()));
    }
  }
    // delete customer
  deleteExpense({required String id}) async {
    try {
      emit(DeleteExpenseLoading());
      await getIt<SupabaseClient>().from('customers').delete().eq('id', id);
      emit(DeleteExpenseSuccess());
    } catch (e) {
      emit(DeleteExpenseFailure(message: e.toString()));
    }
  }

  // search expense
  searchExpense(String query) {
    filteredExpenses = expenses
        .where((expense) => expense.categoryId
            .toString()
            .toLowerCase()
            .contains(query.toLowerCase()))
        .toList();
    emit(GetExpensesSuccess());
  }
}
