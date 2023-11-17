import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_chat/pages/login.dart';
import 'package:flutter_chat/pages/welcome.dart';
import 'package:flutter_chat/repository/auth.repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'conf/firebase_options.dart';
import 'package:flutter/material.dart';

import 'controllers/auth.controllers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  MyApp({super.key});

  final authRepositoryProvider = Provider<AuthRepository>((ref) {
    final auth = ref.watch(appAuthProvider);
    return auth;
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'SpaceMono',
        ),
        home: Consumer(
          builder: (context, ref, child) {
            final Stream<User?> authChange = ref.watch(authRepositoryProvider)
                .authStateChanges;
            return StreamBuilder(
                stream: authChange,
                builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const WelcomePage();
              } else {
                return const LoginPage();
              }
            },
            );
          },
        ));
  }
}
