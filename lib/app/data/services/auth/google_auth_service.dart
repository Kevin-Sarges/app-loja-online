import 'package:desafio_apirest/app/data/datasoucer/auth_interface.dart';
import 'package:desafio_apirest/app/domain/error/error.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthService implements IAuthUser {
  final googleSignIn = GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instanceFor(
    app: Firebase.app(),
    persistence: Persistence.NONE,
  );

  @override
  Future<User?> isLoggerIn() async {
    User? userIsLoggerIn;

    firebaseAuth.authStateChanges().listen((user) {
      userIsLoggerIn = user;
    });

    return userIsLoggerIn;
  }

  @override
  Future<Object?> signIn() async {
    try {
      final GoogleSignInAccount? _googleSignUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication? _googleAuth =
          await _googleSignUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: _googleAuth?.accessToken,
        idToken: _googleAuth?.idToken,
      );

      await firebaseAuth.setPersistence(Persistence.LOCAL);
      User? firebaseUser =
          (await firebaseAuth.signInWithCredential(credential)).user;

      return firebaseUser;
    } catch (e) {
      return ErrorMessage('Erro: $e');
    }
  }

  @override
  Future<void> signOut() async {
    await googleSignIn.signOut();
  }
}
