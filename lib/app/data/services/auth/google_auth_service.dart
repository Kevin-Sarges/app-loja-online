import 'package:desafio_apirest/app/data/datasoucer/auth_interface.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthService implements IAuthUser {
  final googleSignIn = GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

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
    final GoogleSignInAccount? _googleSignUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication? _googleAuth =
        await _googleSignUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: _googleAuth?.accessToken,
      idToken: _googleAuth?.idToken,
    );

    User? firebaseUser =
        (await firebaseAuth.signInWithCredential(credential)).user;

    return firebaseUser;
  }

  @override
  Future<void> signOut() async {
    await googleSignIn.signOut();
  }
}
