part of 'manufacture_items_cubit.dart';

@immutable
sealed class ManufactureItemsState {}

final class ManufactureItemsInitial extends ManufactureItemsState {}

final class GetManufactureItemsLoading extends ManufactureItemsState {}

final class GetManufactureItemsSuccess extends ManufactureItemsState {}

final class GetManufactureItemsFailure extends ManufactureItemsState {
  final String message;
  GetManufactureItemsFailure({required this.message});
}


final class DeleteManufactureItemSuccess extends ManufactureItemsState {}
final class DeleteManufactureItemLoading extends ManufactureItemsState {}
final class DeleteManufactureItemFailure extends ManufactureItemsState {
  final String message;
  DeleteManufactureItemFailure({required this.message});
}