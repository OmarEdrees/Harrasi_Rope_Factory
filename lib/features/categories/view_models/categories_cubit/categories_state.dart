part of 'categories_cubit.dart';

@immutable
sealed class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}
final class GetCategoriesLoading extends CategoriesState {}
final class GetCategoriesSuccess extends CategoriesState {}
final class GetCategoriesFailure extends CategoriesState {
  final String message;
  GetCategoriesFailure({required this.message});
}
final class EmptyCategories extends CategoriesState {}
// delete state
final class DeleteCategoryLoading extends CategoriesState {}
final class DeleteCategorySuccess extends CategoriesState {}
final class DeleteCategoryFailure extends CategoriesState {
  final String message;
  DeleteCategoryFailure({required this.message});
}