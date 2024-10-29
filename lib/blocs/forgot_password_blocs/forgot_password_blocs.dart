import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizify/blocs/forgot_password_blocs/forgot_password_events.dart';
import 'package:quizify/blocs/forgot_password_blocs/forgot_password_states.dart';

class ForgotPasswordBlocs
    extends Bloc<ForgotPasswordEvent, ForgotPasswordStates> {
  ForgotPasswordBlocs() : super(const ForgotPasswordStates()) {
    on<EmailEvent>(_emailEvent);
    on<ResetForgotPasswordEvent>(_resetEvent);
  }

  void _emailEvent(EmailEvent event, Emitter<ForgotPasswordStates> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _resetEvent(
      ResetForgotPasswordEvent event, Emitter<ForgotPasswordStates> emit) {
    emit(const ForgotPasswordStates());
  }
}
