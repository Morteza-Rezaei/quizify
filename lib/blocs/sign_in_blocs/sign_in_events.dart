abstract class SignInEvent {
  const SignInEvent();
}

class EmailEvent extends SignInEvent {
  final String email;
  EmailEvent(this.email);
}

class PasswordEvent extends SignInEvent {
  final String password;
  PasswordEvent(this.password);
}

class ResetSignInEvent extends SignInEvent {}

class SignInLoadingEvent extends SignInEvent {
  final bool isLoading;
  SignInLoadingEvent(this.isLoading);
}
