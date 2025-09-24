import 'package:custom_quick_alert/custom_quick_alert.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harrasi_rope_factory/core/components/custom_elevated_button.dart';
import 'package:harrasi_rope_factory/core/components/custom_text_form_field_with_title.dart';
import 'package:harrasi_rope_factory/core/utilies/extensions/app_extensions.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/features/categories/views/widgets/custom_circular_progress_indecator.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/custom_title.dart';
import 'package:harrasi_rope_factory/features/suppliers/models/supplier_model.dart';
import 'package:harrasi_rope_factory/features/suppliers/view_models/edit_supplier_cubit/edit_supplier_cubit.dart';
import 'package:harrasi_rope_factory/generated/locale_keys.g.dart';

class EditSupplierModalBottomSheetBody extends StatelessWidget {
  final SupplierModel supplierModel;
  const EditSupplierModalBottomSheetBody(
      {super.key, required this.supplierModel});

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditSupplierCubit, EditSupplierState>(
      listener: (context, state) {
        if (state is EditSupplierSuccess) {
          context.popScreen();
          CustomQuickAlert.success(
            title: LocaleKeys.suppliers_edit_supplier_supplier_updated.tr(),
            message: LocaleKeys.suppliers_edit_supplier_supplier_updated_message
                .tr(),
            animationType: CustomQuickAlertAnimationType.scale,
          );
        }
        if (state is EditSupplierFailure) {
          CustomQuickAlert.error(
            title: LocaleKeys
                .sales_invoices_add_sales_customQuickAlert_error_title
                .tr(),
            message: state.message,
            animationType: CustomQuickAlertAnimationType.slideInDown,
          );
        }
        if (state is EditSupplierNoChanges) {
          CustomQuickAlert.warning(
            title: LocaleKeys.customers_edit_customer_no_changes.tr(),
            message: LocaleKeys.suppliers_edit_supplier_customQuickAlert_warning
                .tr(),
            animationType: CustomQuickAlertAnimationType.scale,
          );
        }
      },
      child: DraggableScrollableSheet(
        expand: true,
        shouldCloseOnMinExtent: true,
        initialChildSize: 0.9,
        minChildSize: 0.9,
        maxChildSize: 0.9,
        builder: (context, scrollController) {
          final cubit = context.read<EditSupplierCubit>();
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: SingleChildScrollView(
              controller: scrollController,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.width * 0.03,
                  vertical: SizeConfig.height * 0.01,
                ),
                child: Form(
                  key: cubit.formKey,
                  child: Column(
                    children: [
                      CustomTitle(
                          title: LocaleKeys
                              .suppliers_edit_supplier_update_supplier
                              .tr()),
                      SizedBox(height: SizeConfig.height * 0.03),
                      CustomTextFormFieldWithTitle(
                        hintText: LocaleKeys
                            .suppliers_add_supplier_enter_supplier_name
                            .tr(),
                        title: LocaleKeys.suppliers_add_supplier_Supplier_Name
                            .tr(),
                        controller: cubit.nameController,
                      ),
                      SizedBox(height: SizeConfig.height * 0.01),
                      CustomTextFormFieldWithTitle(
                        hintText: LocaleKeys
                            .suppliers_edit_supplier_enter_contact_person
                            .tr(),
                        title: LocaleKeys.suppliers_add_supplier_Contact_Person
                            .tr(),
                        controller: cubit.contactPersonController,
                      ),
                      SizedBox(height: SizeConfig.height * 0.01),
                      CustomTextFormFieldWithTitle(
                        hintText:
                            LocaleKeys.suppliers_add_supplier_enter_phone.tr(),
                        title: LocaleKeys.suppliers_add_supplier_Phone.tr(),
                        controller: cubit.phoneController,
                      ),
                      SizedBox(height: SizeConfig.height * 0.01),
                      CustomTextFormFieldWithTitle(
                        hintText:
                            LocaleKeys.suppliers_add_supplier_enter_email.tr(),
                        title: LocaleKeys.suppliers_add_supplier_Email.tr(),
                        controller: cubit.emailController,
                      ),
                      SizedBox(height: SizeConfig.height * 0.01),
                      CustomTextFormFieldWithTitle(
                        hintText: LocaleKeys
                            .suppliers_add_supplier_enter_address
                            .tr(),
                        title: LocaleKeys.suppliers_add_supplier_Address.tr(),
                        controller: cubit.addressController,
                      ),
                      SizedBox(height: SizeConfig.height * 0.01),
                      CustomTextFormFieldWithTitle(
                        hintText: LocaleKeys
                            .customers_edit_customer_enter_tax_iD
                            .tr(),
                        title: LocaleKeys.customers_edit_customer_tax_iD.tr(),
                        controller: cubit.taxIdController,
                      ),
                      SizedBox(height: SizeConfig.height * 0.01),
                      CustomTextFormFieldWithTitle(
                        hintText: LocaleKeys
                            .customers_edit_customer_enter_payment_terms
                            .tr(),
                        title: LocaleKeys.suppliers_add_supplier_Payment_Terms
                            .tr(),
                        controller: cubit.paymentTermsController,
                      ),
                      SizedBox(height: SizeConfig.height * 0.01),
                      CustomTextFormFieldWithTitle(
                        hintText: LocaleKeys
                            .suppliers_add_supplier_enter_credit_limit
                            .tr(),
                        title:
                            LocaleKeys.suppliers_add_supplier_Credit_Limit.tr(),
                        controller: cubit.creditLimitController,
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: SizeConfig.height * 0.01),
                      CustomTextFormFieldWithTitle(
                        hintText: LocaleKeys
                            .customers_add_customer_enter_customer_balance
                            .tr(),
                        title: LocaleKeys
                            .customers_add_customer_Customer_Balance
                            .tr(),
                        controller: cubit.balanceController,
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: SizeConfig.height * 0.01),
                      CustomTextFormFieldWithTitle(
                        hintText: LocaleKeys
                            .sales_invoices_add_sales_enterYourNotes
                            .tr(),
                        title: LocaleKeys.sales_invoices_add_sales_notes.tr(),
                        controller: cubit.notesController,
                        maxLines: 3,
                      ),
                      SizedBox(height: SizeConfig.height * 0.05),
                      BlocBuilder<EditSupplierCubit, EditSupplierState>(
                        buildWhen: (previous, current) =>
                            current is EditSupplierLoading ||
                            previous is EditSupplierLoading,
                        builder: (context, state) {
                          return state is EditSupplierLoading
                              ? CustomCircularProgresIndecator()
                              : CustomElevatedButton(
                                  onPressed: () => cubit.editSupplier(),
                                  name: LocaleKeys
                                      .suppliers_edit_supplier_update_supplier
                                      .tr(),
                                );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
