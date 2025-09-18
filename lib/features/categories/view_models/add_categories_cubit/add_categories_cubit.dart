import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/core/network/supabase/database/add_data.dart';
import 'package:meta/meta.dart';
part 'add_categories_state.dart';

class AddCategoriesCubit extends Cubit<AddCategoriesState> {
  AddCategoriesCubit() : super(AddCategoriesInitial());
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();

  addCategory() async {
    if (formKey.currentState!.validate()) {
      try {
        emit(AddCategoriesLoading());
        await addData(tableName: 'categories', data: {
          'name': nameController.text,
          'description': descriptionController.text
        });
        emit(AddCategoriesSuccess());
      } on Exception catch (e) {
        emit(AddCategoriesFailure(message: e.toString()));
      }
    }
  }
}
