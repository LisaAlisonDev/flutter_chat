import 'package:flutter/material.dart';
import 'package:flutter_chat/pages/login.dart';
import 'package:flutter_chat/pages/welcome.dart';
import 'controllers/auth.controllers.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FireAuth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const WelcomePage();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
