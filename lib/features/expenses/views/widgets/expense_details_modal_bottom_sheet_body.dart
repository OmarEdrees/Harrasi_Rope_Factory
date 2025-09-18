import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/features/customers/views/widgets/details_list_tile.dart';
import 'package:harrasi_rope_factory/features/expenses/models/expense_model.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/custom_title.dart';
import 'package:harrasi_rope_factory/generated/local_keys.g.dart';

class ExpenseDetailsModalBottomSheetBody extends StatelessWidget {
  const ExpenseDetailsModalBottomSheetBody({super.key, required this.expense});
  final ExpenseModel expense;
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: true,
      initialChildSize: 0.93,
      maxChildSize: 0.93,
      minChildSize: 0.93,
      shouldCloseOnMinExtent: true,
      builder: (context, scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.width * 0.03,
              vertical: SizeConfig.height * 0.02,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: CustomTitle(
                        title: LocaleKeys
                            .expenses_details_modal_customTitle_title
                            .tr())),
                SizedBox(height: SizeConfig.height * 0.03),
                DetailsListTile(
                  title: LocaleKeys.expenses_details_modal_Reference.tr(),
                  value: expense.reference ??
                      LocaleKeys.expenses_details_modal_No_Reference.tr(),
                  icon: Icons.numbers, // Material Icon
                ),
                DetailsListTile(
                  title: LocaleKeys.expenses_add_expense_Date.tr(),
                  value: DateFormat('yyyy-MM-dd')
                      .format(expense.expenseDate)
                      .toString(),
                  icon: CupertinoIcons.calendar, // Cupertino Icon
                ),
                DetailsListTile(
                  title: LocaleKeys.expenses_add_expense_Amount.tr(),
                  value: expense.amount.toString(),
                  icon: FontAwesomeIcons.dollarSign, // FontAwesome Icon
                ),
                DetailsListTile(
                  title: LocaleKeys.expenses_add_expense_Payment_Method.tr(),
                  value: expense.paymentMethod,
                  icon: FontAwesomeIcons.wallet,
                ),
                DetailsListTile(
                  title: LocaleKeys.suppliers_details_modal_Created_At.tr(),
                  value: DateFormat('yyyy-MM-dd')
                      .format(expense.createdAt)
                      .toString(),
                  icon: CupertinoIcons.time,
                ),
                DetailsListTile(
                  title: LocaleKeys.suppliers_details_modal_Updated_At.tr(),
                  value: DateFormat('yyyy-MM-dd')
                      .format(expense.updatedAt)
                      .toString(),
                  icon: CupertinoIcons.refresh,
                ),
                DetailsListTile(
                  title: LocaleKeys.suppliers_details_modal_Notes.tr(),
                  value: expense.notes ??
                      LocaleKeys.suppliers_details_modal_Notes.tr(),
                  icon: Icons.note, // Material Icon
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
