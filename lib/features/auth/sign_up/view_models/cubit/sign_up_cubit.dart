import 'dart:developer';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/app/my_app.dart';
import 'package:harrasi_rope_factory/core/di/dependancy_injection.dart';
import 'package:harrasi_rope_factory/core/helper/pick_image.dart';
import 'package:harrasi_rope_factory/core/network/supabase/auth/sign_in_with_google.dart';
import 'package:harrasi_rope_factory/core/network/supabase/auth/sign_up_with_password.dart';
import 'package:harrasi_rope_factory/core/network/supabase/database/add_data.dart';
import 'package:harrasi_rope_factory/core/network/supabase/storage/upload_file.dart';
import 'package:harrasi_rope_factory/generated/local_keys.g.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  // Controllers && Keys && Variables
  final userNameController = TextEditingController();
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  File? image;
  //// Methods
  /// Sign Up Method
  signUp() async {
    if (formKey.currentState!.validate()) {
      if (image == null) {
        emit(PickImageFailure(
            errorMessage: LocaleKeys.auth_sign_up_cubit_signUp.tr()));
        return;
      }
      try {
        emit(SignUpLoading());
        FocusScope.of(navigatorKey.currentContext!).unfocus();
        await signUpWithPassword(
            email: emailController.text, password: passwordController.text);
        await addData(tableName: "users", data: {
          "full_name": fullNameController.text,
          "username": userNameController.text,
          "email": emailController.text,
          "image": await uploadFileToSupabaseStorage(file: image!)
        });
        emit(SignUpSuccess());
      } on Exception catch (e) {
        log(e.toString());
        emit(SignUpFailure(errorMessage: e.toString()));
      }
    }
  }

  // pick Image Method
  pickProfileImage() {
    pickImage(source: ImageSource.gallery).then((value) {
      if (value != null) {
        image = value;
        emit(PickImageSuccess());
      } else {
        emit(PickImageFailure(
            errorMessage: LocaleKeys.auth_sign_up_cubit_pickProfileImage.tr()));
      }
    });
  }

  // sign in with google
  signUpWithGoogle() async {
    try {
      emit(SignUpLoading());
      await getIt<GoogleAuthService>().signWithGoogle();
      emit(SignUpSuccess());
    } on Exception catch (e) {
      log(e.toString());
      emit(SignUpFailure(errorMessage: e.toString()));
    }
  }

  // Dispose Controllers
  @override
  Future<void> close() {
    // TODO: implement close
    userNameController.dispose();
    fullNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
