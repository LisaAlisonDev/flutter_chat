import 'package:flutter_chat/models/response.dart';

import '../models/user.dart';

abstract class UserRepository {
  Future<Response> logIn(AppUser user);
  Future<Response> register(AppUser user);
  Future<void> signOut();
}