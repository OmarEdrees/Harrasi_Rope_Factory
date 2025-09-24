part of 'edit_customer_cubit.dart';

@immutable
sealed class EditCustomerState {}

final class EditCustomerInitial extends EditCustomerState {}

final class EditCustomerLoading extends EditCustomerState {}

final class EditCustomerSuccess extends EditCustomerState {}

final class EditCustomerFailure extends EditCustomerState {
  final String message;
  EditCustomerFailure({required this.message});
}

final class EditCustomerNoChanges extends EditCustomerState {}