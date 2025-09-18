import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:harrasi_rope_factory/core/components/custom_text_form_field.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/features/categories/views/widgets/custom_empty_lottie.dart';
import 'package:harrasi_rope_factory/features/expenses_category/view_models/expenses_category_cubit/expenses_category_cubit.dart';
import 'package:harrasi_rope_factory/features/expenses_category/views/widgets/expenses_categories_list.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/custom_blur_title.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/custom_failure_message.dart';
import 'package:harrasi_rope_factory/generated/local_keys.g.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ExpensesCategoryScreenBody extends StatelessWidget {
  const ExpensesCategoryScreenBody({
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
              title: LocaleKeys
                  .expenses_category_add_expense_category_expenses_category_title
                  .tr(),
              icon: FontAwesomeIcons.moneyBills,
            ),
            Expanded(
              child:
                  BlocBuilder<ExpensesCategoriesCubit, ExpensesCategoriesState>(
                builder: (context, state) {
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
                  var cubit = context.read<ExpensesCategoriesCubit>();
                  return RefreshIndicator(
                    color: AppColors.kPrimaryColor,
                    backgroundColor: AppColors.kThirdColor,
                    onRefresh: () async {
                      await cubit.getExpensesCategories();
                    },
                    child: CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: SizeConfig.height * 0.03,
                              bottom: SizeConfig.height * 0.03,
                            ),
                            child: CustomTextFormField(
                              hintText: LocaleKeys
                                  .expenses_category_add_expense_category_search_hintText
                                  .tr(),
                              onChanged: (value) {
                                cubit.searchForExpensesCategories(value);
                              },
                            ),
                          ),
                        ),
                        cubit.filterExpensesCategories.isEmpty
                            ? SliverToBoxAdapter(
                                child: const CustomEmptyLottie(),
                              )
                            : ExpensesCategoriesList(
                                expensesCategories:
                                    cubit.filterExpensesCategories),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
