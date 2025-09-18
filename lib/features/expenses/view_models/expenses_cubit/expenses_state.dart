part of 'expenses_cubit.dart';

@immutable
sealed class ExpensesState {}

final class ExpensesInitial extends ExpensesState {}

final class GetExpensesLoading extends ExpensesState {}

final class GetExpensesSuccess extends ExpensesState {}

final class GetExpensesFailure extends ExpensesState {
  final String message;
  GetExpensesFailure({required this.message});
}
