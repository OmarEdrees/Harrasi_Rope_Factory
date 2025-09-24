import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/core/di/dependancy_injection.dart';
import 'package:harrasi_rope_factory/features/bill_of_materials/models/bill_of_material_model.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'edit_bill_of_material_state.dart';

class EditBillOfMaterialCubit extends Cubit<EditBillOfMaterialState> {
  EditBillOfMaterialCubit({required this.billOfMaterial})
      : super(EditBillOfMaterialInitial()) {
    initData();
  }

  final BillOfMaterialModel billOfMaterial;
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();

  // init data
  initData() {
    nameController.text = billOfMaterial.name;
    descriptionController.text = billOfMaterial.description;
  }

  // edit Bill Of Material
  editBillOfMaterial() async {
    if (formKey.currentState!.validate()) {
      if (nameController.text != billOfMaterial.name ||
          descriptionController.text != billOfMaterial.description) {
        try {
          emit(EditBillOfMaterialLoading());
          await getIt<SupabaseClient>().from('bill_of_materials').update({
            'name': nameController.text,
            'description': descriptionController.text,
            'updated_at': DateTime.now().toIso8601String(),
          }).eq('id', billOfMaterial.id);
          emit(EditBillOfMaterialSuccess());
        } on Exception catch (e) {
          emit(EditBillOfMaterialFailure(errorMessage: e.toString()));
        }
      } else {
        emit(EditBillOfMaterialNoChanges());
      }
    }
  }
}
