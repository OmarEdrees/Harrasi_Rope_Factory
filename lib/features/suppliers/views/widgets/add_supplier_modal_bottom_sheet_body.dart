import 'package:custom_quick_alert/custom_quick_alert.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harrasi_rope_factory/core/components/custom_drop_down_button_form_field.dart';
import 'package:harrasi_rope_factory/core/components/custom_elevated_button.dart';
import 'package:harrasi_rope_factory/core/components/custom_text_form_field_with_title.dart';
import 'package:harrasi_rope_factory/core/constants/app_constants.dart';
import 'package:harrasi_rope_factory/core/utilies/extensions/app_extensions.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/features/categories/views/widgets/custom_circular_progress_indecator.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/custom_title.dart';
import 'package:harrasi_rope_factory/features/suppliers/view_models/add_supplier_cubit/add_supplier_cubit.dart';
import 'package:harrasi_rope_factory/generated/locale_keys.g.dart';

class AddSupplierModalBottomSheetBody extends StatelessWidget {
  const AddSupplierModalBottomSheetBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddSupplierCubit, AddSupplierState>(
      listener: (context, state) {
        if (state is AddSupplierSuccess) {
          context.popScreen();
          CustomQuickAlert.success(
            title:
                LocaleKeys.sales_invoices_add_sales_customQuickAlert_title.tr(),
            message:
                LocaleKeys.suppliers_add_supplier_CustomQuickAlert_message.tr(),
            animationType: CustomQuickAlertAnimationType.slideInDown,
          );
        }
        if (state is AddSupplierFailure) {
          CustomQuickAlert.error(
            title: LocaleKeys
                .sales_invoices_add_sales_customQuickAlert_error_title
                .tr(),
            message: state.message,
            animationType: CustomQuickAlertAnimationType.slideInDown,
          );
        }
        if (state is SelectContactPerson) {
          CustomQuickAlert.warning(
            title: LocaleKeys
                .sales_invoices_add_sales_customQuickAlert_warning_title
                .tr(),
            message: LocaleKeys.suppliers_add_supplier_SelectContactPerson.tr(),
            animationType: CustomQuickAlertAnimationType.slideInDown,
          );
        }
        if (state is SelectPaymentTerm) {
          CustomQuickAlert.warning(
            title: LocaleKeys
                .sales_invoices_add_sales_customQuickAlert_warning_title
                .tr(),
            message: LocaleKeys.suppliers_add_supplier_SelectPaymentTerm.tr(),
            animationType: CustomQuickAlertAnimationType.slideInDown,
          );
        }
      },
      child: DraggableScrollableSheet(
        expand: true,
        maxChildSize: 0.9,
        initialChildSize: 0.9,
        minChildSize: 0.9,
        shouldCloseOnMinExtent: true,
        builder: (context, scrollController) {
          var cubit = context.read<AddSupplierCubit>();
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: SingleChildScrollView(
              controller: scrollController,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.width * 0.03,
                  vertical: SizeConfig.height * 0.02,
                ),
                child: Form(
                  key: cubit.formKey,
                  child: Column(
                    children: [
                      CustomTitle(
                          title: LocaleKeys.suppliers_add_supplier_Add_Supplier
                              .tr()),
                      SizedBox(height: SizeConfig.height * 0.05),
                      CustomTextFormFieldWithTitle(
                        title: LocaleKeys.suppliers_add_supplier_Supplier_Name
                            .tr(),
                        controller: cubit.nameController,
                        hintText: LocaleKeys
                            .suppliers_add_supplier_enter_supplier_name
                            .tr(),
                      ),
                      SizedBox(height: SizeConfig.height * 0.01),
                      CustomDropDownButtonFormField(
                        hintText: LocaleKeys
                            .suppliers_add_supplier_SelectContactPerson
                            .tr(),
                        items: AppConstants.contactPerson,
                        controller: cubit.contactPersonController,
                        title: LocaleKeys.suppliers_add_supplier_Contact_Person
                            .tr(),
                      ),
                      SizedBox(height: SizeConfig.height * 0.01),
                      CustomTextFormFieldWithTitle(
                        hintText:
                            LocaleKeys.suppliers_add_supplier_enter_phone.tr(),
                        controller: cubit.phoneController,
                        title: LocaleKeys.suppliers_add_supplier_Phone.tr(),
                      ),
                      SizedBox(height: SizeConfig.height * 0.01),
                      CustomTextFormFieldWithTitle(
                        controller: cubit.emailController,
                        title: LocaleKeys.suppliers_add_supplier_Email.tr(),
                        keyboardType: TextInputType.emailAddress,
                        hintText:
                            LocaleKeys.suppliers_add_supplier_enter_email.tr(),
                      ),
                      SizedBox(height: SizeConfig.height * 0.01),
                      CustomTextFormFieldWithTitle(
                        controller: cubit.addressController,
                        title: LocaleKeys.suppliers_add_supplier_Address.tr(),
                        hintText: LocaleKeys
                            .suppliers_add_supplier_enter_address
                            .tr(),
                      ),
                      SizedBox(height: SizeConfig.height * 0.01),
                      CustomDropDownButtonFormField(
                        items: AppConstants.paymentMethods,
                        hintText: LocaleKeys
                            .suppliers_add_supplier_select_payment_terms
                            .tr(),
                        controller: cubit.paymentTermsController,
                        title: LocaleKeys.suppliers_add_supplier_Payment_Terms
                            .tr(),
                      ),
                      SizedBox(height: SizeConfig.height * 0.01),
                      CustomTextFormFieldWithTitle(
                        controller: cubit.creditLimitController,
                        title:
                            LocaleKeys.suppliers_add_supplier_Credit_Limit.tr(),
                        keyboardType: TextInputType.number,
                        hintText: LocaleKeys
                            .suppliers_add_supplier_enter_credit_limit
                            .tr(),
                      ),
                      SizedBox(height: SizeConfig.height * 0.01),
                      CustomTextFormFieldWithTitle(
                        hintText: LocaleKeys
                            .suppliers_add_supplier_enter_supplier_balance
                            .tr(),
                        keyboardType: TextInputType.number,
                        controller: cubit.balanceController,
                        title: LocaleKeys
                            .suppliers_add_supplier_Supplier_Balance
                            .tr(),
                      ),
                      SizedBox(height: SizeConfig.height * 0.01),
                      CustomTextFormFieldWithTitle(
                        hintText: LocaleKeys
                            .sales_invoices_add_sales_enterYourNotes
                            .tr(),
                        maxLines: 3,
                        controller: cubit.noteController,
                        title: LocaleKeys
                            .sales_invoices_add_sales_enterYourNotes
                            .tr(),
                      ),
                      SizedBox(height: SizeConfig.height * 0.03),
                      BlocBuilder<AddSupplierCubit, AddSupplierState>(
                        buildWhen: (previous, current) =>
                            current is AddSupplierLoading ||
                            previous is AddSupplierLoading,
                        builder: (context, state) {
                          return state is AddSupplierLoading
                              ? CustomCircularProgresIndecator()
                              : CustomElevatedButton(
                                  name: LocaleKeys
                                      .suppliers_add_supplier_Add_Supplier
                                      .tr(),
                                  onPressed: () {
                                    cubit.addSupplier();
                                  });
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
