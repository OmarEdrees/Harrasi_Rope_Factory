import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/app/my_app.dart';
import 'package:harrasi_rope_factory/core/di/dependancy_injection.dart';
import 'package:harrasi_rope_factory/core/network/supabase/auth/sign_in_with_google.dart';
import 'package:harrasi_rope_factory/core/network/supabase/auth/sign_in_with_password.dart';
import 'package:meta/meta.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  //// Methods
  /// Sign Up Method
  signIn() async {
    if (formKey.currentState!.validate()) {
      try {
        emit(SignInLoading());
        FocusScope.of(navigatorKey.currentContext!).unfocus();
        await signInWithPassword(
            email: emailController.text, password: passwordController.text);
        emit(SignInSuccess());
      } on Exception catch (e) {
        emit(SignInFailure(message: e.toString()));
      }
    }
  }

  // sign in with google
  signInWithGoogle() async {
    try {
      emit(SignInWithGoogleLoading());
      await getIt<GoogleAuthService>().signWithGoogle();
      emit(SignInWithGoogleSuccess());
    } on Exception catch (e) {
      log(e.toString());
      emit(SignInWithGoogleFailure(message: e.toString()));
    }
  }

  // Dispose Controllers
  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
