part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpLoading extends SignUpState {}

final class SignUpSuccess extends SignUpState {}

final class SignUpFailure extends SignUpState {
  final String errorMessage;
  SignUpFailure({required this.errorMessage});
}

// pick image
final class PickImageLoading extends SignUpState {}

final class PickImageSuccess extends SignUpState {}

final class PickImageFailure extends SignUpState {
  final String errorMessage;
  PickImageFailure({required this.errorMessage});
}

final class SelectImage extends SignUpState {}
