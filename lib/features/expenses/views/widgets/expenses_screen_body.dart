import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:harrasi_rope_factory/core/components/custom_text_form_field.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/features/expenses/view_models/expenses_cubit/expenses_cubit.dart';
import 'package:harrasi_rope_factory/features/expenses/views/widgets/expenses_list.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/custom_blur_title.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/custom_failure_message.dart';
import 'package:harrasi_rope_factory/generated/local_keys.g.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ExpensesScreenBody extends StatelessWidget {
  const ExpensesScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.width * 0.03,
          vertical: SizeConfig.height * 0.02,
        ),
        child: Column(
          children: [
            CustomPlurTitle(
                title: LocaleKeys.expenses_add_expense_expenses_title.tr(),
                icon: FontAwesomeIcons.moneyBillWave),
            SizedBox(height: SizeConfig.height * 0.03),
            Expanded(
              child: BlocBuilder<ExpensesCubit, ExpensesState>(
                builder: (context, state) {
                  if (state is GetExpensesLoading) {
                    return Center(
                      child: LoadingAnimationWidget.threeArchedCircle(
                        color: AppColors.kThirdColor,
                        size: SizeConfig.height * 0.1,
                      ),
                    );
                  }
                  if (state is GetExpensesFailure) {
                    return CustomFailureMessage(message: state.message);
                  }
                  var cubit = context.read<ExpensesCubit>();
                  return RefreshIndicator(
                    color: AppColors.kPrimaryColor,
                    backgroundColor: AppColors.kThirdColor,
                    onRefresh: () async {
                      cubit.getExpenses();
                    },
                    child: CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: CustomTextFormField(
                            hintText: LocaleKeys
                                .expenses_add_expense_search_hintText
                                .tr(),
                            onChanged: (value) {
                              cubit.searchExpense(value);
                            },
                          ),
                        ),
                        ExpensesList(
                          expenses: cubit.filteredExpenses,
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
