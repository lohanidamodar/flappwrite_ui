import 'package:appwrite_auth_kit/appwrite_auth_kit.dart';
import 'package:flappwrite_ui/src/auth/utils/enums.dart';
import 'package:flutter/material.dart';

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
              labelText: 'Name',
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
            bool success = false;
            if (widget.action == AuthAction.signUp) {
              final user = await context.authNotifier.create(
                email: _emailController.text,
                password: _passwordController.text,
                name: _nameController.text,
              );
              if (user != null) {
                success = true;
              }
            } else {
              success = await context.authNotifier.createEmailSession(
                email: _emailController.text,
                password: _passwordController.text,
              );
            }
            if (!success) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                    context.authNotifier.error ?? 'Unknown error occurred'),
              ));
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
