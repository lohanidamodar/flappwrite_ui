import 'package:flutter/material.dart';

import '../views/login.view.dart';

class LoginScreen extends StatelessWidget {
  final AuthContentBuilder? headerBuilder;
  const LoginScreen({Key? key, this.headerBuilder}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return LoginView(
      headerBuilder: headerBuilder,
    );
  }
}