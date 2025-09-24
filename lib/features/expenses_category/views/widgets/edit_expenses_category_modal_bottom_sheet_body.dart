import 'package:custom_quick_alert/custom_quick_alert.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harrasi_rope_factory/core/components/custom_elevated_button.dart';
import 'package:harrasi_rope_factory/core/components/custom_text_form_field_with_title.dart';
import 'package:harrasi_rope_factory/core/utilies/extensions/app_extensions.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/features/categories/views/widgets/custom_circular_progress_indecator.dart';
import 'package:harrasi_rope_factory/features/expenses_category/models/expenses_category_model.dart';
import 'package:harrasi_rope_factory/features/expenses_category/view_models/edit_expenses_category_cubit/edit_expenses_category_cubit.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/custom_title.dart';
import 'package:harrasi_rope_factory/generated/locale_keys.g.dart';

class EditExpensesCategoryModalBottomSheetBody extends StatelessWidget {
  final ExpensesCategoryModel categoryModel;
  const EditExpensesCategoryModalBottomSheetBody({
    super.key,
    required this.categoryModel,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditExpensesCategoryCubit, EditExpensesCategoryState>(
      listener: (context, state) {
        if (state is EditExpensesCategorySuccess) {
          context.popScreen();
          CustomQuickAlert.success(
            title: LocaleKeys.suppliers_edit_supplier_supplier_updated.tr(),
            message: LocaleKeys
                .expenses_category_edit_expenses_category_expenses_category
                .tr(),
            animationType: CustomQuickAlertAnimationType.scale,
          );
        }
        if (state is EditExpensesCategoryFailure) {
          CustomQuickAlert.error(
            title: LocaleKeys
                .sales_invoices_add_sales_customQuickAlert_error_title
                .tr(),
            message: state.message,
            animationType: CustomQuickAlertAnimationType.slideInDown,
          );
        }
        if (state is EditExpensesCategoryNoChanges) {
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
          final cubit = context.read<EditExpensesCategoryCubit>();
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
                              .expenses_category_edit_expenses_category_Update_Expenses_Category
                              .tr(),
                        ),
                        SizedBox(height: SizeConfig.height * 0.05),
                        CustomTextFormFieldWithTitle(
                          hintText: LocaleKeys
                              .expenses_category_add_expense_category_enter_expenses_name
                              .tr(),
                          title: LocaleKeys
                              .expenses_category_add_expense_category_expenses_Name
                              .tr(),
                          controller: cubit.nameController,
                        ),
                        SizedBox(height: SizeConfig.height * 0.01),
                        CustomTextFormFieldWithTitle(
                          hintText: LocaleKeys
                              .expenses_category_add_expense_category_enter_expenses_description
                              .tr(),
                          title: LocaleKeys
                              .expenses_category_add_expense_category_expenses_Description
                              .tr(),
                          controller: cubit.descriptionController,
                          maxLines: 3,
                        ),
                        SizedBox(height: SizeConfig.height * 0.05),
                        BlocBuilder<EditExpensesCategoryCubit,
                            EditExpensesCategoryState>(
                          buildWhen: (previous, current) {
                            return current is EditExpensesCategoryLoading ||
                                previous is EditExpensesCategoryLoading;
                          },
                          builder: (context, state) {
                            return state is EditExpensesCategoryLoading
                                ? CustomCircularProgresIndecator()
                                : CustomElevatedButton(
                                    onPressed: () {
                                      cubit.editExpensesCategory();
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
