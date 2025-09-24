import 'package:bloc/bloc.dart';
import 'package:harrasi_rope_factory/core/di/dependancy_injection.dart';
import 'package:harrasi_rope_factory/core/network/supabase/database/get_data.dart';
import 'package:harrasi_rope_factory/features/expenses_category/models/expenses_category_model.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'expenses_category_state.dart';

class ExpensesCategoriesCubit extends Cubit<ExpensesCategoriesState> {
  ExpensesCategoriesCubit() : super(ExpensesCategoriesInitial()) {
    getExpensesCategories();
  }
  List<ExpensesCategoryModel> expensesCategories = [];
  List<ExpensesCategoryModel> filterExpensesCategories = [];
  // get expenses categories
  getExpensesCategories() async {
    try {
      emit(GetExpensesCategoriesLoading());
      final response = await getData(tableName: 'expense_categories');
      expensesCategories =
          response.map((e) => ExpensesCategoryModel.fromJson(e)).toList();
      filterExpensesCategories = expensesCategories;
      emit(GetExpensesCategoriesSuccess());
    } catch (e) {
      emit(GetExpensesCategoriesFailure(message: e.toString()));
    }
  }

  // delete expenses categories
  deleteExpenseCategory({required String id}) async {
    try {
      emit(DeleteExpensesCategoryLoading());
      await getIt<SupabaseClient>()
          .from('expense_categories')
          .delete()
          .eq('id', id);
      emit(DeleteExpensesCategorySuccess());
    } catch (e) {
      emit(DeleteExpensesCategoryFailure(message: e.toString()));
    }
  }

  // search expenses categories
  searchForExpensesCategories(String value) {
    filterExpensesCategories = expensesCategories
        .where((element) =>
            element.name.toLowerCase().contains(value.toLowerCase()))
        .toList();
    emit(GetExpensesCategoriesSuccess());
  }
}
