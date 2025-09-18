import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/core/utilies/styles/app_text_styles.dart';
import 'package:harrasi_rope_factory/features/expenses/models/expense_model.dart';
import 'package:harrasi_rope_factory/features/expenses/views/widgets/expense_details_modal_bottom_sheet_body.dart';
import 'package:harrasi_rope_factory/features/products/views/widgets/delete_and_edit_menu_button.dart';
import 'package:harrasi_rope_factory/generated/local_keys.g.dart';

class ExpenseListTile extends StatelessWidget {
  const ExpenseListTile({
    super.key,
    required this.expense,
  });
  final ExpenseModel expense;

  @override
  Widget build(BuildContext context) {
    final GlobalKey btnKey = GlobalKey();
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: AppColors.kThirdColor,
          width: 1,
        ),
      ),
      title: Text(
        expense.reference ??
            LocaleKeys.expenses_details_modal_No_Reference.tr(),
        style: AppTextStyles.title20KThirdColorBold,
      ),
      subtitle: Text(
        DateFormat('yyyy-MM-dd').format(expense.expenseDate).toString(),
        style: AppTextStyles.title16White500,
      ),
      trailing: DeleteAndEditMenuButton(
        btnKey: btnKey,
        iconColor: AppColors.kThirdColor,
      ),
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: AppColors.kPrimaryColor,
          builder: (context) {
            return ExpenseDetailsModalBottomSheetBody(expense: expense);
          },
        );
      },
    );
  }
}
