import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/features/expenses_category/view_models/expenses_category_cubit/expenses_category_cubit.dart';
import 'package:harrasi_rope_factory/features/expenses_category/views/widgets/expense_category_card.dart';
import 'package:harrasi_rope_factory/features/categories/views/widgets/custom_empty_lottie.dart';
import 'package:harrasi_rope_factory/features/categories/views/widgets/loading_overlay.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/custom_failure_message.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ExpensesCategoriesGridView extends StatelessWidget {
  const ExpensesCategoriesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpensesCategoriesCubit, ExpensesCategoriesState>(
      builder: (context, state) {
        final cubit = context.read<ExpensesCategoriesCubit>();

        if (state is GetExpensesCategoriesLoading) {
          return Center(
            child: LoadingAnimationWidget.flickr(
              leftDotColor: AppColors.kSecondaryColor,
              rightDotColor: AppColors.kThirdColor,
              size: SizeConfig.height * 0.05,
            ),
          );
        }

        if (state is GetExpensesCategoriesFailure) {
          return CustomFailureMessage(message: state.message);
        }

        if (cubit.filterExpensesCategories.isEmpty) {
          return const CustomEmptyLottie();
        }

        return LoadingOverlay(
          isLoading: state is DeleteExpensesCategoryLoading,
          child: GridView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.5,
            ),
            itemCount: cubit.filterExpensesCategories.length,
            itemBuilder: (context, index) {
              final expenseCategory = cubit.filterExpensesCategories[index];
              return ExpenseCategoryCard(
                key: ValueKey(expenseCategory.id),
                expenseCategory: expenseCategory,
              );
            },
          ),
        );
      },
    );
  }
}
