part of 'add_categories_cubit.dart';

@immutable
sealed class AddCategoriesState {}

final class AddCategoriesInitial extends AddCategoriesState {}
final class AddCategoriesSuccess extends AddCategoriesState {}
final class AddCategoriesLoading extends AddCategoriesState {}
final class AddCategoriesFailure extends AddCategoriesState {
  final String message;
  AddCategoriesFailure({required this.message});
}
