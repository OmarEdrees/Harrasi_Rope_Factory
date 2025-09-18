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
import 'package:harrasi_rope_factory/features/bill_of_material_items/view_models/add_bil_of_material_items_cubit/add_bill_of_material_items_cubit.dart';
import 'package:harrasi_rope_factory/features/categories/views/widgets/custom_circular_progress_indecator.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/custom_title.dart';
import 'package:harrasi_rope_factory/generated/local_keys.g.dart';

class AddBillOfMaterialItemModalBottomSheet extends StatelessWidget {
  const AddBillOfMaterialItemModalBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddBillOfMaterialItemsCubit,
        AddBillOfMaterialItemsState>(
      listener: (context, state) {
        if (state is AddBillOfMaterialItemsSuccess) {
          context.popScreen();
          CustomQuickAlert.success(
            title:
                LocaleKeys.sales_invoices_add_sales_customQuickAlert_title.tr(),
            message: LocaleKeys.bill_of_materials_item_Bill.tr(),
            animationType: CustomQuickAlertAnimationType.scale,
          );
        }
        if (state is AddBillOfMaterialItemsFailure) {
          CustomQuickAlert.error(
            title: LocaleKeys
                .sales_invoices_add_sales_customQuickAlert_error_title
                .tr(),
            message: state.error,
            animationType: CustomQuickAlertAnimationType.slideInDown,
          );
        }
        if (state is SelectRawMaterial) {
          CustomQuickAlert.warning(
            title: LocaleKeys
                .sales_invoices_add_sales_customQuickAlert_warning_title
                .tr(),
            message: LocaleKeys.bill_of_materials_item_SelectRawMaterial.tr(),
            animationType: CustomQuickAlertAnimationType.slideInDown,
          );
        }
        if (state is SelectUnit) {
          CustomQuickAlert.warning(
            title: LocaleKeys
                .sales_invoices_add_sales_customQuickAlert_warning_title
                .tr(),
            message: LocaleKeys.bill_of_materials_item_SelectUnit.tr(),
            animationType: CustomQuickAlertAnimationType.slideInDown,
          );
        }
      },
      child: DraggableScrollableSheet(
          shouldCloseOnMinExtent: true,
          expand: true,
          initialChildSize: 0.9,
          maxChildSize: 0.9,
          minChildSize: 0.9,
          builder: (context, scrollController) {
            var cubit = context.read<AddBillOfMaterialItemsCubit>();
            return Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Center(
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
                          Center(
                              child: CustomTitle(
                                  title: LocaleKeys
                                      .bill_of_materials_item_CustomTitle
                                      .tr())),
                          SizedBox(height: SizeConfig.height * 0.05),
                          BlocBuilder<AddBillOfMaterialItemsCubit,
                              AddBillOfMaterialItemsState>(
                            buildWhen: (previous, current) =>
                                current is GetRawMaterialsLoading ||
                                previous is GetRawMaterialsLoading,
                            builder: (context, state) {
                              return state is GetRawMaterialsLoading
                                  ? const CustomCircularProgresIndecator()
                                  : CustomDropDownButtonFormField(
                                      items: cubit.rawMaterials,
                                      title: LocaleKeys
                                          .purchases_invoices_add_purchase_Raw_Material
                                          .tr(),
                                      itemLabelBuilder: (item) => item.name,
                                      hintText: LocaleKeys
                                          .purchases_invoices_add_purchase_Select_raw
                                          .tr(),
                                      onChanged: (p0) {
                                        cubit.rawMaterialIdController.text =
                                            p0!.id;
                                      },
                                    );
                            },
                          ),
                          SizedBox(height: SizeConfig.height * 0.01),
                          CustomDropDownButtonFormField(
                            items: AppConstants.units,
                            hintText: LocaleKeys
                                .products_add_product_Select_Unit
                                .tr(),
                            title: LocaleKeys.raw_materials_Unit.tr(),
                            controller: cubit.unitController,
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
                            keyboardType: TextInputType.number,
                          ),
                          SizedBox(height: SizeConfig.height * 0.03),
                          BlocBuilder<AddBillOfMaterialItemsCubit,
                              AddBillOfMaterialItemsState>(
                            buildWhen: (previous, current) =>
                                current is AddBillOfMaterialItemsLoading ||
                                previous is AddBillOfMaterialItemsLoading,
                            builder: (context, state) {
                              return CustomElevatedButton(
                                  name: LocaleKeys
                                      .bill_of_materials_item_CustomTitle
                                      .tr(),
                                  onPressed: () {
                                    cubit.addBillOfMaterialItem();
                                  });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
