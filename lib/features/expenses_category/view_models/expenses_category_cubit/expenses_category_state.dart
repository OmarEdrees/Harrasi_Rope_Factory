part of 'expenses_category_cubit.dart';

@immutable
sealed class ExpensesCategoriesState {}

final class ExpensesCategoriesInitial extends ExpensesCategoriesState {}

final class GetExpensesCategoriesLoading extends ExpensesCategoriesState {}

final class GetExpensesCategoriesSuccess extends ExpensesCategoriesState {}

final class GetExpensesCategoriesFailure extends ExpensesCategoriesState {
  final String message;
  GetExpensesCategoriesFailure({required this.message});
}

final class EmptyExpensesCategories extends ExpensesCategoriesState {}
//
final class DeleteExpensesCategoryLoading extends ExpensesCategoriesState {}

final class DeleteExpensesCategorySuccess extends ExpensesCategoriesState {}

final class DeleteExpensesCategoryFailure extends ExpensesCategoriesState {
  final String message;
  DeleteExpensesCategoryFailure({required this.message});
}