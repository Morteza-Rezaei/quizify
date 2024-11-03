import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizify/blocs/sign_up_blocs/sign_up_events.dart';
import 'package:quizify/blocs/sign_up_blocs/sign_up_states.dart';

class SignUpBlocs extends Bloc<SignUpEvent, SignUpStates> {
  SignUpBlocs() : super(const SignUpStates()) {
    on<UserAvatarEvent>(_userAvatarEvent);
    on<UserNameEvent>(_userNameEvent);
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
    on<ConfirmPasswordEvent>(_confirmPasswordEvent);
    on<ResetSignUpEvent>(_resetEvent);
    on<SignUpLoadingEvent>(_toggleLoadingEvent);
  }

  void _userAvatarEvent(UserAvatarEvent event, Emitter<SignUpStates> emit) {
    emit(state.copyWith(userAvatar: event.userAvatar));
  }

  void _userNameEvent(UserNameEvent event, Emitter<SignUpStates> emit) {
    emit(state.copyWith(userName: event.userName));
  }

  void _emailEvent(EmailEvent event, Emitter<SignUpStates> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<SignUpStates> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _confirmPasswordEvent(
      ConfirmPasswordEvent event, Emitter<SignUpStates> emit) {
    emit(state.copyWith(confirmPassword: event.confirmPassword));
  }

  void _resetEvent(ResetSignUpEvent event, Emitter<SignUpStates> emit) {
    emit(const SignUpStates());
  }

  void _toggleLoadingEvent(
      SignUpLoadingEvent event, Emitter<SignUpStates> emit) {
    emit(state.copyWith(isLoading: event.isLoading));
  }
}
