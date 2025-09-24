part of 'edit_product_cubit.dart';

@immutable
sealed class EditProductState {}

final class EditProductInitial extends EditProductState {}
final class EditProductLoading extends EditProductState {}
final class EditProductSuccess extends EditProductState {}
final class EditProductFailure extends EditProductState {
  final String message;
  EditProductFailure({required this.message});
}
final class EditProductNoChanges extends EditProductState {}
final class ChangeManufactured extends EditProductState {}