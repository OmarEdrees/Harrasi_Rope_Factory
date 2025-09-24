import 'package:custom_quick_alert/custom_quick_alert.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:harrasi_rope_factory/core/components/custom_text_form_field.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/features/expenses/view_models/expenses_cubit/expenses_cubit.dart';
import 'package:harrasi_rope_factory/features/expenses/views/widgets/expenses_list_view.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/custom_blur_title.dart';
import 'package:harrasi_rope_factory/generated/locale_keys.g.dart';

class ExpensesScreenBody extends StatelessWidget {
  const ExpensesScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ExpensesCubit>();
    return BlocListener<ExpensesCubit, ExpensesState>(
      listener: (context, state) {
        if (state is DeleteExpenseFailure) {
          CustomQuickAlert.error(
            title: LocaleKeys
                .sales_invoices_add_sales_customQuickAlert_error_title
                .tr(),
            message: state.message,
            animationType: CustomQuickAlertAnimationType.slideInDown,
          );
        }
        if (state is DeleteExpenseSuccess) {
          CustomQuickAlert.success(
            title: LocaleKeys.sales_invoices_add_sales_customQuickAlert_title.tr(),
            message: LocaleKeys.expenses_delete_expense_customQuickAlert_delete_message.tr(),
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
              title: LocaleKeys.expenses_add_expense_expenses_title.tr(),
              icon: FontAwesomeIcons.moneyBillWave,
            ),
            SizedBox(height: SizeConfig.height * 0.02),
            CustomTextFormField(
              hintText:
                  LocaleKeys.expenses_add_expense_search_hintText.tr(),
              onChanged: (value) {
                EasyDebounce.debounce(
                  'expense-search',
                  const Duration(milliseconds: 400),
                  () => cubit.searchExpense(value),
                );
              },
            ),
            SizedBox(height: SizeConfig.height * 0.04),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async => await cubit.getExpenses(),
                child: const ExpensesListView(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
