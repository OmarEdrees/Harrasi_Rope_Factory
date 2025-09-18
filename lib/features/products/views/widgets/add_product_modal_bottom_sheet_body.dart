import 'package:custom_quick_alert/custom_quick_alert.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harrasi_rope_factory/core/components/custom_drop_down_button_form_field.dart';
import 'package:harrasi_rope_factory/core/components/custom_elevated_button.dart';
import 'package:harrasi_rope_factory/core/components/custom_text_form_field_with_title.dart';
import 'package:harrasi_rope_factory/core/constants/app_constants.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/core/utilies/extensions/app_extensions.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/core/utilies/styles/app_text_styles.dart';
import 'package:harrasi_rope_factory/features/categories/models/category_model.dart';
import 'package:harrasi_rope_factory/features/categories/views/widgets/custom_circular_progress_indecator.dart';
import 'package:harrasi_rope_factory/features/products/view_models/add_products_cubit/add_product_cubit.dart';
import 'package:harrasi_rope_factory/features/products/views/widgets/pick_product_image.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/custom_title.dart';
import 'package:harrasi_rope_factory/generated/local_keys.g.dart';

class AddProductModalBottomSheetBody extends StatelessWidget {
  const AddProductModalBottomSheetBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddProductCubit, AddProductState>(
      listener: (context, state) {
        if (state is AddProductSuccess) {
          context.popScreen();
          CustomQuickAlert.success(
            title:
                LocaleKeys.sales_invoices_add_sales_customQuickAlert_title.tr(),
            message:
                LocaleKeys.products_add_product_customQuickAlert_message.tr(),
            animationType: CustomQuickAlertAnimationType.scale,
          );
        }
        if (state is AddProductFailure) {
          CustomQuickAlert.error(
            title: LocaleKeys
                .sales_invoices_add_sales_customQuickAlert_error_title
                .tr(),
            message: state.message,
            animationType: CustomQuickAlertAnimationType.slideInDown,
          );
        }
        if (state is SelectUnit) {
          CustomQuickAlert.warning(
            title: LocaleKeys
                .sales_invoices_add_sales_customQuickAlert_warning_title
                .tr(),
            message: LocaleKeys.products_add_product_SelectCategory.tr(),
            animationType: CustomQuickAlertAnimationType.slideInDown,
          );
        }
        if (state is SelectCategory) {
          CustomQuickAlert.warning(
            title: LocaleKeys
                .sales_invoices_add_sales_customQuickAlert_warning_title
                .tr(),
            message: LocaleKeys.products_add_product_SelectUnit.tr(),
            animationType: CustomQuickAlertAnimationType.slideInDown,
          );
        }
      },
      child: DraggableScrollableSheet(
        initialChildSize: 0.9,
        minChildSize: 0.9,
        maxChildSize: 1,
        expand: true,
        shouldCloseOnMinExtent: true,
        builder: (context, scrollController) {
          final cubit = context.read<AddProductCubit>();
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: SingleChildScrollView(
              controller: scrollController,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.width * 0.03,
                ),
                child: Form(
                  key: cubit.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                          child: CustomTitle(
                              title: LocaleKeys.products_add_product_customTitle
                                  .tr())),
                      SizedBox(height: SizeConfig.height * 0.04),
                      PickProductImage(),
                      SizedBox(height: SizeConfig.height * 0.03),
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
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextFormFieldWithTitle(
                              hintText: LocaleKeys
                                  .products_add_product_enter_product_price
                                  .tr(),
                              title: LocaleKeys
                                  .products_add_product_Product_Price
                                  .tr(),
                              controller: cubit.purchasePriceController,
                              keyboardType: TextInputType.number,
                              onChanged: (p0) {
                                cubit.getProfit();
                              },
                            ),
                          ),
                          SizedBox(width: SizeConfig.width * 0.02),
                          Expanded(
                            child: CustomTextFormFieldWithTitle(
                              hintText: LocaleKeys
                                  .products_add_product_enter_selling_price
                                  .tr(),
                              title: LocaleKeys
                                  .products_add_product_Selling_Price
                                  .tr(),
                              controller: cubit.sellingPriceController,
                              keyboardType: TextInputType.number,
                              onChanged: (p0) {
                                cubit.getProfit();
                              },
                            ),
                          ),
                        ],
                      ),
                      BlocBuilder<AddProductCubit, AddProductState>(
                        buildWhen: (previous, current) =>
                            current is UpdateProfit,
                        builder: (context, state) {
                          return Text(
                            LocaleKeys.products_add_product_Profit
                                .tr(namedArgs: {"value": "${cubit.netProfit}"}),
                            style: AppTextStyles.title16ThirdColor,
                          );
                        },
                      ),
                      SizedBox(height: SizeConfig.height * 0.01),
                      CustomDropDownButtonFormField<CategoryModel>(
                        items: cubit.categories,
                        title: LocaleKeys.products_add_product_Select_Category
                            .tr(),
                        controller: cubit.categoryIdController,
                        itemLabelBuilder: (category) => category.name,
                        onChanged: (category) {
                          if (category != null) {
                            cubit.categoryIdController.text = category.id;
                          }
                        },
                      ),
                      SizedBox(height: SizeConfig.height * 0.01),
                      CustomDropDownButtonFormField<String>(
                        items: AppConstants.units,
                        title: LocaleKeys.products_add_product_Select_Unit.tr(),
                        controller: cubit.unitController,
                      ),
                      SizedBox(height: SizeConfig.height * 0.01),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextFormFieldWithTitle(
                              hintText: LocaleKeys
                                  .products_add_product_min_stock
                                  .tr(),
                              title: LocaleKeys.products_add_product_min_stock
                                  .tr(),
                              controller: cubit.minStockLevelController,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          SizedBox(width: SizeConfig.width * 0.02),
                          Expanded(
                            child: CustomTextFormFieldWithTitle(
                              hintText: LocaleKeys
                                  .products_add_product_current_stock
                                  .tr(),
                              title: LocaleKeys
                                  .products_add_product_current_stock
                                  .tr(),
                              controller: cubit.currentStockController,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: SizeConfig.height * 0.02),
                      BlocBuilder<AddProductCubit, AddProductState>(
                        buildWhen: (previous, current) =>
                            current is ChangeIsManufacturer,
                        builder: (context, state) {
                          return SwitchListTile(
                            title: Text(
                                LocaleKeys.products_add_product_Is_Manufacturer
                                    .tr(),
                                style: AppTextStyles.title18White70),
                            value: cubit.isManufacturer,
                            thumbColor: WidgetStateProperty.all(
                                AppColors.kPrimaryColor),
                            activeColor: AppColors.kThirdColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(color: AppColors.kThirdColor),
                            ),
                            onChanged: (value) {
                              cubit.changeIsManufacturer();
                            },
                          );
                        },
                      ),
                      SizedBox(height: SizeConfig.height * 0.03),
                      BlocBuilder<AddProductCubit, AddProductState>(
                        buildWhen: (previous, current) {
                          return current is AddProductLoading ||
                              previous is AddProductLoading;
                        },
                        builder: (context, state) {
                          return state is AddProductLoading
                              ? CustomCircularProgresIndecator()
                              : CustomElevatedButton(
                                  name: LocaleKeys
                                      .products_add_product_Add_Product
                                      .tr(),
                                  onPressed: () {
                                    cubit.addProduct();
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
