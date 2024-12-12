abstract class AuthState {}

class AuthInitialState extends AuthState {}

class RegisterLeadinglState extends AuthState {}

class RegisterSeccuceState extends AuthState {}

class RegisterErrorState extends AuthState {
  final String message;

  RegisterErrorState({required this.message});
}

class LoginLeadinglState extends AuthState {}

class LoginSeccuceState extends AuthState {}

class LoginErrorState extends AuthState {
  final String message;

  LoginErrorState({required this.message});
}
