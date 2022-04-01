import 'package:flutter/material.dart';
import 'package:flappwrite_account_kit/flappwrite_account_kit.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          Text(context.authNotifier.user?.name ?? 'Anonymous User'),
          Text(context.authNotifier.user?.email ?? 'No Email'),
          ElevatedButton(
              onPressed: () async {
                await context.authNotifier.deleteSession(sessionId: 'current');
                Navigator.pop(context);
              },
              child: const Text("Logout"))
        ],
      ),
    );
  }
}
