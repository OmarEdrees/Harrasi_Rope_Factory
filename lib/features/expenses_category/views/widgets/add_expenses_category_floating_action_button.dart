import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/features/expenses_category/view_models/add_expenses_category_cubit/add_expenses_category_cubit.dart';
import 'package:harrasi_rope_factory/features/expenses_category/views/widgets/add_expenses_category_modal_bottom_sheet.dart';

class AddExpensesCategoryFloatingActionButton extends StatelessWidget {
  const AddExpensesCategoryFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColors.kThirdColor,
      child: Icon(
        Icons.add,
        color: AppColors.kPrimaryColor,
      ),
      onPressed: () {
        showModalBottomSheet(
            context: context,
            backgroundColor: AppColors.kPrimaryColor,
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(36),
                topRight: Radius.circular(36),
              ),
            ),
            builder: (context) {
              return BlocProvider(
                create: (context) => AddExpensesCategoriesCubit(),
                child: AddExpensesCategoryModalBottomSheet(),
              );
            });
      },
    );
  }
}
