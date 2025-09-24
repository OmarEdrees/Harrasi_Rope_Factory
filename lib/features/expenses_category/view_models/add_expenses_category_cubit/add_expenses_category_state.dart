part of 'add_expenses_category_cubit.dart';

@immutable
sealed class AddExpensesCategoryState {}

final class AddExpensesCategoryInitial extends AddExpensesCategoryState {}
final class AddExpensesCategoryLoading extends AddExpensesCategoryState {}
final class AddExpensesCategorySuccess extends AddExpensesCategoryState {}
final class AddExpensesCategoryFailure extends AddExpensesCategoryState {
  final String message;
  AddExpensesCategoryFailure({required this.message});
}
