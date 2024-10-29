abstract class ForgotPasswordEvent {
  const ForgotPasswordEvent();
}

class EmailEvent extends ForgotPasswordEvent {
  final String email;
  EmailEvent(this.email);
}

class ResetForgotPasswordEvent extends ForgotPasswordEvent {}
