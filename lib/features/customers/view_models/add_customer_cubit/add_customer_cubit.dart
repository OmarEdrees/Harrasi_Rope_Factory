import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/core/network/supabase/database/add_data.dart';
import 'package:meta/meta.dart';

part 'add_customer_state.dart';

class AddCustomerCubit extends Cubit<AddCustomerState> {
  AddCustomerCubit() : super(AddCustomerInitial());
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

  addCustomer() async {
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
        emit(AddCustomerLoading());
        await addData(tableName: 'customers', data: {
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
        emit(AddCustomerSuccess());
      } catch (e) {
        emit(AddCustomerFailure(message: e.toString()));
      }
    }
  }

}
