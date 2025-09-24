import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/core/di/dependancy_injection.dart';
import 'package:harrasi_rope_factory/features/expenses_category/models/expenses_category_model.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'edit_expenses_category_state.dart';

class EditExpensesCategoryCubit extends Cubit<EditExpensesCategoryState> {
  EditExpensesCategoryCubit({required this.category})
      : super(EditExpensesCategoryInitial()) {
    initData();
  }

  final ExpensesCategoryModel category;
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();

  // init data
  initData() {
    nameController.text = category.name;
    descriptionController.text = category.description;
  }

  editExpensesCategory() async {
    if (formKey.currentState!.validate()) {
      if (nameController.text != category.name ||
          descriptionController.text != category.description) {
        try {
          emit(EditExpensesCategoryLoading());
          await getIt<SupabaseClient>().from('expense_categories').update({
            'name': nameController.text,
            'description': descriptionController.text,
            'updated_at': DateTime.now().toIso8601String(),
          }).eq('id', category.id);
          emit(EditExpensesCategorySuccess());
        } on Exception catch (e) {
          emit(EditExpensesCategoryFailure(message: e.toString()));
        }
      } else {
        emit(EditExpensesCategoryNoChanges());
      }
    }
  }
}