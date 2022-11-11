import 'package:desafio_apirest/app/data/datasoucer/auth_interface.dart';
import 'package:desafio_apirest/app/presenter/view/login/controller_login/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginController extends Cubit<LoginState> {
  LoginController(this.loginImpl) : super(LoginIntial());

  final IAuthUser loginImpl;

  Future<void> loginUser() async {
    emit(LoginLoading());

    try {
      await loginImpl.signIn();
    } catch (e) {
      emit(LoginError('Erro no login !!'));
    }
  }

  Future<void> checkLogin() async {
    emit(LoginLoading());

    try {
      final isLoggerIn = await loginImpl.isLoggerIn();

      if (isLoggerIn != null) {
        isLoggerIn.displayName;

        emit(LoginSucess());
      } else {
        emit(LoginLoginFail());
      }
    } catch (e) {
      emit(LoginError('Erro no login !!'));
    }
  }

  Future<void> signOutUse() async {
    emit(LoginLoading());

    try {
      await loginImpl.signOut();
    } catch (e) {
      emit(LoginError('Erro ao tentar sair do app'));
    }
  }
}
