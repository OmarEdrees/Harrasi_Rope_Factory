import 'package:bloc/bloc.dart';
import 'package:harrasi_rope_factory/core/cache/cache_helper.dart';
import 'package:harrasi_rope_factory/core/di/dependancy_injection.dart';
import 'package:harrasi_rope_factory/core/network/supabase/database/get_data.dart';
import 'package:harrasi_rope_factory/features/categories/models/category_model.dart';
import 'package:harrasi_rope_factory/features/products/models/product_model.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial()) {
    getCategories();
    getProducts();
  }

  List<ProductModel> products = [];
  List<ProductModel> filteredProducts = [];
  List<CategoryModel> categories = [];
  Set<String> selectedCategoryIds = {}; // 🟡 بدل واحدة نخليها Set
  String searchQuery = "";

  // 🟡 get categories
  getCategories() async {
    emit(GetCategoriesLoading());
    try {
      final response = await getData(tableName: 'categories');
      categories = response.map((e) => CategoryModel.fromJson(e)).toList();
      getIt<CacheHelper>().saveCategories(categories);
      emit(GetCategoriesSuccess());
    } on Exception catch (e) {
      emit(GetCategoriesFailure(message: e.toString()));
    }
  }

  // 🟡 get products
   getProducts() async {
    try {
      emit(GetProductsLoading());
      final response = await getData(tableName: 'products');
      products = response.map((e) => ProductModel.fromJson(e)).toList();
      applyFilters();
    } catch (e) {
      emit(GetProductsFailure(message: e.toString()));
    }
  }
  // delete
  deleteProduct({required String id}) async {
    try {
      emit(DeleteProductLoading());
      await getIt<SupabaseClient>().from('products').delete().eq('id', id);
      emit(DeleteProductSuccess());
    } catch (e) {
      emit(DeleteProductFailure(message: e.toString()));
    }
  }

  // 🟡 search
  void searchForProducts(String query) {
    searchQuery = query;
    applyFilters();
  }

  // 🟡 toggle category
  void toggleCategory(String categoryId) {
    if (selectedCategoryIds.contains(categoryId)) {
      selectedCategoryIds.remove(categoryId);
    } else {
      selectedCategoryIds.add(categoryId);
    }
    applyFilters();
  }

  // 🟡 remove one category
  void removeCategory(String categoryId) {
    selectedCategoryIds.remove(categoryId);
    applyFilters();
  }

  // 🟡 clear all categories
  void clearAllCategories() {
    selectedCategoryIds.clear();
    applyFilters();
  }

  // 🟡 apply filters
  void applyFilters() {
    filteredProducts = products.where((product) {
      final matchesSearch = product.name
          .toLowerCase()
          .contains(searchQuery.toLowerCase());

      final matchesCategory = selectedCategoryIds.isEmpty
          ? true
          : selectedCategoryIds.contains(product.categoryId.toString());

      return matchesSearch && matchesCategory;
    }).toList();

    emit(GetProductsSuccess());
  }
}
