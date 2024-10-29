abstract class SignUpEvent {
  const SignUpEvent();
}

class UserNameEvent extends SignUpEvent {
  final String userName;
  UserNameEvent(this.userName);
}

class EmailEvent extends SignUpEvent {
  final String email;
  EmailEvent(this.email);
}

class PasswordEvent extends SignUpEvent {
  final String password;
  PasswordEvent(this.password);
}

class ConfirmPasswordEvent extends SignUpEvent {
  final String confirmPassword;
  ConfirmPasswordEvent(this.confirmPassword);
}

class ResetSignUpEvent extends SignUpEvent {}
