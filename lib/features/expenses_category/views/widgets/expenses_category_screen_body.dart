import 'package:custom_quick_alert/custom_quick_alert.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:harrasi_rope_factory/core/components/custom_text_form_field.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/features/expenses_category/view_models/expenses_category_cubit/expenses_category_cubit.dart';
import 'package:harrasi_rope_factory/features/expenses_category/views/widgets/expenses_categories_grid_view.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/custom_blur_title.dart';
import 'package:harrasi_rope_factory/generated/locale_keys.g.dart';

class ExpensesCategoryScreenBody extends StatelessWidget {
  const ExpensesCategoryScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ExpensesCategoriesCubit>();
    return SafeArea(
      child: BlocListener<ExpensesCategoriesCubit, ExpensesCategoriesState>(
        listener: (context, state) {
          if (state is DeleteExpensesCategoryFailure) {
            CustomQuickAlert.error(
              title: LocaleKeys
                  .sales_invoices_add_sales_customQuickAlert_error_title
                  .tr(),
              message: state.message,
              animationType: CustomQuickAlertAnimationType.slideInDown,
            );
          }
          if (state is DeleteExpensesCategorySuccess) {
            CustomQuickAlert.success(
              title: LocaleKeys.sales_invoices_add_sales_customQuickAlert_title.tr(),
              message: LocaleKeys.expenses_category_delete_expense_category_customQuickAlert_delete_message.tr(),
              animationType: CustomQuickAlertAnimationType.scale,
            );
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.width * 0.03,
            vertical: SizeConfig.height * 0.02,
          ),
          child: Column(
            children: [
              CustomPlurTitle(
                title: LocaleKeys
                    .expenses_category_add_expense_category_expenses_category_title
                    .tr(),
                icon: FontAwesomeIcons.moneyBills,
              ),
              SizedBox(height: SizeConfig.height * 0.02),
              CustomTextFormField(
                hintText: LocaleKeys
                    .expenses_category_add_expense_category_search_hintText
                    .tr(),
                onChanged: (value) {
                  EasyDebounce.debounce(
                    'expenses-category-search',
                    const Duration(milliseconds: 400),
                    () => cubit.searchForExpensesCategories(value),
                  );
                },
              ),
              SizedBox(height: SizeConfig.height * 0.04),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async => await cubit.getExpensesCategories(),
                  child: const ExpensesCategoriesGridView(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
