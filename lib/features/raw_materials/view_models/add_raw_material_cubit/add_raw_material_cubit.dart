import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/core/di/dependancy_injection.dart';
import 'package:harrasi_rope_factory/core/network/supabase/database/add_data.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'add_raw_material_state.dart';

class AddRawMaterialCubit extends Cubit<AddRawMaterialState> {
  AddRawMaterialCubit() : super(AddRawMaterialInitial());
  final addRawMaterialFormKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final unitController = TextEditingController();
  final quantityController = TextEditingController();
  final supabase = getIt<SupabaseClient>();
  // Add Row Material
  addRawMaterial() async {
    if (addRawMaterialFormKey.currentState!.validate()) {
      if (quantityController.text.isEmpty) {
        emit(UnitNotSelected());
        return;
      }
      try {
        emit(AddRawMaterialLoading());
        await addData(tableName: 'raw_materials', data: {
          'name': nameController.text,
          'description': descriptionController.text,
          'unit': unitController.text,
          'current_stock': double.parse(quantityController.text),
        });
        emit(AddRawMaterialSuccess());
      } catch (e) {
        emit(AddRawMaterialsError(error: e.toString()));
      }
    }
  }
}
