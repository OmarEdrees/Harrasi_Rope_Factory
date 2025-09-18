import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/core/network/supabase/database/get_data.dart';
import 'package:harrasi_rope_factory/features/categories/models/category_model.dart';
import 'package:meta/meta.dart';

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

  searchForCategory(String query) {
    filterCategories =
        categories.where((element) => element.name.toLowerCase().contains(query.toLowerCase())).toList();
    emit(GetCategoriesSuccess());
  }
}
