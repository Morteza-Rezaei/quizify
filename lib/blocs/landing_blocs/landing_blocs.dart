import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizify/blocs/landing_blocs/landing_evets.dart';
import 'package:quizify/blocs/landing_blocs/landing_states.dart';

class LandingBlocs extends Bloc<LandingEvents, LandingStates> {
  LandingBlocs() : super(LandingStates()) {
    on<LandingEvents>(_landingEvents);
  }

  void _landingEvents(LandingEvents event, Emitter<LandingStates> emit) {
    // Emits a new state, preserving the current page index
    emit(LandingStates(pageIndex: state.pageIndex));

    // Logging the page index for debug purposes
    //print('Page Index: ${state.pageIndex}');
  }
}
