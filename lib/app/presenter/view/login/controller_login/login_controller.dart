import 'package:desafio_apirest/app/data/datasoucer/auth_interface.dart';
import 'package:desafio_apirest/app/presenter/view/login/controller_login/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginController extends Cubit<LoginState> {
  LoginController(this.loginImpl) : super(LoginIntial());

  final IAuthUser loginImpl;

  Future<void> loginUser() async {
    emit(LoginCarregando());

    try {
      await loginImpl.signIn();

      emit(LoginSucesso());
    } catch (e) {
      emit(LoginFalhou());
    }
  }

  Future<void> checkLogin() async {
    emit(LoginCarregando());

    try {
      final isLoggerIn = await loginImpl.isLoggerIn();

      if (isLoggerIn != null) {
        emit(LoginSucesso());
      } else {
        emit(LoginFalhou());
      }
    } catch (e) {
      emit(LoginFalhou());
    }
  }

  Future<void> signOutUse() async {
    emit(LoginCarregando());

    try {
      await loginImpl.signOut();
    } catch (e) {
      emit(LoginFalhou());
    }
  }
}
