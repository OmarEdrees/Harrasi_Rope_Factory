import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:harrasi_rope_factory/core/network/supabase/database/add_data.dart';
import 'package:meta/meta.dart';

part 'add_supplier_state.dart';

class AddSupplierCubit extends Cubit<AddSupplierState> {
  AddSupplierCubit() : super(AddSupplierInitial());
  //
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final contactPersonController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();
  final paymentTermsController = TextEditingController();
  final creditLimitController = TextEditingController();
  final balanceController = TextEditingController();
  final noteController = TextEditingController();

  addSupplier() async {
    if (formKey.currentState!.validate()) {
      if (contactPersonController.text.isEmpty) {
        emit(SelectContactPerson());
        return;
      }
      if (paymentTermsController.text.isEmpty) {
        emit(SelectPaymentTerm());
        return;
      }
      try {
        emit(AddSupplierLoading());
        await addData(tableName: 'suppliers', data: {
          'name': nameController.text,
          'contact_person': contactPersonController.text,
          'email': emailController.text,
          'address': addressController.text,
          'phone': phoneController.text,
          'payment_terms': paymentTermsController.text,
          'credit_limit': creditLimitController.text.isEmpty
              ? 0.0
              : double.parse(creditLimitController.text),
          'balance': balanceController.text.isEmpty
              ? 0.0
              : double.parse(balanceController.text),
          'notes': noteController.text.isEmpty ? "No Note" : noteController.text,
        });
        emit(AddSupplierSuccess());
      } catch (e) {
        emit(AddSupplierFailure(message: e.toString()));
      }
    }
  }
}
