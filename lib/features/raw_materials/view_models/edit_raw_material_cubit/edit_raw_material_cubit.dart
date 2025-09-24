import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/core/di/dependancy_injection.dart';
import 'package:harrasi_rope_factory/features/raw_materials/models/raw_material_model.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'edit_raw_material_state.dart';

class EditRawMaterialCubit extends Cubit<EditRawMaterialState> {
  EditRawMaterialCubit({required this.material}) : super(EditRawMaterialInitial()) {
    initData();
  }

  final RawMaterialModel material;
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final unitController = TextEditingController();
  final stockController = TextEditingController();

  initData() {
    nameController.text = material.name;
    descriptionController.text = material.description;
    unitController.text = material.unit;
    stockController.text = material.currentStock.toString();
  }

  editRawMaterial() async {
    if (formKey.currentState!.validate()) {
      if (nameController.text != material.name ||
          descriptionController.text != material.description ||
          unitController.text != material.unit ||
          double.tryParse(stockController.text) != material.currentStock) {
        try {
          emit(EditRawMaterialLoading());
          await getIt<SupabaseClient>().from('raw_materials').update({
            'name': nameController.text,
            'description': descriptionController.text,
            'unit': unitController.text,
            'current_stock': double.tryParse(stockController.text) ?? 0,
            'updated_at': DateTime.now().toIso8601String(),
          }).eq('id', material.id);
          emit(EditRawMaterialSuccess());
        } on Exception catch (e) {
          emit(EditRawMaterialFailure(message: e.toString()));
        }
      } else {
        emit(EditRawMaterialNoChanges());
      }
    }
  }
  
}
