part of 'purchases_cubit.dart';

@immutable
sealed class PurchasesState {}

final class PurchasesInitial extends PurchasesState {}

final class GetPurchasesLoading extends PurchasesState {}

final class GetPurchasesSuccess extends PurchasesState {}

final class GetPurchasesFailure extends PurchasesState {
  final String message;
  GetPurchasesFailure({required this.message});
}

final class EmptyPurchases extends PurchasesState {}
