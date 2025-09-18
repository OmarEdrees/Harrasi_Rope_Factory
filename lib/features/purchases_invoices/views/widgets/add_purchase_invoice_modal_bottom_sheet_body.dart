import 'package:custom_quick_alert/custom_quick_alert.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harrasi_rope_factory/core/components/custom_drop_down_button_form_field.dart';
import 'package:harrasi_rope_factory/core/components/custom_elevated_button.dart';
import 'package:harrasi_rope_factory/core/components/custom_icon_button.dart';
import 'package:harrasi_rope_factory/core/components/custom_text_form_field_with_title.dart';
import 'package:harrasi_rope_factory/core/constants/app_constants.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/core/utilies/extensions/app_extensions.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/core/utilies/styles/app_text_styles.dart';
import 'package:harrasi_rope_factory/features/categories/views/widgets/custom_circular_progress_indecator.dart';
import 'package:harrasi_rope_factory/features/manufacture/views/widgets/custom_date_time_form_field.dart';
import 'package:harrasi_rope_factory/features/products/models/product_model.dart';
import 'package:harrasi_rope_factory/features/purchases_invoices/view_models/add_perchases_cubit/add_purchase_invoice_cubit.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/custom_title.dart';
import 'package:harrasi_rope_factory/generated/local_keys.g.dart';

