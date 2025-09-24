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
import 'package:harrasi_rope_factory/features/manufacture/models/manufacture_model.dart';
import 'package:harrasi_rope_factory/features/manufacture/view_models/edit_manufacture_cubit/edit_manufacture_cubit.dart';
import 'package:harrasi_rope_factory/generated/locale_keys.g.dart';

class EditManufactureModalBottomSheetBody extends StatelessWidget {
  final ManufactureModel manufactureModel;
  const EditManufactureModalBottomSheetBody({
    super.key,
    required this.manufactureModel,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditManufactureCubit, EditManufactureState>(
      listener: (context, state) {
        if (state is EditManufactureSuccess) {
          context.popScreen();
          CustomQuickAlert.success(
            title: LocaleKeys.suppliers_edit_supplier_supplier_updated.tr(),
            message: LocaleKeys.manufacture_Manufacture_updated.tr(),
          );
        } else if (state is EditManufactureFailure) {
          CustomQuickAlert.error(
            title: LocaleKeys
                .sales_invoices_add_sales_customQuickAlert_error_title
                .tr(),
            message: state.message,
          );
        } else if (state is EditManufactureNoChanges) {
          CustomQuickAlert.info(
            title: LocaleKeys.manufacture_Info.tr(),
            message: LocaleKeys.manufacture_No_changes.tr(),
          );
        }
      },
      child: DraggableScrollableSheet(
        expand: true,
        initialChildSize: 0.9,
        minChildSize: 0.9,
        maxChildSize: 0.9,
        builder: (context, scrollController) {
          final cubit = context.read<EditManufactureCubit>();
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
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
                      CustomTextFormFieldWithTitle(
                        hintText: LocaleKeys
                            .sales_invoices_add_sales_quantity_hintText
                            .tr(),
                        title: LocaleKeys
                            .sales_invoices_add_sales_quantity_title
                            .tr(),
                        controller: cubit.quantityController,
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: SizeConfig.height * 0.01),
                      CustomTextFormFieldWithTitle(
                        hintText:
                            LocaleKeys.expenses_add_expense_enter_notes.tr(),
                        title: LocaleKeys.expenses_details_modal_Notes.tr(),
                        controller: cubit.notesController,
                        maxLines: 3,
                      ),
                      SizedBox(height: SizeConfig.height * 0.01),
                      CustomDropDownButtonFormField(
                        items: AppConstants.status,
                        value: cubit.status,
                        title: LocaleKeys.manufacture_Status.tr(),
                        hintText: LocaleKeys.manufacture_select_status.tr(),
                        onChanged: (value) {
                          if (value != null) cubit.changeStatus(value);
                        },
                      ),
                      SizedBox(height: SizeConfig.height * 0.05),
                      BlocBuilder<EditManufactureCubit, EditManufactureState>(
                        buildWhen: (previous, current) =>
                            current is EditManufactureLoading ||
                            previous is EditManufactureLoading,
                        builder: (context, state) {
                          return state is EditManufactureLoading
                              ? const CustomCircularProgresIndecator()
                              : CustomElevatedButton(
                                  onPressed: () {
                                    cubit.editManufacture();
                                  },
                                  name: LocaleKeys
                                      .manufacture_Update_Manufacture
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
