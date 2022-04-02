import 'package:flappwrite_ui/src/auth/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flappwrite_account_kit/flappwrite_account_kit.dart';

class EmailForm extends StatefulWidget {
  final AuthAction? action;
  const EmailForm({Key? key, this.action}) : super(key: key);

  @override
  State<EmailForm> createState() => _EmailFormState();
}

class _EmailFormState extends State<EmailForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        if (widget.action == AuthAction.signUp)
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Email',
            ),
          ),
        TextField(
          controller: _emailController,
          decoration: const InputDecoration(
            labelText: 'Email',
          ),
        ),
        TextField(
          controller: _passwordController,
          obscureText: true,
          decoration: const InputDecoration(
            labelText: 'Password',
          ),
        ),
        ElevatedButton(
          onPressed: () async {
            if (widget.action == AuthAction.signUp) {
              await context.authNotifier.create(
                email: _emailController.text,
                password: _passwordController.text,
                name: _nameController.text,
              );
            } else {
              await context.authNotifier.createSession(
                email: _emailController.text,
                password: _passwordController.text,
              );
            }
          },
          child: widget.action == AuthAction.signUp
              ? const Text("Register")
              : const Text("Login"),
        ),
        if (widget.action != AuthAction.signUp)
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, 'register');
            },
            child: const Text("Register"),
          ),
      ],
    );
  }
}
