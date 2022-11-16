abstract class LoginState {}

class LoginIntial extends LoginState {}

class LoginCarregando extends LoginState {}

class LoginSucesso extends LoginState {}

class LoginFalhou extends LoginState {}

class LoginError extends LoginState {
  String message;

  LoginError(this.message);
}
