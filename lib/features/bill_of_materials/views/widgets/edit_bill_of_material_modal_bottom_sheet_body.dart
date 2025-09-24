import 'package:custom_quick_alert/custom_quick_alert.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harrasi_rope_factory/core/components/custom_elevated_button.dart';
import 'package:harrasi_rope_factory/core/components/custom_text_form_field_with_title.dart';
import 'package:harrasi_rope_factory/core/utilies/extensions/app_extensions.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/features/bill_of_materials/models/bill_of_material_model.dart';
import 'package:harrasi_rope_factory/features/bill_of_materials/veiw_models/edit_bill_of_material_cubit/edit_bill_of_material_cubit.dart';
import 'package:harrasi_rope_factory/features/categories/views/widgets/custom_circular_progress_indecator.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/custom_title.dart';
import 'package:harrasi_rope_factory/generated/locale_keys.g.dart';

class EditBillOfMaterialModalBottomSheetBody extends StatelessWidget {
  final BillOfMaterialModel billOfMaterial;
  const EditBillOfMaterialModalBottomSheetBody({
    super.key,
    required this.billOfMaterial,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditBillOfMaterialCubit, EditBillOfMaterialState>(
      listener: (context, state) {
        if (state is EditBillOfMaterialSuccess) {
          context.popScreen();
          CustomQuickAlert.success(
            title: LocaleKeys.bill_of_materials_update_customQuickAlert_title.tr(),
            message: LocaleKeys.bill_of_materials_update_customQuickAlert_message_update.tr(),
            animationType: CustomQuickAlertAnimationType.scale,
          );
        } else if (state is EditBillOfMaterialFailure) {
          CustomQuickAlert.error(
            title: LocaleKeys.bill_of_materials_update_customQuickAlert_error_title.tr(),
            message: state.errorMessage,
            animationType: CustomQuickAlertAnimationType.slideInDown,
          );
        } else if (state is EditBillOfMaterialNoChanges) {
          CustomQuickAlert.warning(
            title: LocaleKeys.bill_of_materials_update_customQuickAlert_title.tr(),
            message: LocaleKeys.bill_of_materials_update_customQuickAlert_no_changes_message.tr(),
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
          final cubit = context.read<EditBillOfMaterialCubit>();
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
                          title: LocaleKeys.bill_of_materials_update_customTitle_update.tr(),
                        ),
                        SizedBox(height: SizeConfig.height * 0.05),
                        CustomTextFormFieldWithTitle(
                          hintText: LocaleKeys.bill_of_materials_enter_name.tr(),
                          title: LocaleKeys.bill_of_materials_name.tr(),
                          controller: cubit.nameController,
                        ),
                        SizedBox(height: SizeConfig.height * 0.01),
                        CustomTextFormFieldWithTitle(
                          hintText: LocaleKeys.bill_of_materials_enter_description.tr(),
                          title: LocaleKeys.bill_of_materials_description.tr(),
                          controller: cubit.descriptionController,
                          maxLines: 3,
                        ),
                        SizedBox(height: SizeConfig.height * 0.05),
                        BlocBuilder<EditBillOfMaterialCubit, EditBillOfMaterialState>(
                          buildWhen: (previous, current) {
                            return current is EditBillOfMaterialLoading ||
                                previous is EditBillOfMaterialLoading;
                          },
                          builder: (context, state) {
                            return state is EditBillOfMaterialLoading
                                ? CustomCircularProgresIndecator()
                                : CustomElevatedButton(
                                    onPressed: () {
                                      cubit.editBillOfMaterial();
                                    },
                                    name: LocaleKeys.bill_of_materials_update_button.tr(),
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
