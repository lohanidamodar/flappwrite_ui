import 'package:flappwrite_ui/src/auth/utils/enums.dart';
import 'package:flappwrite_ui/src/auth/views/login.view.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginView(
        action: AuthAction.signUp,
      ),
    );
  }
}
