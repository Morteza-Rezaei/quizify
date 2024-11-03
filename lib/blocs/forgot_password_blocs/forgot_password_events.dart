abstract class ForgotPasswordEvent {
  const ForgotPasswordEvent();
}

class EmailEvent extends ForgotPasswordEvent {
  final String email;
  EmailEvent(this.email);
}

class ResetForgotPasswordEvent extends ForgotPasswordEvent {}

class ForgotPasswordLoadingEvent extends ForgotPasswordEvent {
  final bool isLoading;
  ForgotPasswordLoadingEvent(this.isLoading);
}
