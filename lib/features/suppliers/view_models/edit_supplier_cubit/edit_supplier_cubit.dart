import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/core/di/dependancy_injection.dart';
import 'package:harrasi_rope_factory/features/suppliers/models/supplier_model.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'edit_supplier_state.dart';

class EditSupplierCubit extends Cubit<EditSupplierState> {
  EditSupplierCubit({required this.supplier}) : super(EditSupplierInitial()){
    initData();
  }

  final SupplierModel supplier;

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final contactPersonController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final taxIdController = TextEditingController();
  final paymentTermsController = TextEditingController();
  final creditLimitController = TextEditingController();
  final balanceController = TextEditingController();
  final notesController = TextEditingController();

  initData() {
    nameController.text = supplier.name;
    contactPersonController.text = supplier.contactPerson ?? '';
    phoneController.text = supplier.phone ?? '';
    emailController.text = supplier.email ?? '';
    addressController.text = supplier.address ?? '';
    taxIdController.text = supplier.taxId ?? '';
    paymentTermsController.text = supplier.paymentTerms ?? '';
    creditLimitController.text = supplier.creditLimit.toString();
    balanceController.text = supplier.balance.toString();
    notesController.text = supplier.notes ?? '';
  }

  Future<void> editSupplier() async {
    if (formKey.currentState!.validate()) {
      if (_hasChanges()) {
        try {
          emit(EditSupplierLoading());
          await getIt<SupabaseClient>().from('suppliers').update({
            'name': nameController.text,
            'contact_person': contactPersonController.text,
            'phone': phoneController.text,
            'email': emailController.text,
            'address': addressController.text,
            'tax_id': taxIdController.text,
            'payment_terms': paymentTermsController.text,
            'credit_limit': double.tryParse(creditLimitController.text) ?? 0,
            'balance': double.tryParse(balanceController.text) ?? 0,
            'notes': notesController.text,
            'updated_at': DateTime.now().toIso8601String(),
          }).eq('id', supplier.id);
          emit(EditSupplierSuccess());
        } catch (e) {
          emit(EditSupplierFailure(message: e.toString()));
        }
      } else {
        emit(EditSupplierNoChanges());
      }
    }
  }

  bool _hasChanges() {
    return nameController.text != supplier.name ||
        contactPersonController.text != (supplier.contactPerson ?? '') ||
        phoneController.text != (supplier.phone ?? '') ||
        emailController.text != (supplier.email ?? '') ||
        addressController.text != (supplier.address ?? '') ||
        taxIdController.text != (supplier.taxId ?? '') ||
        paymentTermsController.text != (supplier.paymentTerms ?? '') ||
        (double.tryParse(creditLimitController.text) ?? 0) != supplier.creditLimit ||
        (double.tryParse(balanceController.text) ?? 0) != supplier.balance ||
        notesController.text != (supplier.notes ?? '');
  }

  @override
  Future<void> close() {
    nameController.dispose();
    contactPersonController.dispose();
    phoneController.dispose();
    emailController.dispose();
    addressController.dispose();
    taxIdController.dispose();
    paymentTermsController.dispose();
    creditLimitController.dispose();
    balanceController.dispose();
    notesController.dispose();
    return super.close();
  }
}
