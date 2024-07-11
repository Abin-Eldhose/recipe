import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:recipie_app/domain/respositores/auth_repo.dart';

class AuthRepositoryImpl implements AuthRepo {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<User?> signInWithGoogle() async {
    try {
      print('Attempting Google sign-in...');
      final googleUser = await GoogleSignIn().signIn();
      if (googleUser != null) {
        final googleAuth = await googleUser.authentication;

        final creds = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        final userCredential = await _auth.signInWithCredential(creds);
        final user = userCredential.user;

        if (user != null) {
          print('Google sign-in successful: ${user.uid}');
        } else {
          print('Google sign-in failed: user is null');
        }

        return user;
      } else {
        print('Google sign-in canceled by user');
        return null;
      }
    } catch (e) {
      print('Error during Google sign-in: $e');
      return null;
    }
  }
}
