import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:recipie_app/domain/usecases/auth_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<SignInReqestEvent>(_signInRequested);
  }

  void _signInRequested(
      SignInReqestEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await AuthUsecase().getUser();
      if (user != null) {
        print('User authenticated successfully: ${user.uid}');
        emit(AuthLoaded(user: user));
      } else {
        print('User authentication failed: user is null');
        emit(AuthError(errorMessage: "User not authenticated"));
      }
    } catch (e) {
      print('Error during authentication: $e');
      emit(AuthError(errorMessage: e.toString()));
    }
  }
}
