import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:harrasi_rope_factory/core/network/supabase/database/add_data.dart';
import 'package:harrasi_rope_factory/core/network/supabase/database/get_data.dart';
import 'package:harrasi_rope_factory/features/bill_of_materials/models/bill_of_material_model.dart';
import 'package:harrasi_rope_factory/features/products/models/product_model.dart';
import 'package:meta/meta.dart';

part 'add_manufacture_item_state.dart';

class AddManufactureItemCubit extends Cubit<AddManufactureItemState> {
  AddManufactureItemCubit() : super(AddManufactureItemInitial()) {
    loadData();
  }

  final formKey = GlobalKey<FormState>();
  final quantityController = TextEditingController();
  final notesController = TextEditingController();
  final productIdController = TextEditingController();
  final billOfMaterialIdController = TextEditingController();
  DateTime? startDate, endDate;

  List<ProductModel> products = [];
  List<BillOfMaterialModel> billOfMaterials = [];

  // 🟡 استدعاء الاتنين مع بعض
  loadData() {
    getBillOfMaterials();
    getProducts();
  }

  // 🟡 get bill of materials
  Future<void> getBillOfMaterials() async {
    try {
      emit(GetBillOfMaterialsLoading());
      final response = await getData(tableName: 'bill_of_materials');
      billOfMaterials =
          response.map((e) => BillOfMaterialModel.fromJson(e)).toList();
      emit(GetBillOfMaterialsSuccess());
    } catch (e) {
      emit(GetBillOfMaterialsFailure(errorMessage: e.toString()));
    }
  }

  // 🟡 get products
  Future<void> getProducts() async {
    try {
      emit(GetProductsLoading());
      final response = await getData(tableName: 'products');
      products = response.map((e) => ProductModel.fromJson(e)).toList();
      emit(GetProductsSuccess());
    } catch (e) {
      emit(GetProductsFailure(message: e.toString()));
    }
  }

  // 🟡 add manufacture
  Future<void> addManufactureItem() async {
    if (formKey.currentState!.validate()) {
      if (startDate == null) {
        emit(SelectStartDate());
        return;
      }
      if (endDate == null) {
        emit(SelectEndDate());
        return;
      }
      if (productIdController.text.isEmpty) {
        emit(SelectProduct());
        return;
      }
      if (billOfMaterialIdController.text.isEmpty) {
        emit(SelectBillOfMaterial());
        return;
      }

      try {
        emit(AddManufactureItemLoading());
        await addData(tableName: 'manufacturing_orders', data: {
          'product_id': productIdController.text,
          'bom_id': billOfMaterialIdController.text,
          'quantity': int.parse(quantityController.text),
          'start_date': startDate!.toIso8601String(),
          'end_date': endDate!.toIso8601String(),
          'notes': notesController.text,
          'created_at': DateTime.now().toIso8601String(),
          'updated_at': DateTime.now().toIso8601String(),
        });
        emit(AddManufactureItemSuccess());
      } catch (e) {
        emit(AddManufactureItemFailure(errorMessage: e.toString()));
      }
    }
  }
}
