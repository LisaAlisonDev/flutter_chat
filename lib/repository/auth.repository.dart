import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_chat/abstracts/auth.repository.abstract.dart';
import 'package:flutter_chat/models/response.dart';
import '../models/user.dart';


class AuthRepository implements AuthRepositoryAbstract {
  final FirebaseAuth _auth;
  const AuthRepository(this._auth);

  User? get currentUser => _auth.currentUser;
  Stream<User?> get authStateChanges => _auth.authStateChanges();


  @override
  Future<Response> logIn(AppUser user) async {
    try {
      final request = await _auth.signInWithEmailAndPassword(
          email: user.email, password: user.password);
      return Response(request, null);
    } on FirebaseAuthException catch (e) {
      print('Failed with error code: ${e.code}');
      print(e.message);
      return Response({}, "Une erreur est survenue.");
    }
  }

  @override
  Future<Response> register(AppUser user) async {
    try {
     final response =  await _auth.createUserWithEmailAndPassword(
          email: user.email, password: user.password);
     return Response(response, null);
    } on FirebaseAuthException catch (e) {
      print('Failed with error code: ${e.code}');
      print(e.message);
      return Response({}, "Une erreur est survenue.");
    }
  }

  @override
  Future<void> signOut() => _auth.signOut();
}

