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
import 'package:harrasi_rope_factory/features/expenses/view_models/add_expense_cubit/add_expense_cubit.dart';
import 'package:harrasi_rope_factory/features/manufacture/views/widgets/custom_date_time_form_field.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/custom_title.dart';
import 'package:harrasi_rope_factory/generated/local_keys.g.dart';

class AddExpenseModalBottomSheetBody extends StatelessWidget {
  const AddExpenseModalBottomSheetBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AddExpenseCubit>();
    return BlocListener<AddExpenseCubit, AddExpenseState>(
      listener: (context, state) {
        if (state is AddExpenseSuccess) {
          context.popScreen();
          CustomQuickAlert.success(
            title:
                LocaleKeys.sales_invoices_add_sales_customQuickAlert_title.tr(),
            message:
                LocaleKeys.expenses_add_expense_customQuickAlert_message.tr(),
            animationType: CustomQuickAlertAnimationType.scale,
          );
        }
        if (state is AddExpenseFailure) {
          CustomQuickAlert.error(
            title: LocaleKeys
                .sales_invoices_add_sales_customQuickAlert_error_title
                .tr(),
            message: state.message,
            animationType: CustomQuickAlertAnimationType.scale,
          );
        }
        if (state is SelectExpenseDate) {
          CustomQuickAlert.warning(
            title: LocaleKeys
                .sales_invoices_add_sales_customQuickAlert_warning_title
                .tr(),
            message: LocaleKeys
                .expenses_add_expense_customQuickAlert_selectExpenseDate_message
                .tr(),
            animationType: CustomQuickAlertAnimationType.scale,
          );
        }
        if (state is SelectPaymentMethod) {
          CustomQuickAlert.warning(
            title: LocaleKeys
                .sales_invoices_add_sales_customQuickAlert_warning_title
                .tr(),
            message: LocaleKeys
                .expenses_add_expense_customQuickAlert_selectPaymentMethod_message
                .tr(),
            animationType: CustomQuickAlertAnimationType.scale,
          );
        }
        if (state is SelectExpenseCategory) {
          CustomQuickAlert.warning(
            title: LocaleKeys
                .sales_invoices_add_sales_customQuickAlert_warning_title
                .tr(),
            message: LocaleKeys
                .expenses_add_expense_customQuickAlert_selectExpenseCategory_message
                .tr(),
            animationType: CustomQuickAlertAnimationType.scale,
          );
        }
      },
      child: DraggableScrollableSheet(
        expand: true,
        initialChildSize: 0.9,
        minChildSize: 0.9,
        maxChildSize: 0.9,
        shouldCloseOnMinExtent: true,
        builder: (context, scrollController) => Padding(
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
                        title:
                            LocaleKeys.expenses_add_expense_customTitle.tr()),
                    SizedBox(
                      height: SizeConfig.height * 0.05,
                    ),
                    BlocBuilder<AddExpenseCubit, AddExpenseState>(
                      buildWhen: (previous, current) =>
                          current is GetExpensesCategoriesSuccess ||
                          current is GetExpensesCategoriesFailure ||
                          current is GetExpensesCategoriesLoading,
                      builder: (context, state) {
                        return state is AddExpenseLoading
                            ? CircularProgressIndicator()
                            : CustomDropDownButtonFormField(
                                items: cubit.expensesCategories,
                                itemLabelBuilder: (item) => item.name,
                                title: LocaleKeys
                                    .expenses_add_expense_Expenses_Category
                                    .tr(),
                                hintText: LocaleKeys
                                    .expenses_add_expense_select_expenses_category
                                    .tr(),
                                onChanged: (p0) {
                                  cubit.categoryIdController.text =
                                      p0!.id.toString();
                                },
                              );
                      },
                    ),
                    SizedBox(
                      height: SizeConfig.height * 0.01,
                    ),
                    CustomTextFormFieldWithTitle(
                      title: LocaleKeys.expenses_add_expense_Reference.tr(),
                      hintText:
                          LocaleKeys.expenses_add_expense_enter_reference.tr(),
                      controller: cubit.referenceController,
                    ),
                    SizedBox(
                      height: SizeConfig.height * 0.01,
                    ),
                    CustomTextFormFieldWithTitle(
                      title: LocaleKeys.expenses_add_expense_Amount.tr(),
                      hintText:
                          LocaleKeys.expenses_add_expense_enter_amount.tr(),
                      controller: cubit.amountController,
                    ),
                    SizedBox(
                      height: SizeConfig.height * 0.01,
                    ),
                    CustomDropDownButtonFormField(
                      items: AppConstants.paymentMethods,
                      controller: cubit.paymentMethodController,
                      hintText: LocaleKeys
                          .expenses_add_expense_select_payment_method
                          .tr(),
                      title:
                          LocaleKeys.expenses_add_expense_Payment_Method.tr(),
                    ),
                    SizedBox(
                      height: SizeConfig.height * 0.01,
                    ),
                    CustomDateTimeFormField(
                      title: LocaleKeys.expenses_add_expense_Date.tr(),
                      hintText:
                          LocaleKeys.expenses_add_expense_select_date.tr(),
                      onChanged: (p0) {
                        cubit.expenseDate = p0;
                      },
                    ),
                    SizedBox(
                      height: SizeConfig.height * 0.01,
                    ),
                    CustomTextFormFieldWithTitle(
                      title: LocaleKeys.expenses_add_expense_Notes.tr(),
                      hintText:
                          LocaleKeys.expenses_add_expense_enter_notes.tr(),
                      maxLines: 3,
                      controller: cubit.notesController,
                    ),
                    SizedBox(
                      height: SizeConfig.height * 0.03,
                    ),
                    BlocBuilder<AddExpenseCubit, AddExpenseState>(
                      buildWhen: (previous, current) =>
                          current is AddExpenseLoading ||
                          previous is AddExpenseLoading,
                      builder: (context, state) {
                        return state is AddExpenseLoading
                            ? CustomCircularProgresIndecator()
                            : CustomElevatedButton(
                                name: LocaleKeys
                                    .expenses_add_expense_Add_Expense
                                    .tr(),
                                onPressed: () {
                                  cubit.addExpense();
                                },
                              );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
