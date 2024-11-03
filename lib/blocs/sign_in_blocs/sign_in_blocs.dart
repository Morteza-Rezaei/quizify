import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizify/blocs/sign_in_blocs/sign_in_events.dart';
import 'package:quizify/blocs/sign_in_blocs/sign_in_states.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(const SignInState()) {
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
    on<ResetSignInEvent>(_resetEvent);
    on<LoadingEvent>(_toggleLoadingEvent);
  }

  void _emailEvent(EmailEvent event, Emitter<SignInState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<SignInState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _resetEvent(ResetSignInEvent event, Emitter<SignInState> emit) {
    emit(const SignInState());
  }

  void _toggleLoadingEvent(LoadingEvent event, Emitter<SignInState> emit) {
    emit(state.copyWith(isLoading: event.isLoading));
  }
}
