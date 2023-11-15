import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_chat/pages/login.dart';
import 'package:flutter_chat/pages/register.dart';
import 'package:flutter_chat/values/app_routes.dart';
import 'package:flutter_chat/widget.tree.dart';
import 'conf/firebase_options.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'SpaceMono',
      ),
      routes: {
        AppRoutes.loginScreen: (context) => const LoginPage(),
        AppRoutes.registerScreen: (context) => const RegisterPage(),
      },
      home: const WidgetTree(),
    );
  }
}
