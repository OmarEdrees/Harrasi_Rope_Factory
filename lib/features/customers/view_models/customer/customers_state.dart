part of 'customers_cubit.dart';

@immutable
sealed class CustomersState {}

final class CustomersInitial extends CustomersState {}

final class GetCustomersLoading extends CustomersState {}

final class GetCustomersSuccess extends CustomersState {}

final class GetCustomersFailure extends CustomersState {
  final String message;
  GetCustomersFailure({required this.message});
}

final class EmptyCustomers extends CustomersState {}

//delete customer
final class DeleteCustomerLoading extends CustomersState {}

final class DeleteCustomerSuccess extends CustomersState {}

final class DeleteCustomerFailure extends CustomersState {
  final String message;
  DeleteCustomerFailure({required this.message});
}
