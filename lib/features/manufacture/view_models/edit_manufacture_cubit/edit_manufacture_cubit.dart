import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/core/di/dependancy_injection.dart';
import 'package:harrasi_rope_factory/features/manufacture/models/manufacture_model.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'edit_manufacture_state.dart';

class EditManufactureCubit extends Cubit<EditManufactureState> {
  EditManufactureCubit({required this.manufacture})
      : super(EditManufactureInitial()) {
    initData();
  }

  final ManufactureModel manufacture;
  final formKey = GlobalKey<FormState>();
  final quantityController = TextEditingController();
  final notesController = TextEditingController();
  String status = "pending";

  // init data
  initData() {
    quantityController.text = manufacture.quantity.toString();
    notesController.text = manufacture.notes ?? "";
    status = manufacture.status;
  }

  // change status
  changeStatus(String newStatus) {
    status = newStatus;
  }

  // edit manufacture
  Future<void> editManufacture() async {
    if (formKey.currentState!.validate()) {
      if (quantityController.text != manufacture.quantity.toString() ||
          notesController.text != (manufacture.notes ?? "") ||
          status != manufacture.status) {
        try {
          emit(EditManufactureLoading());
          await getIt<SupabaseClient>().from('manufacturing_orders').update({
            'quantity': int.parse(quantityController.text),
            'notes': notesController.text,
            'status': status,
            'updated_at': DateTime.now().toIso8601String(),
          }).eq('id', manufacture.id);
          emit(EditManufactureSuccess());
        } on Exception catch (e) {
          emit(EditManufactureFailure(message: e.toString()));
        }
      } else {
        emit(EditManufactureNoChanges());
      }
    }
  }
}
