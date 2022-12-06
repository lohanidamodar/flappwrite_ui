import 'package:flappwrite_ui/src/auth/utils/enums.dart';
import 'package:flappwrite_ui/src/auth/widgets/email_form.widget.dart';
import 'package:flutter/material.dart';

typedef AuthContentBuilder = Widget Function(
    BuildContext context, AuthAction action);

class LoginView extends StatelessWidget {
  final AuthAction? action;
  final AuthContentBuilder? headerBuilder;
  const LoginView({Key? key, this.action, this.headerBuilder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if(headerBuilder != null) headerBuilder!(context, action ?? AuthAction.signIn),
            Expanded(
              child: EmailForm(
                action: action,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
