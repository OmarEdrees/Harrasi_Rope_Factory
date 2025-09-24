import 'package:custom_quick_alert/custom_quick_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harrasi_rope_factory/core/components/custom_elevated_button.dart';
import 'package:harrasi_rope_factory/core/components/custom_text_form_field_with_title.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/core/utilies/extensions/app_extensions.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/features/expenses/models/expense_model.dart';
import 'package:harrasi_rope_factory/features/categories/views/widgets/custom_circular_progress_indecator.dart';
import 'package:harrasi_rope_factory/features/expenses/view_models/edit_expense_cubit/edit_expense_cubit.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/custom_title.dart';

class EditExpenseModalBottomSheetBody extends StatelessWidget {
  final ExpenseModel expenseModel;
  const EditExpenseModalBottomSheetBody({super.key, required this.expenseModel});

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditExpenseCubit, EditExpenseState>(
      listener: (context, state) {
        if (state is EditExpenseSuccess) {
          context.popScreen();
          CustomQuickAlert.success(
            title: "Success",
            message: "Expense updated successfully",
            animationType: CustomQuickAlertAnimationType.scale,
          );
        }
        if (state is EditExpenseFailure) {
          CustomQuickAlert.error(
            title: "Error",
            message: state.message,
            animationType: CustomQuickAlertAnimationType.slideInDown,
          );
        }
        if (state is EditExpenseNoChanges) {
          CustomQuickAlert.warning(
            title: "No Changes",
            message: "No updates were made",
            animationType: CustomQuickAlertAnimationType.scale,
          );
        }
      },
      child: DraggableScrollableSheet(
        expand: true,
        initialChildSize: 0.9,
        minChildSize: 0.9,
        maxChildSize: 0.9,
        builder: (context, scrollController) {
          final cubit = context.read<EditExpenseCubit>();
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Center(
              child: SingleChildScrollView(
                controller: scrollController,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.width * 0.03,
                    vertical: SizeConfig.height * 0.01,
                  ),
                  child: Form(
                    key: cubit.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomTitle(title: "Update Expense"),
                        SizedBox(height: SizeConfig.height * 0.05),
                        // amount
                        CustomTextFormFieldWithTitle(
                          hintText: "Enter amount",
                          title: "Amount",
                          controller: cubit.amountController,
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(height: SizeConfig.height * 0.01),
                        // payment method
                        CustomTextFormFieldWithTitle(
                          hintText: "Enter payment method",
                          title: "Payment Method",
                          controller: cubit.paymentMethodController,
                        ),
                        SizedBox(height: SizeConfig.height * 0.01),
                        // reference
                        CustomTextFormFieldWithTitle(
                          hintText: "Enter reference",
                          title: "Reference",
                          controller: cubit.referenceController,
                        ),
                        SizedBox(height: SizeConfig.height * 0.01),

                        // notes
                        CustomTextFormFieldWithTitle(
                          hintText: "Enter notes",
                          title: "Notes",
                          controller: cubit.notesController,
                          maxLines: 3,
                        ),
                        SizedBox(height: SizeConfig.height * 0.01),

                        // date picker
                        BlocBuilder<EditExpenseCubit, EditExpenseState>(
                          buildWhen: (prev, curr) => curr is ChangeExpenseDate,
                          builder: (context, state) {
                            return ListTile(
                              title: Text("Expense Date"),
                              subtitle: Text(
                                cubit.selectedDate.toString().split(' ')[0],
                              ),
                              trailing: Icon(Icons.calendar_today,
                                  color: AppColors.kThirdColor),
                              onTap: () async {
                                final picked = await showDatePicker(
                                  context: context,
                                  initialDate: cubit.selectedDate,
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2100),
                                );
                                if (picked != null) cubit.changeDate(picked);
                              },
                            );
                          },
                        ),
                        SizedBox(height: SizeConfig.height * 0.05),
                        // button
                        BlocBuilder<EditExpenseCubit, EditExpenseState>(
                          buildWhen: (prev, curr) =>
                              curr is EditExpenseLoading ||
                              prev is EditExpenseLoading,
                          builder: (context, state) {
                            return state is EditExpenseLoading
                                ? CustomCircularProgresIndecator()
                                : CustomElevatedButton(
                                    onPressed: () {
                                      cubit.editExpense();
                                    },
                                    name: "Update",
                                  );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
