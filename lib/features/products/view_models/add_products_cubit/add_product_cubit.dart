import 'dart:developer';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:harrasi_rope_factory/core/cache/cache_helper.dart';
import 'package:harrasi_rope_factory/core/di/dependancy_injection.dart';
import 'package:harrasi_rope_factory/core/helper/pick_image.dart';
import 'package:harrasi_rope_factory/core/network/supabase/database/add_data.dart';
import 'package:harrasi_rope_factory/core/network/supabase/storage/upload_file.dart';
import 'package:harrasi_rope_factory/features/categories/models/category_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit()
      : super(AddProductInitial()); // form key and controllers and variables
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final purchasePriceController = TextEditingController();
  final sellingPriceController = TextEditingController();
  final unitController = TextEditingController();
  final minStockLevelController = TextEditingController();
  final currentStockController = TextEditingController();
  final categoryIdController = TextEditingController();
  bool isManufacturer = false;
  File? imageFile;
  // categories
  List<CategoryModel> categories = getIt<CacheHelper>().getCategories() ?? [];

  // pick product image
  pickProductImage() async {
    try {
      await pickImage(source: ImageSource.gallery).then(
        (value) {
          if (value != null) {
            imageFile = value;
            emit(PickProductImageSuccess());
          }
        },
      );
    } on Exception catch (e) {
      emit(PickProductImageFailure(message: e.toString()));
    }
  }

  // change is manufacturer
  void changeIsManufacturer() {
    isManufacturer = !isManufacturer;
    emit(ChangeIsManufacturer());
  }

  // get profit
  double netProfit = 0;
  getProfit() {
    double profit = double.parse(sellingPriceController.text) -
        double.parse(purchasePriceController.text);
    netProfit = profit;
    emit(UpdateProfit());
  }

  // add product
  void addProduct() async {
    if (formKey.currentState!.validate()) {
      if (unitController.text.isEmpty) {
        emit(SelectUnit());
        return;
      }
      if (categoryIdController.text.isEmpty) {
        emit(SelectCategory());
        return;
      }
      try {
        emit(AddProductLoading());
        log(categoryIdController.text);
        await addData(
          tableName: 'products',
          data: {
            'name': nameController.text,
            'description': descriptionController.text,
            'purchase_price': purchasePriceController.text,
            'category_id': categoryIdController.text,
            'selling_price': sellingPriceController.text,
            'unit': unitController.text,
            'min_stock_level': minStockLevelController.text,
            'current_stock': currentStockController.text,
            'is_manufactured': isManufacturer,
            'sku': 'sku 3',
            if (imageFile != null)
              'image': await uploadFileToSupabaseStorage(file: imageFile!),
            'created_at': DateTime.now().toIso8601String(),
            'updated_at': DateTime.now().toIso8601String(),
          },
        );
        emit(AddProductSuccess());
      } on Exception catch (e) {
        log(e.toString());
        emit(AddProductFailure(message: e.toString()));
      }
    }
  }
}
