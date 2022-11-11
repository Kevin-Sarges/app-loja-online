abstract class LoginState {}

class LoginIntial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSucess extends LoginState {}

class LoginLoginFail extends LoginState {}

class LoginError extends LoginState {
  String message;

  LoginError(this.message);
}
