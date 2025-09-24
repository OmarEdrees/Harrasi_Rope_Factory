import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/core/di/dependancy_injection.dart';
import 'package:harrasi_rope_factory/features/expenses/models/expense_model.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'edit_expense_state.dart';

class EditExpenseCubit extends Cubit<EditExpenseState> {
  EditExpenseCubit({required this.expense}) : super(EditExpenseInitial()) {
    initData();
  }

  final ExpenseModel expense;

  final formKey = GlobalKey<FormState>();
  final amountController = TextEditingController();
  final paymentMethodController = TextEditingController();
  final referenceController = TextEditingController();
  final notesController = TextEditingController();

  DateTime selectedDate = DateTime.now();

  // init data
  void initData() {
    amountController.text = expense.amount.toString();
    paymentMethodController.text = expense.paymentMethod;
    referenceController.text = expense.reference ?? '';
    notesController.text = expense.notes ?? '';
    selectedDate = expense.expenseDate;
  }

  // change date
  void changeDate(DateTime date) {
    selectedDate = date;
    emit(ChangeExpenseDate());
  }

  Future<void> editExpense() async {
    if (formKey.currentState!.validate()) {
      final updated = expense.copyWith(
        amount: double.tryParse(amountController.text) ?? expense.amount,
        paymentMethod: paymentMethodController.text,
        reference: referenceController.text.isEmpty ? null : referenceController.text,
        notes: notesController.text.isEmpty ? null : notesController.text,
        expenseDate: selectedDate,
        updatedAt: DateTime.now(),
      );

      if (updated.toJson().toString() != expense.toJson().toString()) {
        try {
          emit(EditExpenseLoading());
          await getIt<SupabaseClient>()
              .from('expenses')
              .update(updated.toJson())
              .eq('id', expense.id);

          emit(EditExpenseSuccess());
        } on Exception catch (e) {
          emit(EditExpenseFailure(message: e.toString()));
        }
      } else {
        emit(EditExpenseNoChanges());
      }
    }
  }
}