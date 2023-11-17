import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_chat/models/response.dart';
import 'package:flutter_chat/models/user.dart';
import 'package:flutter_chat/repository/auth.repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


final appAuthProvider = Provider<AuthRepository>(
      (ref) => AuthController().authRepository
);

class AuthController {
  final AuthRepository authRepository = AuthRepository(FirebaseAuth.instance);

  Future<Response?> logIn(AppUser user) async {
    try {
      final request = await authRepository.logIn(user);
      return request;
    } catch (e) {
      print('Failed with error code: ${e}');
      return Response({}, "Une erreur est survenue.");
    }
  }

  Future<Response> register(AppUser user) async {
    try {
      final request = await authRepository.register(user);
      return request;
      // Use the result
    } catch (e) {
      print('Failed with error code: ${e}');
      return Response({}, "Une erreur est survenue.");
    }
  }

  Future<void> signOut() async {
    await authRepository.signOut();
  }
}
