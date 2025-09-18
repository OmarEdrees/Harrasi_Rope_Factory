import 'package:custom_quick_alert/custom_quick_alert.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harrasi_rope_factory/core/components/custom_drop_down_button_form_field.dart';
import 'package:harrasi_rope_factory/core/components/custom_elevated_button.dart';
import 'package:harrasi_rope_factory/core/components/custom_text_form_field_with_title.dart';
import 'package:harrasi_rope_factory/core/constants/app_constants.dart';
import 'package:harrasi_rope_factory/core/utilies/extensions/app_extensions.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/features/categories/views/widgets/custom_circular_progress_indecator.dart';
import 'package:harrasi_rope_factory/features/raw_materials/view_models/add_raw_material_cubit/add_raw_material_cubit.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/custom_title.dart';
import 'package:harrasi_rope_factory/generated/local_keys.g.dart';

class AddMaterialModalBottomSheetBody extends StatelessWidget {
  const AddMaterialModalBottomSheetBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddRawMaterialCubit, AddRawMaterialState>(
      listener: (context, state) {
        if (state is AddRawMaterialSuccess) {
          context.popScreen();
          CustomQuickAlert.success(
            title:
                LocaleKeys.sales_invoices_add_sales_customQuickAlert_title.tr(),
            message: LocaleKeys.raw_materials_customQuickAlert_message.tr(),
            animationType: CustomQuickAlertAnimationType.scale,
          );
        }
        if (state is AddRawMaterialsError) {
          CustomQuickAlert.error(
            title: LocaleKeys
                .sales_invoices_add_sales_customQuickAlert_error_title
                .tr(),
            message: state.error,
            animationType: CustomQuickAlertAnimationType.slideInDown,
          );
        }
        if (state is UnitNotSelected) {
          CustomQuickAlert.warning(
            title: LocaleKeys
                .sales_invoices_add_sales_customQuickAlert_warning_title
                .tr(),
            message: LocaleKeys.raw_materials_UnitNotSelected.tr(),
            animationType: CustomQuickAlertAnimationType.slideInDown,
          );
        }
      },
      child: DraggableScrollableSheet(
        expand: true,
        shouldCloseOnMinExtent: true,
        initialChildSize: 0.9,
        minChildSize: 0.5,
        maxChildSize: 0.9,
        builder: (_, controller) {
          var cubit = context.read<AddRawMaterialCubit>();
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: SingleChildScrollView(
              controller: controller,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.width * 0.03,
                  vertical: SizeConfig.height * 0.01,
                ),
                child: Form(
                  key: cubit.addRawMaterialFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomTitle(
                        title: LocaleKeys.raw_materials_customTitle.tr(),
                      ),
                      SizedBox(height: SizeConfig.height * 0.05),
                      CustomTextFormFieldWithTitle(
                        hintText:
                            LocaleKeys.raw_materials_enter_material_name.tr(),
                        title: LocaleKeys.raw_materials_material_Name.tr(),
                        controller: cubit.nameController,
                      ),
                      SizedBox(height: SizeConfig.height * 0.01),
                      CustomTextFormFieldWithTitle(
                        hintText: LocaleKeys
                            .raw_materials_enter_material_description
                            .tr(),
                        title:
                            LocaleKeys.raw_materials_material_Description.tr(),
                        controller: cubit.descriptionController,
                        maxLines: 3,
                      ),
                      SizedBox(height: SizeConfig.height * 0.01),
                      CustomTextFormFieldWithTitle(
                        hintText: LocaleKeys
                            .raw_materials_enter_material_quantity
                            .tr(),
                        title: LocaleKeys.raw_materials_Material_Quantity.tr(),
                        controller: cubit.quantityController,
                      ),
                      SizedBox(height: SizeConfig.height * 0.01),
                      CustomDropDownButtonFormField(
                        items: AppConstants.units,
                        title: LocaleKeys.raw_materials_Material_Unit.tr(),
                        hintText:
                            LocaleKeys.raw_materials_select_material_unit.tr(),
                        controller: cubit.unitController,
                      ),
                      SizedBox(height: SizeConfig.height * 0.05),
                      BlocBuilder<AddRawMaterialCubit, AddRawMaterialState>(
                        buildWhen: (previous, current) {
                          return current is AddRawMaterialLoading ||
                              previous is AddRawMaterialLoading;
                        },
                        builder: (context, state) {
                          return state is AddRawMaterialLoading
                              ? CustomCircularProgresIndecator()
                              : CustomElevatedButton(
                                  onPressed: () {
                                    cubit.addRawMaterial();
                                  },
                                  name: LocaleKeys.raw_materials_Add_Material
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
