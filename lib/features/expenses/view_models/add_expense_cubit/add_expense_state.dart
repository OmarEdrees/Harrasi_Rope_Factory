part of 'add_expense_cubit.dart';

@immutable
sealed class AddExpenseState {}

final class AddExpenseInitial extends AddExpenseState {}

final class AddExpenseLoading extends AddExpenseState {}

final class AddExpenseSuccess extends AddExpenseState {}

final class AddExpenseFailure extends AddExpenseState {
  final String message;
  AddExpenseFailure({required this.message});
}

//

final class SelectExpenseDate extends AddExpenseState {}

final class SelectPaymentMethod extends AddExpenseState {}

final class SelectExpenseCategory extends AddExpenseState {}
//
final class GetExpensesCategoriesLoading extends AddExpenseState {}

final class GetExpensesCategoriesSuccess extends AddExpenseState {}

final class GetExpensesCategoriesFailure extends AddExpenseState {
  final String message;
  GetExpensesCategoriesFailure({required this.message});
}
