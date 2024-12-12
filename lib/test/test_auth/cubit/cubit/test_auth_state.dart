abstract class TestAuthState {}

class TestAuthInitial extends TestAuthState {}

class TestRegisterSuccsess extends TestAuthState {}

class TestRegisterLeading extends TestAuthState {}

class TestRegisterError extends TestAuthState {
  final String message;
  TestRegisterError({
    required this.message,
  });
}

class TestLoginSuccsess extends TestAuthState {}

class TestLoginLeading extends TestAuthState {}

class TestLoginError extends TestAuthState {
  final String message;
  TestLoginError({
    required this.message,
  });
}
