import 'package:flutter/material.dart';
import 'package:flutter_chat/utils/extensions.dart';

import '../controllers/auth.controllers.dart';
import '../widget.tree.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    final size = context.mediaQuerySize;

    return Scaffold(
        body: Container(
            padding: const EdgeInsets.all(20),
            height: size.height * 0.24,
            child: Column(
              children: [
                const Text("You are connected"),
                FilledButton(
                  onPressed:  ()  async {
                    await FireAuth().signOut();
                    if (!mounted) return;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WidgetTree()),
                    );
                  },
                  child: const Text(
                    'Se déconnecter',
                    textAlign: TextAlign.center,
                  ),
                ),

              ],
            ) ));
  }
}
