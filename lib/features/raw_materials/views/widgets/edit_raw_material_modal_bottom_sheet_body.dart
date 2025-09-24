import 'package:custom_quick_alert/custom_quick_alert.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harrasi_rope_factory/core/components/custom_elevated_button.dart';
import 'package:harrasi_rope_factory/core/components/custom_text_form_field_with_title.dart';
import 'package:harrasi_rope_factory/core/utilies/extensions/app_extensions.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/features/raw_materials/models/raw_material_model.dart';
import 'package:harrasi_rope_factory/features/categories/views/widgets/custom_circular_progress_indecator.dart';
import 'package:harrasi_rope_factory/features/raw_materials/view_models/edit_raw_material_cubit/edit_raw_material_cubit.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/custom_title.dart';
import 'package:harrasi_rope_factory/generated/locale_keys.g.dart';

class EditRawMaterialModalBottomSheetBody extends StatelessWidget {
  final RawMaterialModel material;
  const EditRawMaterialModalBottomSheetBody({
    super.key,
    required this.material,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditRawMaterialCubit, EditRawMaterialState>(
      listener: (context, state) {
        if (state is EditRawMaterialSuccess) {
          context.popScreen();
          CustomQuickAlert.success(
            title: LocaleKeys.suppliers_edit_supplier_supplier_updated.tr(),
            message: LocaleKeys.raw_materials_Raw_materal.tr(),
            animationType: CustomQuickAlertAnimationType.scale,
          );
        }
        if (state is EditRawMaterialFailure) {
          CustomQuickAlert.error(
            title: LocaleKeys
                .sales_invoices_add_sales_customQuickAlert_error_title
                .tr(),
            message: state.message,
            animationType: CustomQuickAlertAnimationType.slideInDown,
          );
        }
        if (state is EditRawMaterialNoChanges) {
          CustomQuickAlert.warning(
            title: LocaleKeys.customers_edit_customer_no_changes.tr(),
            message: LocaleKeys.raw_materials_No_updates.tr(),
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
          final cubit = context.read<EditRawMaterialCubit>();
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
                          title:
                              LocaleKeys.raw_materials_Update_Raw_Material.tr(),
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
                          title: LocaleKeys.raw_materials_material_Description
                              .tr(),
                          controller: cubit.descriptionController,
                          maxLines: 3,
                        ),
                        SizedBox(height: SizeConfig.height * 0.01),
                        CustomTextFormFieldWithTitle(
                          hintText: LocaleKeys.raw_materials_Enter_unit.tr(),
                          title: LocaleKeys.raw_materials_Material_Unit.tr(),
                          controller: cubit.unitController,
                        ),
                        SizedBox(height: SizeConfig.height * 0.01),
                        CustomTextFormFieldWithTitle(
                          hintText:
                              LocaleKeys.raw_materials_Enter_current_stock.tr(),
                          title: LocaleKeys.raw_materials_Current_Stock.tr(),
                          controller: cubit.stockController,
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(height: SizeConfig.height * 0.05),
                        BlocBuilder<EditRawMaterialCubit, EditRawMaterialState>(
                          buildWhen: (previous, current) {
                            return current is EditRawMaterialLoading ||
                                previous is EditRawMaterialLoading;
                          },
                          builder: (context, state) {
                            return state is EditRawMaterialLoading
                                ? CustomCircularProgresIndecator()
                                : CustomElevatedButton(
                                    onPressed: () {
                                      cubit.editRawMaterial();
                                    },
                                    name: LocaleKeys
                                        .expenses_category_edit_expenses_category_Update
                                        .tr(),
                                  );
                          },
                        ),
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
