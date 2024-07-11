import 'package:firebase_auth/firebase_auth.dart';
import 'package:recipie_app/data/repositories/auth_repo._imply.dart';
import 'package:recipie_app/domain/respositores/auth_repo.dart';

class AuthUsecase {
  AuthRepo repo = AuthRepositoryImpl();

  Future<User?> getUser() async {
    final user = await repo.signInWithGoogle();
    return user;
  }
}
