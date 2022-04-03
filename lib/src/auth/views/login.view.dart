import 'package:flappwrite_ui/src/auth/utils/enums.dart';
import 'package:flappwrite_ui/src/auth/widgets/email_form.widget.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  final AuthAction? action;
  const LoginView({Key? key, this.action}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: EmailForm(
          action: action,
        ),
      ),
    );
  }
}
