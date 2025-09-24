part of 'edit_expense_cubit.dart';

@immutable
sealed class EditExpenseState {}

final class EditExpenseInitial extends EditExpenseState {}

final class EditExpenseLoading extends EditExpenseState {}

final class EditExpenseSuccess extends EditExpenseState {}

final class EditExpenseFailure extends EditExpenseState {
  final String message;
  EditExpenseFailure({required this.message});
}

final class EditExpenseNoChanges extends EditExpenseState {}

final class ChangeExpenseDate extends EditExpenseState {}