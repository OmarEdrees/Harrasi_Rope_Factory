import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/core/di/dependancy_injection.dart';
import 'package:harrasi_rope_factory/features/products/models/product_model.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'edit_product_state.dart';

class EditProductCubit extends Cubit<EditProductState> {
  EditProductCubit({required this.product}) : super(EditProductInitial()) {
    initData();
  }

  final ProductModel product;
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final purchasePriceController = TextEditingController();
  final sellingPriceController = TextEditingController();
  final unitController = TextEditingController();
  final minStockController = TextEditingController();
  bool isManufactured = false;

  // ✅ init data
  void initData() {
    nameController.text = product.name;
    descriptionController.text = product.description;
    purchasePriceController.text = product.purchasePrice.toString();
    sellingPriceController.text = product.sellingPrice.toString();
    unitController.text = product.unit;
    minStockController.text = product.minStockLevel.toString();
    isManufactured = product.isManufactured;
  }

  // ✅ toggle isManufactured
  void changeManufactured() {
    isManufactured = !isManufactured;
    emit(ChangeManufactured());
  }

  // ✅ edit product
  Future<void> editProduct() async {
    if (formKey.currentState!.validate()) {
      if (nameController.text != product.name ||
          descriptionController.text != product.description ||
          double.parse(purchasePriceController.text) != product.purchasePrice ||
          double.parse(sellingPriceController.text) != product.sellingPrice ||
          unitController.text != product.unit ||
          int.parse(minStockController.text) != product.minStockLevel ||
          isManufactured != product.isManufactured) {
        try {
          emit(EditProductLoading());
          await getIt<SupabaseClient>().from('products').update({
            'name': nameController.text,
            'description': descriptionController.text,
            'purchase_price': double.parse(purchasePriceController.text),
            'selling_price': double.parse(sellingPriceController.text),
            'unit': unitController.text,
            'min_stock_level': int.parse(minStockController.text),
            'is_manufactured': isManufactured,
            'updated_at': DateTime.now().toIso8601String(),
          }).eq('id', product.id);
          emit(EditProductSuccess());
        } on Exception catch (e) {
          emit(EditProductFailure(message: e.toString()));
        }
      } else {
        emit(EditProductNoChanges());
      }
    }
  }
}
