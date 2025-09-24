import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/core/di/dependancy_injection.dart';
import 'package:harrasi_rope_factory/features/customers/models/customer_model.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'edit_customer_state.dart';

class EditCustomerCubit extends Cubit<EditCustomerState> {
  EditCustomerCubit({required this.customer}) : super(EditCustomerInitial()){
    initData();
  }

  final CustomerModel customer;

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
    nameController.text = customer.name;
    contactPersonController.text = customer.contactPerson ?? '';
    phoneController.text = customer.phone ?? '';
    emailController.text = customer.email ?? '';
    addressController.text = customer.address ?? '';
    taxIdController.text = customer.taxId ?? '';
    paymentTermsController.text = customer.paymentTerms ?? '';
    creditLimitController.text = customer.creditLimit.toString();
    balanceController.text = customer.balance.toString();
    notesController.text = customer.notes ?? '';
  }

  Future<void> editCustomer() async {
    if (formKey.currentState!.validate()) {
      if (_hasChanges()) {
        try {
          emit(EditCustomerLoading());
          await getIt<SupabaseClient>().from('customers').update({
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
          }).eq('id', customer.id);
          emit(EditCustomerSuccess());
        } catch (e) {
          emit(EditCustomerFailure(message: e.toString()));
        }
      } else {
        emit(EditCustomerNoChanges());
      }
    }
  }

  bool _hasChanges() {
    return nameController.text != customer.name ||
        contactPersonController.text != (customer.contactPerson ?? '') ||
        phoneController.text != (customer.phone ?? '') ||
        emailController.text != (customer.email ?? '') ||
        addressController.text != (customer.address ?? '') ||
        taxIdController.text != (customer.taxId ?? '') ||
        paymentTermsController.text != (customer.paymentTerms ?? '') ||
        (double.tryParse(creditLimitController.text) ?? 0) != customer.creditLimit ||
        (double.tryParse(balanceController.text) ?? 0) != customer.balance ||
        notesController.text != (customer.notes ?? '');
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
