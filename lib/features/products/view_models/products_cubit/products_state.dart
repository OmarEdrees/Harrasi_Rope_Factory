part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}
final class GetProductsLoading extends ProductsState {}
final class GetProductsEmpty extends ProductsState {}
final class GetProductsSuccess extends ProductsState {}
final class GetProductsFailure extends ProductsState {
  final String message;
  GetProductsFailure({required this.message});
}
// get categories
final class GetCategoriesSuccess extends ProductsState {}

final class GetCategoriesFailure extends ProductsState {
  final String message;
  GetCategoriesFailure({required this.message});
}

final class GetCategoriesLoading extends ProductsState {}
final class EmptyCategories extends ProductsState {}