class AddPurchaseInvoiceModalBottomSheetBody extends StatelessWidget {
  const AddPurchaseInvoiceModalBottomSheetBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AddPurchaseInvoiceCubit>();
    return BlocListener<AddPurchaseInvoiceCubit, AddPurchaseInvoiceState>(
      listener: (context, state) {
        if (state is AddPurchaseInvoiceSuccess) {
          context.popScreen();
          CustomQuickAlert.success(
            title:
                LocaleKeys.sales_invoices_add_sales_customQuickAlert_title.tr(),
            message: LocaleKeys
                .purchases_invoices_add_purchase_customQuickAlert_message
                .tr(),
            animationType: CustomQuickAlertAnimationType.slideInDown,
          );
        }
        if (state is AddPurchaseInvoiceFailure) {
          CustomQuickAlert.error(
            title: LocaleKeys
                .sales_invoices_add_sales_customQuickAlert_error_title
                .tr(),
            message: state.message,
            animationType: CustomQuickAlertAnimationType.slideInDown,
          );
        }
        if (state is SelectSupplier) {
          CustomQuickAlert.warning(
            title: LocaleKeys
                .sales_invoices_add_sales_customQuickAlert_warning_title
                .tr(),
            message: LocaleKeys
                .purchases_invoices_add_purchase_SelectSupplier_message
                .tr(),
            animationType: CustomQuickAlertAnimationType.slideInDown,
          );
        }
        if (state is SelectDueDate) {
          CustomQuickAlert.warning(
            title: LocaleKeys
                .sales_invoices_add_sales_customQuickAlert_warning_title
                .tr(),
            message: LocaleKeys
                .purchases_invoices_add_purchase_SelectDueDate_message
                .tr(),
            animationType: CustomQuickAlertAnimationType.slideInDown,
          );
        }
        if (state is SelectPaymentMethod) {
          CustomQuickAlert.warning(
            title: LocaleKeys
                .sales_invoices_add_sales_customQuickAlert_warning_title
                .tr(),
            message: LocaleKeys
                .purchases_invoices_add_purchase_SelectPaymentMethod_message
                .tr(),
            animationType: CustomQuickAlertAnimationType.slideInDown,
          );
        }
        if (state is SelectItem) {
          CustomQuickAlert.warning(
            title: LocaleKeys
                .sales_invoices_add_sales_customQuickAlert_warning_title
                .tr(),
            message: LocaleKeys
                .purchases_invoices_add_purchase_SelectItem_message
                .tr(),
            animationType: CustomQuickAlertAnimationType.slideInDown,
          );
        }
      },
      child: DraggableScrollableSheet(
        expand: true,
        initialChildSize: 0.9,
        minChildSize: 0.9,
        maxChildSize: 0.9,
        shouldCloseOnMinExtent: true,
        builder: (context, scrollController) => Padding(
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTitle(
                        title: LocaleKeys
                            .purchases_invoices_add_purchase_CustomTitle
                            .tr()),
                    SizedBox(height: SizeConfig.height * 0.05),
                    // Supplier Dropdown
                    BlocBuilder<AddPurchaseInvoiceCubit,
                        AddPurchaseInvoiceState>(
                      buildWhen: (previous, current) =>
                          current is GetSuppliersLoading ||
                          current is GetSuppliersSuccess ||
                          current is GetSuppliersFailure,
                      builder: (context, state) {
                        if (state is GetSuppliersLoading) {
                          return const CustomCircularProgresIndecator();
                        }
                        return CustomDropDownButtonFormField(
                          items: cubit.suppliers,
                          title: LocaleKeys
                              .purchases_invoices_add_purchase_Supplier
                              .tr(),
                          hintText: LocaleKeys
                              .purchases_invoices_add_purchase_Select_Supplier
                              .tr(),
                          itemLabelBuilder: (e) => e.name,
                          onChanged: (p0) {
                            cubit.supplierIdController.text = p0!.id.toString();
                          },
                        );
                      },
                    ),
                    SizedBox(height: SizeConfig.height * 0.01),
                    // Product Dropdown
                    BlocBuilder<AddPurchaseInvoiceCubit,
                        AddPurchaseInvoiceState>(
                      buildWhen: (previous, current) =>
                          current is GetProductsLoading ||
                          current is GetProductsSuccess ||
                          current is GetProductsFailure ||
                          current is AddPurchaseInvoiceItemsUpdated,
                      builder: (context, state) {
                        if (state is GetProductsLoading) {
                          return const CustomCircularProgresIndecator();
                        }
                        return CustomDropDownButtonFormField<ProductModel>(
                          items: cubit.products,
                          title: LocaleKeys
                              .sales_invoices_add_sales_productModel_title
                              .tr(),
                          hintText: LocaleKeys
                              .sales_invoices_add_sales_productModel_hintText
                              .tr(),
                          value: cubit.products.contains(cubit.selectedProduct)
                              ? cubit.selectedProduct
                              : null,
                          itemLabelBuilder: (e) => e.name,
                          onChanged: (product) {
                            cubit.selectedProduct = product;
                          },
                        );
                      },
                    ),
                    SizedBox(height: SizeConfig.height * 0.01),
                    // Product Quantity
                    CustomTextFormFieldWithTitle(
                      hintText: LocaleKeys
                          .sales_invoices_add_sales_quantity_hintText
                          .tr(),
                      title: LocaleKeys.sales_invoices_add_sales_quantity_title
                          .tr(),
                      controller: cubit.productQuantityController,
                      keyboardType: TextInputType.number,
                      enableValidator: false,
                    ),
                    SizedBox(height: SizeConfig.height * 0.01),
                    // Add Product Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomIconButton(
                          hPadding: SizeConfig.width * 0.005,
                          vPadding: SizeConfig.height * 0.005,
                          backgroundColor: AppColors.kThirdColor,
                          iconColor: AppColors.kPrimaryColor,
                          icon: Icons.add,
                          onPressed: () {
                            final qty = double.tryParse(
                                    cubit.productQuantityController.text) ??
                                0;
                            if (cubit.selectedProduct != null && qty > 0) {
                              cubit.addProductToInvoice(
                                  cubit.selectedProduct!, qty);
                            } else {
                              CustomQuickAlert.warning(
                                title: LocaleKeys
                                    .sales_invoices_add_sales_customQuickAlert_warning_title
                                    .tr(),
                                message: LocaleKeys
                                    .purchases_invoices_add_purchase_CustomQuickAlert_message
                                    .tr(),
                                animationType:
                                    CustomQuickAlertAnimationType.slideInDown,
                              );
                            }
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: SizeConfig.height * 0.01),
                    // Products Table
                    BlocBuilder<AddPurchaseInvoiceCubit,
                        AddPurchaseInvoiceState>(
                      buildWhen: (previous, current) =>
                          current is AddPurchaseInvoiceItemsUpdated,
                      builder: (context, state) {
                        if (cubit.productInvoiceItems.isEmpty) {
                          return Text(
                              LocaleKeys.sales_invoices_add_sales_text.tr());
                        }
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            headingRowColor:
                                WidgetStateProperty.all(AppColors.kThirdColor),
                            border:
                                TableBorder.all(color: AppColors.kThirdColor),
                            columns: [
                              DataColumn(
                                  label: Text(LocaleKeys
                                      .sales_invoices_add_sales_product
                                      .tr())),
                              DataColumn(
                                  label: Text(LocaleKeys
                                      .sales_invoices_add_sales_qty
                                      .tr())),
                              DataColumn(
                                  label: Text(LocaleKeys
                                      .sales_invoices_add_sales_unitPrice
                                      .tr())),
                              DataColumn(
                                  label: Text(LocaleKeys
                                      .sales_invoices_add_sales_total
                                      .tr())),
                              DataColumn(label: Text('')),
                            ],
                            rows: cubit.productInvoiceItems
                                .asMap()
                                .entries
                                .map((entry) {
                              final index = entry.key;
                              final item = entry.value;
                              return DataRow(
                                cells: [
                                  DataCell(Text(
                                    (item.item as ProductModel).name,
                                    style: AppTextStyles.title16White500,
                                  )),
                                  DataCell(Text(
                                    item.quantity.toString(),
                                    style: AppTextStyles.title16White500,
                                  )),
                                  DataCell(Text(
                                    item.unitPrice.toStringAsFixed(2),
                                    style: AppTextStyles.title16White500,
                                  )),
                                  DataCell(Text(
                                    item.total.toStringAsFixed(2),
                                    style: AppTextStyles.title16White500,
                                  )),
                                  DataCell(IconButton(
                                    icon: const Icon(Icons.delete,
                                        color: Colors.red),
                                    onPressed: () =>
                                        cubit.removeProductFromInvoice(index),
                                  )),
                                ],
                              );
                            }).toList(),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: SizeConfig.height * 0.01),
                    // Raw Material Dropdown
                    BlocBuilder<AddPurchaseInvoiceCubit,
                        AddPurchaseInvoiceState>(
                      buildWhen: (previous, current) =>
                          current is GetRawMaterialsLoading ||
                          current is GetRawMaterialsSuccess ||
                          current is GetRawMaterialsFailure ||
                          current is AddPurchaseInvoiceItemsUpdated,
                      builder: (context, state) {
                        if (state is GetRawMaterialsLoading) {
                          return const CustomCircularProgresIndecator();
                        }
                        return CustomDropDownButtonFormField<RawMaterialModel>(
                          items: cubit.rawMaterials,
                          title: LocaleKeys
                              .purchases_invoices_add_purchase_Raw_Material
                              .tr(),
                          hintText: LocaleKeys
                              .purchases_invoices_add_purchase_Select_raw
                              .tr(),
                          value: cubit.rawMaterials
                                  .contains(cubit.selectedRawMaterial)
                              ? cubit.selectedRawMaterial
                              : null,
                          itemLabelBuilder: (e) => e.name,
                          onChanged: (rawMaterial) {
                            cubit.selectedRawMaterial = rawMaterial;
                          },
                        );
                      },
                    ),
                    SizedBox(height: SizeConfig.height * 0.01),
                    // Raw Material Quantity
                    CustomTextFormFieldWithTitle(
                      hintText: LocaleKeys
                          .sales_invoices_add_sales_quantity_hintText
                          .tr(),
                      title: LocaleKeys.sales_invoices_add_sales_quantity_title
                          .tr(),
                      controller: cubit.rawMaterialQuantityController,
                      keyboardType: TextInputType.number,
                      enableValidator: false,
                    ),
                    SizedBox(height: SizeConfig.height * 0.01),
                    // Add Raw Material Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomIconButton(
                          hPadding: SizeConfig.width * 0.005,
                          vPadding: SizeConfig.height * 0.005,
                          backgroundColor: AppColors.kThirdColor,
                          iconColor: AppColors.kPrimaryColor,
                          icon: Icons.add,
                          onPressed: () {
                            final qty = double.tryParse(
                                    cubit.rawMaterialQuantityController.text) ??
                                0;
                            if (cubit.selectedRawMaterial != null && qty > 0) {
                              cubit.addRawMaterialToInvoice(
                                  cubit.selectedRawMaterial!, qty);
                            } else {
                              CustomQuickAlert.warning(
                                title: LocaleKeys
                                    .sales_invoices_add_sales_customQuickAlert_warning_title
                                    .tr(),
                                message: LocaleKeys
                                    .purchases_invoices_add_purchase_please_raw
                                    .tr(),
                                animationType:
                                    CustomQuickAlertAnimationType.slideInDown,
                              );
                            }
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: SizeConfig.height * 0.01),
                    // Raw Materials Table
                    BlocBuilder<AddPurchaseInvoiceCubit,
                        AddPurchaseInvoiceState>(
                      buildWhen: (previous, current) =>
                          current is AddPurchaseInvoiceItemsUpdated,
                      builder: (context, state) {
                        if (cubit.rawMaterialInvoiceItems.isEmpty) {
                          return Text(LocaleKeys
                              .purchases_invoices_add_purchase_no_raw
                              .tr());
                        }
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            headingRowColor:
                                WidgetStateProperty.all(AppColors.kThirdColor),
                            border:
                                TableBorder.all(color: AppColors.kThirdColor),
                            columns: [
                              DataColumn(
                                  label: Text(LocaleKeys
                                      .purchases_invoices_add_purchase_Raw_Material
                                      .tr())),
                              DataColumn(
                                  label: Text(LocaleKeys
                                      .sales_invoices_add_sales_qty
                                      .tr())),
                              DataColumn(
                                  label: Text(LocaleKeys
                                      .sales_invoices_add_sales_unitPrice
                                      .tr())),
                              DataColumn(
                                  label: Text(LocaleKeys
                                      .sales_invoices_add_sales_total
                                      .tr())),
                              DataColumn(label: Text('')),
                            ],
                            rows: cubit.rawMaterialInvoiceItems
                                .asMap()
                                .entries
                                .map((entry) {
                              final index = entry.key;
                              final item = entry.value;
                              return DataRow(
                                cells: [
                                  DataCell(Text(
                                    (item.item as RawMaterialModel).name,
                                    style: AppTextStyles.title16White500,
                                  )),
                                  DataCell(Text(
                                    item.quantity.toString(),
                                    style: AppTextStyles.title16White500,
                                  )),
                                  DataCell(Text(
                                    item.unitPrice.toStringAsFixed(2),
                                    style: AppTextStyles.title16White500,
                                  )),
                                  DataCell(Text(
                                    item.total.toStringAsFixed(2),
                                    style: AppTextStyles.title16White500,
                                  )),
                                  DataCell(IconButton(
                                    icon: const Icon(Icons.delete,
                                        color: Colors.red),
                                    onPressed: () => cubit
                                        .removeRawMaterialFromInvoice(index),
                                  )),
                                ],
                              );
                            }).toList(),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: SizeConfig.height * 0.02),
                    // Due Date
                    CustomDateTimeFormField(
                      title: LocaleKeys
                          .sales_invoices_add_sales_customDateTimeFormField_title
                          .tr(),
                      hintText: LocaleKeys
                          .sales_invoices_add_sales_customDateTimeFormField_hintText
                          .tr(),
                      onChanged: (p0) {
                        cubit.dueDate = p0;
                      },
                    ),
                    SizedBox(height: SizeConfig.height * 0.01),
                    // Payment Method
                    CustomDropDownButtonFormField(
                      items: AppConstants.paymentMethods,
                      hintText: LocaleKeys
                          .sales_invoices_add_sales_paymentMethod_hintText
                          .tr(),
                      title: LocaleKeys
                          .sales_invoices_add_sales_paymentMethod_title
                          .tr(),
                      controller: cubit.paymentMethodController,
                    ),
                    SizedBox(height: SizeConfig.height * 0.01),
                    // Subtotal
                    CustomTextFormFieldWithTitle(
                      hintText: '0.0',
                      title: LocaleKeys.sales_invoices_add_sales_subtotal.tr(),
                      controller: cubit.subTotalController,
                      keyboardType: TextInputType.number,
                      enable: false,
                    ),
                    SizedBox(height: SizeConfig.height * 0.01),
                    // Tax
                    CustomTextFormFieldWithTitle(
                      hintText:
                          LocaleKeys.sales_invoices_add_sales_enterTax.tr(),
                      title: LocaleKeys.sales_invoices_add_sales_tax.tr(),
                      controller: cubit.taxController,
                      keyboardType: TextInputType.number,
                      onChanged: (p0) {
                        cubit.calculateTotals();
                      },
                    ),
                    SizedBox(height: SizeConfig.height * 0.01),
                    // Discount
                    CustomTextFormFieldWithTitle(
                      hintText: LocaleKeys
                          .sales_invoices_add_sales_enter_discount
                          .tr(),
                      title: LocaleKeys.sales_invoices_add_sales_discount.tr(),
                      controller: cubit.discountController,
                      keyboardType: TextInputType.number,
                      onChanged: (p0) {
                        cubit.calculateTotals();
                      },
                    ),
                    SizedBox(height: SizeConfig.height * 0.01),
                    // Total
                    CustomTextFormFieldWithTitle(
                      hintText: '0.0',
                      title: LocaleKeys.sales_invoices_add_sales_total.tr(),
                      controller: cubit.totalController,
                      keyboardType: TextInputType.number,
                      enable: false,
                      enableValidator: false,
                    ),
                    SizedBox(height: SizeConfig.height * 0.01),
                    // Notes
                    CustomTextFormFieldWithTitle(
                      hintText: LocaleKeys
                          .sales_invoices_add_sales_enterYourNotes
                          .tr(),
                      title: LocaleKeys.sales_invoices_add_sales_notes.tr(),
                      controller: cubit.notesController,
                      maxLines: 3,
                    ),
                    SizedBox(height: SizeConfig.height * 0.03),
                    // Add Invoice Button
                    BlocBuilder<AddPurchaseInvoiceCubit,
                        AddPurchaseInvoiceState>(
                      buildWhen: (previous, current) =>
                          current is AddPurchaseInvoiceLoading ||
                          previous is AddPurchaseInvoiceLoading,
                      builder: (context, state) {
                        return state is AddPurchaseInvoiceLoading
                            ? const CustomCircularProgresIndecator()
                            : CustomElevatedButton(
                                name: LocaleKeys
                                    .sales_invoices_add_sales_addInvoice
                                    .tr(),
                                onPressed: () {
                                  cubit.addPurchaseInvoice();
                                },
                              );
                      },
                    ),
                    SizedBox(height: SizeConfig.height * 0.02),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
