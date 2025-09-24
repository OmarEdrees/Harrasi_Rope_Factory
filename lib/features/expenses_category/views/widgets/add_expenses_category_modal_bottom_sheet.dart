import 'package:custom_quick_alert/custom_quick_alert.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harrasi_rope_factory/core/components/custom_elevated_button.dart';
import 'package:harrasi_rope_factory/core/components/custom_text_form_field_with_title.dart';
import 'package:harrasi_rope_factory/core/utilies/extensions/app_extensions.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/features/categories/views/widgets/custom_circular_progress_indecator.dart';
import 'package:harrasi_rope_factory/features/expenses_category/view_models/add_expenses_category_cubit/add_expenses_category_cubit.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/custom_title.dart';
import 'package:harrasi_rope_factory/generated/locale_keys.g.dart';

class AddExpensesCategoryModalBottomSheet extends StatelessWidget {
  const AddExpensesCategoryModalBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AddExpensesCategoriesCubit>();
    return BlocListener<AddExpensesCategoriesCubit, AddExpensesCategoryState>(
      listener: (context, state) {
        if (state is AddExpensesCategorySuccess) {
          context.popScreen();
          CustomQuickAlert.success(
            title:
                LocaleKeys.sales_invoices_add_sales_customQuickAlert_title.tr(),
            message: LocaleKeys
                .expenses_category_add_expense_category_customQuickAlert_message
                .tr(),
            animationType: CustomQuickAlertAnimationType.scale,
          );
        }
        if (state is AddExpensesCategoryFailure) {
          CustomQuickAlert.error(
            title: LocaleKeys
                .sales_invoices_add_sales_customQuickAlert_error_title
                .tr(),
            message: state.message,
            animationType: CustomQuickAlertAnimationType.scale,
          );
        }
      },
      child: DraggableScrollableSheet(
        expand: true,
        initialChildSize: 0.9,
        minChildSize: 0.9,
        maxChildSize: 0.9,
        builder: (context, scrollController) => Padding(
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
                      CustomTitle(
                          title: LocaleKeys
                              .expenses_category_add_expense_category_customTitle
                              .tr()),
                      SizedBox(
                        height: SizeConfig.height * 0.05,
                      ),
                      CustomTextFormFieldWithTitle(
                        hintText: LocaleKeys
                            .expenses_category_add_expense_category_enter_expenses_name
                            .tr(),
                        title: LocaleKeys
                            .expenses_category_add_expense_category_expenses_Name
                            .tr(),
                        controller: cubit.nameController,
                      ),
                      SizedBox(
                        height: SizeConfig.height * 0.01,
                      ),
                      CustomTextFormFieldWithTitle(
                        hintText: LocaleKeys
                            .expenses_category_add_expense_category_enter_expenses_description
                            .tr(),
                        title: LocaleKeys
                            .expenses_category_add_expense_category_expenses_Description
                            .tr(),
                        controller: cubit.descriptionController,
                      ),
                      SizedBox(
                        height: SizeConfig.height * 0.03,
                      ),
                      BlocBuilder<AddExpensesCategoriesCubit,
                          AddExpensesCategoryState>(
                        buildWhen: (previous, current) =>
                            current is AddExpensesCategoryLoading ||
                            previous is AddExpensesCategoryLoading,
                        builder: (context, state) {
                          return state is AddExpensesCategoryLoading
                              ? CustomCircularProgresIndecator()
                              : CustomElevatedButton(
                                  name: LocaleKeys
                                      .expenses_category_add_expense_category_Add_Expenses_Category
                                      .tr(),
                                  onPressed: () {
                                    cubit.addExpensesCategory();
                                  },
                                );
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
