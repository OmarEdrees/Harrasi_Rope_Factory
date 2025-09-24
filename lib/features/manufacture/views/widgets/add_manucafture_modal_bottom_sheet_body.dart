import 'package:custom_quick_alert/custom_quick_alert.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harrasi_rope_factory/core/components/custom_drop_down_button_form_field.dart';
import 'package:harrasi_rope_factory/core/components/custom_elevated_button.dart';
import 'package:harrasi_rope_factory/core/components/custom_text_form_field_with_title.dart';
import 'package:harrasi_rope_factory/core/utilies/extensions/app_extensions.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/features/categories/views/widgets/custom_circular_progress_indecator.dart';
import 'package:harrasi_rope_factory/features/manufacture/view_models/add_manufacture_item_cubit/add_manufacture_item_cubit.dart';
import 'package:harrasi_rope_factory/features/manufacture/views/widgets/custom_date_time_form_field.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/custom_title.dart';
import 'package:harrasi_rope_factory/generated/locale_keys.g.dart';

class AddManucaftureModalBottomSheetBody extends StatelessWidget {
  const AddManucaftureModalBottomSheetBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddManufactureItemCubit, AddManufactureItemState>(
      listener: (context, state) {
        if (state is AddManufactureItemSuccess) {
          context.popScreen();
          CustomQuickAlert.success(
            title:
                LocaleKeys.sales_invoices_add_sales_customQuickAlert_title.tr(),
            message: LocaleKeys.manufacture_customQuickAlert_message.tr(),
            animationType: CustomQuickAlertAnimationType.scale,
          );
        }
        if (state is AddManufactureItemFailure) {
          CustomQuickAlert.error(
            title: LocaleKeys
                .sales_invoices_add_sales_customQuickAlert_error_title
                .tr(),
            message: state.errorMessage,
            animationType: CustomQuickAlertAnimationType.scale,
          );
        }
        if (state is SelectStartDate) {
          CustomQuickAlert.warning(
            title: LocaleKeys
                .sales_invoices_add_sales_customQuickAlert_warning_title
                .tr(),
            message: LocaleKeys.manufacture_SelectStartDate.tr(),
            animationType: CustomQuickAlertAnimationType.scale,
          );
        }
        if (state is SelectEndDate) {
          CustomQuickAlert.warning(
            title: LocaleKeys
                .sales_invoices_add_sales_customQuickAlert_warning_title
                .tr(),
            message: LocaleKeys.manufacture_SelectEndDate.tr(),
            animationType: CustomQuickAlertAnimationType.scale,
          );
        }
        if (state is SelectProduct) {
          CustomQuickAlert.warning(
            title: LocaleKeys
                .sales_invoices_add_sales_customQuickAlert_warning_title
                .tr(),
            message: LocaleKeys.manufacture_SelectProduct.tr(),
            animationType: CustomQuickAlertAnimationType.scale,
          );
        }
        if (state is SelectBillOfMaterial) {
          CustomQuickAlert.warning(
            title: LocaleKeys
                .sales_invoices_add_sales_customQuickAlert_warning_title
                .tr(),
            message: LocaleKeys.manufacture_SelectBillOfMaterial.tr(),
            animationType: CustomQuickAlertAnimationType.scale,
          );
        }
      },
      child: DraggableScrollableSheet(
        initialChildSize: 0.9,
        minChildSize: 0.9,
        maxChildSize: 0.9,
        expand: true,
        shouldCloseOnMinExtent: true,
        builder: (context, scrollController) {
          var cubit = context.read<AddManufactureItemCubit>();
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: SingleChildScrollView(
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
                          title: LocaleKeys.manufacture_CustomTitle.tr()),
                      SizedBox(height: SizeConfig.height * 0.05),
                      BlocBuilder<AddManufactureItemCubit,
                          AddManufactureItemState>(
                        buildWhen: (previous, current) =>
                            current is GetProductsLoading ||
                            current is GetProductsSuccess ||
                            current is GetProductsFailure,
                        builder: (context, state) {
                          if (state is GetProductsLoading) {
                            return const CustomCircularProgresIndecator();
                          }
                          return CustomDropDownButtonFormField(
                            items: cubit.products,
                            title: LocaleKeys.sales_invoices_add_sales_product
                                .tr(),
                            controller: cubit.productIdController,
                            hintText: LocaleKeys
                                .bill_of_materials_Select_Product
                                .tr(),
                            itemLabelBuilder: (p0) => p0.name,
                            onChanged: (p0) {
                              cubit.productIdController.text = p0!.id;
                            },
                          );
                        },
                      ),
                      SizedBox(height: SizeConfig.height * 0.01),
                      BlocBuilder<AddManufactureItemCubit,
                          AddManufactureItemState>(
                        buildWhen: (previous, current) =>
                            current is GetBillOfMaterialsLoading ||
                            current is GetBillOfMaterialsSuccess ||
                            current is GetBillOfMaterialsFailure,
                        builder: (context, state) {
                          if (state is GetBillOfMaterialsLoading) {
                            return const CustomCircularProgresIndecator();
                          }
                          return CustomDropDownButtonFormField(
                            items: cubit.billOfMaterials,
                            title: LocaleKeys
                                .DashBoardItemModel_Bill_of_Materials.tr(),
                            controller: cubit.billOfMaterialIdController,
                            hintText: LocaleKeys.manufacture_select_bill.tr(),
                            itemLabelBuilder: (p0) => p0.name,
                            onChanged: (p0) {
                              cubit.billOfMaterialIdController.text = p0!.id;
                            },
                          );
                        },
                      ),
                      SizedBox(height: SizeConfig.height * 0.01),
                      Row(
                        children: [
                          Expanded(
                            child: CustomDateTimeFormField(
                              title: LocaleKeys.manufacture_Start_Date.tr(),
                              hintText:
                                  LocaleKeys.manufacture_enter_start_time.tr(),
                              onChanged: (value) {
                                cubit.startDate = value;
                              },
                            ),
                          ),
                          SizedBox(width: SizeConfig.width * 0.02),
                          Expanded(
                            child: CustomDateTimeFormField(
                              title: LocaleKeys.manufacture_End_Date.tr(),
                              hintText: LocaleKeys.manufacture_enter.tr(),
                              onChanged: (value) {
                                cubit.endDate = value;
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: SizeConfig.height * 0.01),
                      CustomTextFormFieldWithTitle(
                        title: LocaleKeys
                            .sales_invoices_add_sales_quantity_title
                            .tr(),
                        hintText: LocaleKeys
                            .sales_invoices_add_sales_quantity_hintText
                            .tr(),
                        controller: cubit.quantityController,
                      ),
                      SizedBox(height: SizeConfig.height * 0.01),
                      CustomTextFormFieldWithTitle(
                        title: LocaleKeys.expenses_details_modal_Notes.tr(),
                        maxLines: 3,
                        hintText:
                            LocaleKeys.expenses_add_expense_enter_notes.tr(),
                        controller: cubit.notesController,
                      ),
                      SizedBox(height: SizeConfig.height * 0.03),
                      BlocBuilder<AddManufactureItemCubit,
                          AddManufactureItemState>(
                        buildWhen: (previous, current) =>
                            current is AddManufactureItemLoading ||
                            previous is AddManufactureItemLoading,
                        builder: (context, state) {
                          return state is AddManufactureItemLoading
                              ? const CustomCircularProgresIndecator()
                              : CustomElevatedButton(
                                  name: LocaleKeys.manufacture_CustomTitle.tr(),
                                  onPressed: () {
                                    cubit.addManufactureItem();
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
          );
        },
      ),
    );
  }
}
