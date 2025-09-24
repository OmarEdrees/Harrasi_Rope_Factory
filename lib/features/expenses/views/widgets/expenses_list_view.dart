import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/features/expenses/view_models/expenses_cubit/expenses_cubit.dart';
import 'package:harrasi_rope_factory/features/expenses/views/widgets/expense_list_tile.dart';
import 'package:harrasi_rope_factory/features/categories/views/widgets/custom_empty_lottie.dart';
import 'package:harrasi_rope_factory/features/categories/views/widgets/loading_overlay.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/custom_failure_message.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ExpensesListView extends StatelessWidget {
  const ExpensesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpensesCubit, ExpensesState>(
      builder: (context, state) {
        final cubit = context.read<ExpensesCubit>();

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

        if (cubit.filteredExpenses.isEmpty) {
          return const CustomEmptyLottie();
        }

        return LoadingOverlay(
          isLoading: state is DeleteExpenseLoading,
          child: ListView.separated(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(
              vertical: SizeConfig.height * 0.02,
            ),
            itemCount: cubit.filteredExpenses.length,
            separatorBuilder: (_, __) => SizedBox(
              height: SizeConfig.height * 0.015,
            ),
            itemBuilder: (context, index) {
              final expense = cubit.filteredExpenses[index];
              return ExpenseListTile(
                key: ValueKey(expense.id),
                expense: expense,
              );
            },
          ),
        );
      },
    );
  }
}
