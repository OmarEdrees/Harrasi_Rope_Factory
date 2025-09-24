import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/core/di/dependancy_injection.dart';
import 'package:harrasi_rope_factory/features/categories/models/category_model.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'edit_category_state.dart';

class EditCategoryCubit extends Cubit<EditCategoryState> {
  EditCategoryCubit({required this.category}) : super(EditCategoryInitial()) {
    initData();
  }

  final CategoryModel category;
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  bool isActive = false;
  // init data
  initData() {
    nameController.text = category.name;
    descriptionController.text = category.description;
    isActive = category.active;
  }

  // change active
  changeActive() {
    isActive = !isActive;
    emit(ChangeActive());
  }

  editCategory() async {
    if (formKey.currentState!.validate()) {
      if (nameController.text != category.name ||
          descriptionController.text != category.description ||
          isActive != category.active) {
        try {
          emit(EditCategoryLoading());
          await getIt<SupabaseClient>().from('categories').update({
            'name': nameController.text,
            'description': descriptionController.text,
            'active': isActive,
            'updated_at': DateTime.now().toIso8601String(),
          }).eq('id', category.id);
          emit(EditCategorySuccess());
        } on Exception catch (e) {
          emit(EditCategoryFailure(message: e.toString()));
        }
      } else {
        emit(EditCategoryNoChanges());
      }
    }
  }
}
