import 'dart:convert';
import 'package:harrasi_rope_factory/features/categories/models/category_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  //! Initialize the cache
  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  //! Save basic types
  Future<bool> saveData({required String key, required dynamic value}) async {
    if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    } else if (value is String) {
      return await sharedPreferences.setString(key, value);
    } else if (value is int) {
      return await sharedPreferences.setInt(key, value);
    } else if (value is double) {
      return await sharedPreferences.setDouble(key, value);
    } else {
      throw Exception('Unsupported type');
    }
  }

  dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }

  String? getDataString({required String key}) {
    return sharedPreferences.getString(key);
  }

  Future<bool> removeData({required String key}) async {
    return await sharedPreferences.remove(key);
  }

  Future<bool> clearData() async {
    return await sharedPreferences.clear();
  }

  Future<bool> containsKey({required String key}) async {
    return sharedPreferences.containsKey(key);
  }

  // //! Save UserModel in local storage
  // Future<bool> saveUserModel(UserModel user) async {
  //   String userJson = jsonEncode(user.toJson());
  //   return await sharedPreferences.setString('user', userJson);
  // }

  // //! Get UserModel from local storage
  // UserModel? getUserModel() {
  //   String? userJson = sharedPreferences.getString('user');
  //   if (userJson == null) return null;

  //   Map<String, dynamic> userMap = jsonDecode(userJson);
  //   return UserModel.fromJson(userMap);
  // }

  Future<bool> saveCategories(List<CategoryModel> categories) async {
    final List<String> jsonList =
        categories.map((e) => jsonEncode(e.toJson())).toList();
    return await sharedPreferences.setStringList('categories', jsonList);
  }

  //! get categories
  List<CategoryModel>? getCategories() {
    final List<String>? jsonList =
        sharedPreferences.getStringList('categories');
    if (jsonList == null) return null;

    return jsonList.map((e) => CategoryModel.fromJson(jsonDecode(e))).toList();
  }
}
