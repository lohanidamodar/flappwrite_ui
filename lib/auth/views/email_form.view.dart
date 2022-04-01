import 'package:flutter/material.dart';
import 'package:flappwrite_account_kit/flappwrite_account_kit.dart';

class EmailForm extends StatefulWidget {
  const EmailForm({Key? key}) : super(key: key);

  @override
  State<EmailForm> createState() => _EmailFormState();
}

class _EmailFormState extends State<EmailForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
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
          onPressed: () {
            debugPrint('Email: ${_emailController.text}');
            debugPrint('Password: ${_passwordController.text}');
            context.authNotifier.createSession(
              email: _emailController.text,
              password: _passwordController.text,
            );
          },
          child: const Text("Login"),
        ),
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
