part of 'add_product_cubit.dart';

@immutable
sealed class AddProductState {}

final class AddProductInitial extends AddProductState {}

final class AddProductSuccess extends AddProductState {}

final class AddProductLoading extends AddProductState {}

final class AddProductFailure extends AddProductState {
  final String message;
  AddProductFailure({required this.message});
}
// select unit
final class SelectUnit extends AddProductState {}
// select category
final class SelectCategory extends AddProductState {}
// update profit
final class UpdateProfit extends AddProductState {}
// change is manufacturer
final class ChangeIsManufacturer extends AddProductState {}

// pick image
final class PickProductImageSuccess extends AddProductState {}

final class PickProductImageFailure extends AddProductState {
  final String message;
  PickProductImageFailure({required this.message});
}

