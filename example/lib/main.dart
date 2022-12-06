import 'package:flappwrite_ui/flappwrite_ui.dart';
import 'package:flutter/material.dart';
import 'config.dart' as config;

final client = Client();
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  client.setEndpoint(config.endpoint).setProject(config.projectId);
  runApp(AppwriteAuthKit(client: client, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: context.authNotifier.status == AuthStatus.authenticated
          ? const HomeScreen()
          : LoginScreen(
              headerBuilder: (context, action) => Column(
                children: [
                  Text(
                    "Login",
                    style: Theme.of(context).textTheme.displayMedium,
                  )
                ],
              ),
            ),
      routes: {
        "profile": (context) => const ProfileScreen(),
        "register": (context) => const RegisterScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'profile');
            },
            icon: const Icon(Icons.person),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[],
      ),
    );
  }
}
