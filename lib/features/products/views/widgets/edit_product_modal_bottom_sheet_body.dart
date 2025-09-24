import 'package:custom_quick_alert/custom_quick_alert.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harrasi_rope_factory/core/components/custom_elevated_button.dart';
import 'package:harrasi_rope_factory/core/components/custom_text_form_field_with_title.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/core/utilies/extensions/app_extensions.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/core/utilies/styles/app_text_styles.dart';
import 'package:harrasi_rope_factory/features/products/models/product_model.dart';
import 'package:harrasi_rope_factory/features/categories/views/widgets/custom_circular_progress_indecator.dart';
import 'package:harrasi_rope_factory/features/products/view_models/edit_product_cubit/edit_product_cubit.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/custom_title.dart';
import 'package:harrasi_rope_factory/generated/locale_keys.g.dart';

class EditProductModalBottomSheetBody extends StatelessWidget {
  final ProductModel productModel;
  const EditProductModalBottomSheetBody(
      {super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditProductCubit, EditProductState>(
      listener: (context, state) {
        if (state is EditProductSuccess) {
          context.popScreen();
          CustomQuickAlert.success(
            title: LocaleKeys.products_edit_product_Product_Updated.tr(),
            message:
                LocaleKeys.products_edit_product_Product_Updated_message.tr(),
            animationType: CustomQuickAlertAnimationType.scale,
          );
        }
        if (state is EditProductFailure) {
          CustomQuickAlert.error(
            title: LocaleKeys
                .sales_invoices_add_sales_customQuickAlert_error_title
                .tr(),
            message: state.message,
            animationType: CustomQuickAlertAnimationType.slideInDown,
          );
        }
        if (state is EditProductNoChanges) {
          CustomQuickAlert.warning(
            title: LocaleKeys.customers_edit_customer_no_changes.tr(),
            message: LocaleKeys
                .expenses_category_edit_expenses_category_No_updates
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
          final cubit = context.read<EditProductCubit>();
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Center(
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomTitle(
                            title: LocaleKeys
                                .products_edit_product_Update_Product
                                .tr()),
                        SizedBox(height: SizeConfig.height * 0.05),
                        CustomTextFormFieldWithTitle(
                          title:
                              LocaleKeys.products_add_product_product_Name.tr(),
                          hintText: LocaleKeys
                              .products_add_product_enter_product_name
                              .tr(),
                          controller: cubit.nameController,
                        ),
                        SizedBox(height: SizeConfig.height * 0.01),
                        CustomTextFormFieldWithTitle(
                          title: LocaleKeys
                              .products_add_product_product_Description
                              .tr(),
                          hintText: LocaleKeys
                              .products_add_product_enter_product_description
                              .tr(),
                          controller: cubit.descriptionController,
                          maxLines: 3,
                        ),
                        SizedBox(height: SizeConfig.height * 0.01),
                        CustomTextFormFieldWithTitle(
                          title: LocaleKeys
                              .products_product_details_Purchase_Price
                              .tr(),
                          hintText: LocaleKeys
                              .products_edit_product_Purchase_Pricase_price
                              .tr(),
                          controller: cubit.purchasePriceController,
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(height: SizeConfig.height * 0.01),
                        CustomTextFormFieldWithTitle(
                          title: LocaleKeys.products_add_product_Selling_Price
                              .tr(),
                          hintText: LocaleKeys
                              .products_add_product_enter_selling_price
                              .tr(),
                          controller: cubit.sellingPriceController,
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(height: SizeConfig.height * 0.01),
                        CustomTextFormFieldWithTitle(
                          title: LocaleKeys.products_edit_product_Unit.tr(),
                          hintText:
                              LocaleKeys.products_edit_product_Enter_unit.tr(),
                          controller: cubit.unitController,
                        ),
                        SizedBox(height: SizeConfig.height * 0.01),
                        CustomTextFormFieldWithTitle(
                          title: LocaleKeys
                              .products_edit_product_Min_Stock_Level
                              .tr(),
                          hintText: LocaleKeys
                              .products_edit_product_Enter_min_stock
                              .tr(),
                          controller: cubit.minStockController,
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(height: SizeConfig.height * 0.02),
                        BlocBuilder<EditProductCubit, EditProductState>(
                          buildWhen: (previous, current) =>
                              current is ChangeManufactured,
                          builder: (context, state) {
                            return SwitchListTile(
                              title: Text(
                                  LocaleKeys
                                      .products_edit_product_Is_Manufactured
                                      .tr(),
                                  style: AppTextStyles.title18White70),
                              value: cubit.isManufactured,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side: BorderSide(
                                  color: AppColors.kThirdColor,
                                  width: 1,
                                ),
                              ),
                              activeColor: AppColors.kThirdColor,
                              thumbColor: WidgetStateProperty.all(
                                  AppColors.kPrimaryColor),
                              onChanged: (value) {
                                cubit.changeManufactured();
                              },
                            );
                          },
                        ),
                        SizedBox(height: SizeConfig.height * 0.05),
                        BlocBuilder<EditProductCubit, EditProductState>(
                          buildWhen: (previous, current) =>
                              current is EditProductLoading ||
                              previous is EditProductLoading,
                          builder: (context, state) {
                            return state is EditProductLoading
                                ? const CustomCircularProgresIndecator()
                                : CustomElevatedButton(
                                    onPressed: () {
                                      cubit.editProduct();
                                    },
                                    name: LocaleKeys
                                        .products_edit_product_Update_Product
                                        .tr(),
                                  );
                          },
                        )
                      ],
                    ),
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
