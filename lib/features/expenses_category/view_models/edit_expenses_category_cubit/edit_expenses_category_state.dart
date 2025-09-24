part of 'edit_expenses_category_cubit.dart';

@immutable
sealed class EditExpensesCategoryState {}

final class EditExpensesCategoryInitial extends EditExpensesCategoryState {}

final class EditExpensesCategoryLoading extends EditExpensesCategoryState {}

final class EditExpensesCategorySuccess extends EditExpensesCategoryState {}

final class EditExpensesCategoryFailure extends EditExpensesCategoryState {
  final String message;
  EditExpensesCategoryFailure({required this.message});
}

final class EditExpensesCategoryNoChanges extends EditExpensesCategoryState {}
