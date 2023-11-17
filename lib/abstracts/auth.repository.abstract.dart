import 'package:flutter_chat/models/response.dart';

import '../models/user.dart';

abstract class AuthRepositoryAbstract{
  Future<Response> logIn(AppUser user);
  Future<Response> register(AppUser user);
  Future<void> signOut();
}