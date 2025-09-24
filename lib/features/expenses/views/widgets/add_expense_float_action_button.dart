import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/features/expenses/view_models/add_expense_cubit/add_expense_cubit.dart';
import 'package:harrasi_rope_factory/features/expenses/views/widgets/add_expense_modal_bottom_sheet_body.dart';

class AddExpenseFloatActionButton extends StatelessWidget {
  const AddExpenseFloatActionButton({
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
          builder: (context) => BlocProvider(
            create: (context) => AddExpenseCubit(),
            child: AddExpenseModalBottomSheetBody(),
          ),
        );
      },
    );
  }
}
