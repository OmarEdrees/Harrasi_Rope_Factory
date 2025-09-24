import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/core/network/supabase/database/add_data.dart';
import 'package:harrasi_rope_factory/core/network/supabase/database/get_data.dart';
import 'package:harrasi_rope_factory/features/bill_of_materials/models/bill_of_material_model.dart';
import 'package:harrasi_rope_factory/features/raw_materials/models/raw_material_model.dart';
import 'package:meta/meta.dart';

part 'add_bill_of_material_items_state.dart';

class AddBillOfMaterialItemsCubit extends Cubit<AddBillOfMaterialItemsState> {
  AddBillOfMaterialItemsCubit({required this.billOfMaterialModel})
      : super(AddBillOfMaterialItemsInitial()) {
    getMaterials();
  }

  List<RawMaterialModel> rawMaterials = [];
  final rawMaterialIdController = TextEditingController();
  final quantityController = TextEditingController();
  final unitController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final BillOfMaterialModel billOfMaterialModel;

  // get raw materials
  getMaterials() async {
    try {
      emit(GetRawMaterialsLoading());
      final response = await getData(tableName: "raw_materials");
      rawMaterials = response.map((e) => RawMaterialModel.fromJson(e)).toList();
      emit(GetRawMaterialsSuccess());
    } catch (e) {
      emit(GetRawMaterialsError(error: e.toString()));
    }
  }

  // add bill of material item
  addBillOfMaterialItem() async {
    if (formKey.currentState!.validate()) {
      if (rawMaterialIdController.text.isEmpty) {
        emit(SelectRawMaterial());
        return;
      }
      if (quantityController.text.isEmpty) {
        emit(SelectUnit());
        return;
      }

      try {
        emit(AddBillOfMaterialItemsLoading());
        log("${rawMaterialIdController.text} ${quantityController.text} ${unitController.text} ${billOfMaterialModel.id}");
        await addData(tableName: "bom_items", data: {
          "bom_id": billOfMaterialModel.id,
          "raw_material_id": rawMaterialIdController.text,
          "quantity": double.parse(quantityController.text),
          "unit": unitController.text,
          "created_at": DateTime.now().toIso8601String(),
          "updated_at": DateTime.now().toIso8601String(),
        });
        emit(AddBillOfMaterialItemsSuccess());
      } catch (e) {
        emit(AddBillOfMaterialItemsFailure(error: e.toString()));
      }
    }
  }
}
