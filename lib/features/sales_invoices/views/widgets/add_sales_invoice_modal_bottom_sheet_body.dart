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
import 'package:harrasi_rope_factory/features/customers/models/customer_model.dart';
import 'package:harrasi_rope_factory/features/manufacture/views/widgets/custom_date_time_form_field.dart';
import 'package:harrasi_rope_factory/features/products/models/product_model.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/custom_title.dart';
import 'package:harrasi_rope_factory/features/sales_invoices/view_models/add_sale_invoice_cubit/add_sale_invoice_cubit.dart';
import 'package:harrasi_rope_factory/generated/local_keys.g.dart';

class AddSalesInvoiceModalBottomSheetBody extends StatelessWidget {
  const AddSalesInvoiceModalBottomSheetBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AddSaleInvoiceCubit>();

    return BlocListener<AddSaleInvoiceCubit, AddSaleInvoiceState>(
      listener: (context, state) {
        if (state is AddSaleInvoiceSuccess) {
          context.popScreen();
          CustomQuickAlert.success(
            title:
                LocaleKeys.sales_invoices_add_sales_customQuickAlert_title.tr(),
            message: LocaleKeys
                .sales_invoices_add_sales_customQuickAlert_message
                .tr(),
            animationType: CustomQuickAlertAnimationType.slideInDown,
          );
        }
        if (state is AddSaleInvoiceFailure) {
          CustomQuickAlert.error(
            title: LocaleKeys
                .sales_invoices_add_sales_customQuickAlert_error_title
                .tr(),
            message: state.message,
            animationType: CustomQuickAlertAnimationType.slideInDown,
          );
        }
        if (state is SelectCustomer) {
          CustomQuickAlert.warning(
            title: LocaleKeys
                .sales_invoices_add_sales_customQuickAlert_warning_title
                .tr(),
            message: LocaleKeys
                .sales_invoices_add_sales_customQuickAlert_selectCustomer_message
                .tr(),
            animationType: CustomQuickAlertAnimationType.slideInDown,
          );
        }
        if (state is SelectProduct) {
          CustomQuickAlert.warning(
            title: LocaleKeys
                .sales_invoices_add_sales_customQuickAlert_warning_title
                .tr(),
            message: LocaleKeys
                .sales_invoices_add_sales_customQuickAlert_selectProduct_message
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
                .sales_invoices_add_sales_customQuickAlert_selectDueDate_message
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
                .sales_invoices_add_sales_customQuickAlert_selectPaymentMethod_message
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
                  children: [
                    CustomTitle(
                        title: LocaleKeys.sales_invoices_add_sales_customTitle
                            .tr()),
                    SizedBox(height: SizeConfig.height * 0.05),
                    // Customers
                    BlocBuilder<AddSaleInvoiceCubit, AddSaleInvoiceState>(
                      buildWhen: (previous, current) =>
                          current is GetCustomersLoading ||
                          current is GetCustomersSuccess ||
                          current is GetCustomersFailure,
                      builder: (context, state) {
                        if (state is GetCustomersLoading) {
                          return const CustomCircularProgresIndecator();
                        }
                        return CustomDropDownButtonFormField<CustomerModel>(
                          items: cubit.customers,
                          title:
                              LocaleKeys.sales_invoices_add_sales_Customer.tr(),
                          hintText: LocaleKeys
                              .sales_invoices_add_sales_Select_Customer
                              .tr(),
                          itemLabelBuilder: (e) => e.name,
                          onChanged: (p0) {
                            cubit.supplierIdController.text = p0!.id.toString();
                          },
                        );
                      },
                    ),
                    SizedBox(height: SizeConfig.height * 0.01),
                    // Product + Quantity + Add Button
                    BlocBuilder<AddSaleInvoiceCubit, AddSaleInvoiceState>(
                      buildWhen: (previous, current) =>
                          current is GetProductsLoading ||
                          current is GetProductsSuccess ||
                          current is GetProductsFailure,
                      builder: (context, state) {
                        if (state is GetProductsLoading) {
                          return const CustomCircularProgresIndecator();
                        }
                        return Column(
                          children: [
                            BlocBuilder<AddSaleInvoiceCubit,
                                AddSaleInvoiceState>(
                              buildWhen: (previous, current) =>
                                  current is GetProductsLoading ||
                                  current is GetProductsSuccess ||
                                  current is GetProductsFailure ||
                                  current is AddSaleInvoiceItemsUpdated,
                              builder: (context, state) {
                                final value = cubit.selectedProduct;
                                return CustomDropDownButtonFormField<
                                    ProductModel>(
                                  items: cubit.products,
                                  title: LocaleKeys
                                      .sales_invoices_add_sales_productModel_title
                                      .tr(),
                                  value: cubit.products.contains(value)
                                      ? value
                                      : null, // ✅ هنا الضبط
                                  hintText: LocaleKeys
                                      .sales_invoices_add_sales_productModel_hintText
                                      .tr(),
                                  itemLabelBuilder: (e) => e.name,
                                  onChanged: (product) {
                                    cubit.selectedProduct = product;
                                  },
                                );
                              },
                            ),
                            SizedBox(height: SizeConfig.height * 0.01),
                            CustomTextFormFieldWithTitle(
                              hintText: LocaleKeys
                                  .sales_invoices_add_sales_quantity_hintText
                                  .tr(),
                              enableValidator: false,
                              title: LocaleKeys
                                  .sales_invoices_add_sales_quantity_title
                                  .tr(),
                              controller: cubit.quantityController,
                              keyboardType: TextInputType.number,
                            ),
                            SizedBox(height: SizeConfig.height * 0.01),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
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
                                            cubit.quantityController.text) ??
                                        0;
                                    if (cubit.selectedProduct != null &&
                                        qty > 0) {
                                      cubit.addProductToInvoice(
                                          cubit.selectedProduct!, qty);
                                    } else {
                                      CustomQuickAlert.warning(
                                        title: LocaleKeys
                                            .sales_invoices_add_sales_customQuickAlert_warning_title
                                            .tr(),
                                        message: LocaleKeys
                                            .sales_invoices_add_sales_customQuickAlert_message2
                                            .tr(),
                                        animationType:
                                            CustomQuickAlertAnimationType
                                                .slideInDown,
                                      );
                                    }
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: SizeConfig.height * 0.01),
                          ],
                        );
                      },
                    ),
                    BlocBuilder<AddSaleInvoiceCubit, AddSaleInvoiceState>(
                      buildWhen: (p, c) => c is AddSaleInvoiceItemsUpdated,
                      builder: (context, state) {
                        if (cubit.invoiceItems.isEmpty) {
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
                              DataColumn(label: Text("")),
                            ],
                            rows: cubit.invoiceItems.map((item) {
                              final index = cubit.invoiceItems.indexOf(item);
                              return DataRow(
                                cells: [
                                  DataCell(Text(
                                    item.product.name,
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
                      hintText: "0.0",
                      enable: false,
                      title: LocaleKeys.sales_invoices_add_sales_subtotal.tr(),
                      controller: cubit.subTotalController,
                      keyboardType: TextInputType.number,
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
                      hintText: "0.0",
                      enableValidator: false,
                      enable: false,
                      title: LocaleKeys.sales_invoices_add_sales_total.tr(),
                      controller: cubit.totalController,
                      keyboardType: TextInputType.number,
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
                    BlocBuilder<AddSaleInvoiceCubit, AddSaleInvoiceState>(
                      buildWhen: (previous, current) =>
                          current is AddSaleInvoiceLoading ||
                          previous is AddSaleInvoiceLoading,
                      builder: (context, state) {
                        return state is AddSaleInvoiceLoading
                            ? const CustomCircularProgresIndecator()
                            : CustomElevatedButton(
                                name: LocaleKeys
                                    .sales_invoices_add_sales_addInvoice
                                    .tr(),
                                onPressed: () {
                                  cubit.addSaleInvoice();
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
