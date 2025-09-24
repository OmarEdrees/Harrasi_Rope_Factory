import 'package:custom_quick_alert/custom_quick_alert.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harrasi_rope_factory/core/components/custom_drop_down_button_form_field.dart';
import 'package:harrasi_rope_factory/core/components/custom_elevated_button.dart';
import 'package:harrasi_rope_factory/core/components/custom_text_form_field_with_title.dart';
import 'package:harrasi_rope_factory/core/utilies/extensions/app_extensions.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/features/bill_of_materials/veiw_models/add_bill_of_material_cubit/add_bill_of_material_cubit.dart';
import 'package:harrasi_rope_factory/features/categories/views/widgets/custom_circular_progress_indecator.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/custom_title.dart';
import 'package:harrasi_rope_factory/generated/locale_keys.g.dart';

class AddBillOfMaterialModalBottomSheetBody extends StatelessWidget {
  const AddBillOfMaterialModalBottomSheetBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddBillOfMaterialCubit, AddBillOfMaterialState>(
      listener: (context, state) {
        if (state is AddBillOfMaterialSuccess) {
          context.popScreen();
          CustomQuickAlert.success(
            title:
                LocaleKeys.sales_invoices_add_sales_customQuickAlert_title.tr(),
            message: LocaleKeys.bill_of_materials_Bill_of_material.tr(),
            animationType: CustomQuickAlertAnimationType.scale,
          );
        }
        if (state is AddBillOfMaterialError) {
          CustomQuickAlert.error(
            title: LocaleKeys
                .sales_invoices_add_sales_customQuickAlert_error_title
                .tr(),
            message: state.errorMessage,
            animationType: CustomQuickAlertAnimationType.slideInDown,
          );
        }
        if (state is SelectProduct) {
          CustomQuickAlert.warning(
            title: LocaleKeys
                .sales_invoices_add_sales_customQuickAlert_warning_title
                .tr(),
            message: LocaleKeys.bill_of_materials_SelectProduct.tr(),
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
        builder: (BuildContext context, ScrollController scrollController) {
          final cubit = context.read<AddBillOfMaterialCubit>();
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
                          title: LocaleKeys.bill_of_materials_CustomTitle.tr()),
                      SizedBox(height: SizeConfig.height * 0.04),
                      CustomTextFormFieldWithTitle(
                        hintText: LocaleKeys
                            .products_add_product_enter_product_name
                            .tr(),
                        title:
                            LocaleKeys.products_add_product_product_Name.tr(),
                        controller: cubit.nameController,
                      ),
                      SizedBox(height: SizeConfig.height * 0.01),
                      CustomTextFormFieldWithTitle(
                        hintText: LocaleKeys
                            .products_add_product_enter_product_description
                            .tr(),
                        title: LocaleKeys
                            .products_add_product_product_Description
                            .tr(),
                        controller: cubit.descriptionController,
                        maxLines: 3,
                      ),
                      SizedBox(height: SizeConfig.height * 0.01),
                      BlocBuilder<AddBillOfMaterialCubit,
                          AddBillOfMaterialState>(
                        buildWhen: (previous, current) =>
                            current is GetProductsLoading ||
                            previous is GetProductsLoading,
                        builder: (context, state) {
                          return state is GetProductsLoading
                              ? CustomCircularProgresIndecator()
                              : CustomDropDownButtonFormField(
                                  items: cubit.products,
                                  itemLabelBuilder: (p0) => p0.name,
                                  title: LocaleKeys
                                      .bill_of_materials_Select_Product
                                      .tr(),
                                  hintText: LocaleKeys
                                      .bill_of_materials_Select_Product
                                      .tr(),
                                  onChanged: (p0) {
                                    cubit.productIdController.text = p0!.id;
                                  },
                                );
                        },
                      ),
                      SizedBox(height: SizeConfig.height * 0.04),
                      BlocBuilder<AddBillOfMaterialCubit,
                          AddBillOfMaterialState>(
                        buildWhen: (previous, current) =>
                            current is AddBillOfMaterialLoading ||
                            previous is AddBillOfMaterialLoading,
                        builder: (context, state) {
                          return state is AddBillOfMaterialLoading
                              ? CustomCircularProgresIndecator()
                              : CustomElevatedButton(
                                  name: LocaleKeys.bill_of_materials_CustomTitle
                                      .tr(),
                                  onPressed: () {
                                    cubit.addBillOfMaterial();
                                  },
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
