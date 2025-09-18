import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/features/auth/sign_in/views/widgets/sign_in_screen_body.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignInScreenBody(),
    );
  }
}

