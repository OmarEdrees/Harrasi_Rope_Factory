part of 'edit_category_cubit.dart';

@immutable
sealed class EditCategoryState {}


class EditCategoryInitial extends EditCategoryState {}

class EditCategoryLoading extends EditCategoryState {}

class EditCategorySuccess extends EditCategoryState {}

class EditCategoryFailure extends EditCategoryState {
  final String message;
  EditCategoryFailure({required this.message});
}
class ChangeActive extends EditCategoryState {}
class EditCategoryNoChanges extends EditCategoryState {}