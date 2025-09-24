import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/core/di/dependancy_injection.dart';
import 'package:harrasi_rope_factory/core/network/supabase/database/get_data.dart';
import 'package:harrasi_rope_factory/features/categories/models/category_model.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial()) {
    getCategories();
  }

  List<CategoryModel> categories = [];
  List<CategoryModel> filterCategories = [];
  getCategories() async {
    try {
      emit(GetCategoriesLoading());
      final response = await getData(tableName: 'categories');
      categories = response.map((e) => CategoryModel.fromJson(e)).toList();
      filterCategories = categories;
      emit(GetCategoriesSuccess());
    } catch (e) {
      emit(GetCategoriesFailure(message: e.toString()));
    }
  }
  // delete category
  deleteCategory({required String id}) async {
    try {
      emit(DeleteCategoryLoading());
      await getIt<SupabaseClient>().from('categories').delete().match({'id': id});
      categories.removeWhere((element) => element.id == id);
      filterCategories = categories;
      emit(DeleteCategorySuccess());
    }
    catch (e) {
      emit(DeleteCategoryFailure(message: e.toString()));
    }
  }
  // search for category
  searchForCategory(String query) {
    filterCategories =
        categories.where((element) => element.name.toLowerCase().contains(query.toLowerCase())).toList();
    emit(GetCategoriesSuccess());
  }
}
