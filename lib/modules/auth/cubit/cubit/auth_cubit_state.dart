abstract class AuthState {}

class AuthInitialState extends AuthState {}

class RegisterLeadinglState extends AuthState {}

class RegisterSeccuceState extends AuthState {}

class RegisterErrorState extends AuthState {
  final String message;

  RegisterErrorState({required this.message});
}
