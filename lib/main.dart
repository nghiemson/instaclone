import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:instaclone/state/auth/backend/authenticator.dart';
import 'firebase_options.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blueGrey,
        indicatorColor: Colors.blueGrey,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () async {
              final res = await Authenticator().loginWithGoogle();
              print(res);
            },
            child: const Text('Sign In with Google'),
          ),
          TextButton(
            onPressed: () async {
              final res = await Authenticator().loginWithFB();
              print(res);
            },
            child: const Text('Sign In with Facebook'),
          )
        ],
      ),
    );
  }
}
