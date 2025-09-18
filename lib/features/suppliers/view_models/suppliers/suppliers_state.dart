part of 'suppliers_cubit.dart';

@immutable
sealed class SuppliersState {}

final class SuppliersInitial extends SuppliersState {}

final class GetSuppliersLoading extends SuppliersState {}

final class GetSuppliersSuccess extends SuppliersState {}

final class GetSuppliersFailure extends SuppliersState {
  final String message;
  GetSuppliersFailure({required this.message});
}

final class EmptySuppliers extends SuppliersState {}
