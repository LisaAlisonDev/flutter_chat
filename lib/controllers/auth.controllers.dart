import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_chat/models/response.dart';

class FireAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? get currentUser => _firebaseAuth.currentUser;
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<Response> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final request = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Response(request, null);
    } on FirebaseAuthException catch (e) {
      print('Failed with error code: ${e.code}');
      print(e.message);
      return Response({}, "Une erreur est survenue.");
    }
  }

  Future<Response> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final request = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Response(request, null);
      // Use the result
    } on FirebaseAuthException catch (e) {
      print('Failed with error code: ${e.code}');
      print(e.message);
      return Response({}, "Une erreur est survenue.");
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
