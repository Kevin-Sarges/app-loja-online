import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthUser {
  Future<User?> isLoggerIn();
  Future<Object?> signIn();
  Future<void> signOut();
}
