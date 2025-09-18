import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/core/network/supabase/database/add_data.dart';
import 'package:harrasi_rope_factory/core/network/supabase/database/get_data.dart';
import 'package:harrasi_rope_factory/features/products/models/product_model.dart';
import 'package:meta/meta.dart';

part 'add_bill_of_material_state.dart';

class AddBillOfMaterialCubit extends Cubit<AddBillOfMaterialState> {
  AddBillOfMaterialCubit() : super(AddBillOfMaterialInitial()) {
    getProducts();
  }
  // key and controllers
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final productIdController = TextEditingController();
  List<ProductModel> products = [];
  // 🟡 get products
  getProducts() async {
    try {
      emit(GetProductsLoading());
      final response = await getData(tableName: 'products');
      products = response.map((e) => ProductModel.fromJson(e)).toList();
      emit(GetProductsSuccess());
    } catch (e) {
      emit(GetProductsError(message: e.toString()));
    }
  }

  addBillOfMaterial() async {
    if (formKey.currentState!.validate()) {
      if (productIdController.text.isEmpty) {
        emit(SelectProduct());
        return;
      }
      try {
        emit(AddBillOfMaterialLoading());
        await addData(tableName: 'bill_of_materials', data: {
          'name': nameController.text,
          'description': descriptionController.text,
          'product_id': productIdController.text,
          'created_at': DateTime.now().toIso8601String(),
          'updated_at': DateTime.now().toIso8601String(),
        });
        emit(AddBillOfMaterialSuccess());
      } catch (e) {
        emit(AddBillOfMaterialError(errorMessage: e.toString()));
      }
    }
  }
}
